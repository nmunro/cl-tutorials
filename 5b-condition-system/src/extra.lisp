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

(defun handle-infinite ()
  (restart-case
      (let ((result (div-fn 1 0)))
        (format t "~A~%" result))

    (just-continue ()
      nil)))

(defun alpha ()
  (handler-bind
      ((div-zero-error
         #'(lambda (err)
             (format t "Alpha-Error: ~A~%" (message err))
             (invoke-restart 'return-value 1))))
    (handle-infinite)))

(defun beta ()
  (handler-bind
      ((div-zero-error
         #'(lambda (err)
             (format t "Beta-Error: ~A~%" (message err))
             (invoke-restart 'recalc-using 2))))
    (handle-infinite)))

(defun gamma ()
  (handler-bind
      ((div-zero-error
         #'(lambda (err)
             (format t "Gamma-Error: ~A~%" (message err))
             (invoke-restart 'just-continue))))
    (handle-infinite)))
