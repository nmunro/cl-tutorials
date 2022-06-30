(defpackage error-handling
  (:use :cl))

(in-package :error-handling)

(define-condition div-zero-error (error)
  ((message :initarg :message :reader message)))

(defun div-fn (a b)
  (restart-case
    (if (/= b 0)
      (/ a b)
      (error 'div-zero-error :message "Can't divide by zero"))

    (return-zero ()
      0)

    (return-value (value)
      value)

    (recalc-using (value)
      (div-fn a value))))

(defun alpha ()
  (handler-bind
      ((div-zero-error
         #'(lambda (err)
             (format t "Alpha-Error: ~A~%" (message err))
             (invoke-restart 'return-zero))))
    (div-fn 1 0)))

(defun beta (val)
  (handler-bind
      ((div-zero-error
         #'(lambda (err)
             (format t "Beta-Error: ~A~%" (message err))
             (invoke-restart 'return-value val))))
    (div-fn 1 0)))

(defun gamma (val)
  (handler-bind
      ((div-zero-error
         #'(lambda (err)
             (format t "Gamma-Error: ~A~%" (message err))
             (invoke-restart 'recalc-using val))))
    (div-fn 1 0)))

(alpha)
(beta 1)
(gamma 2)
