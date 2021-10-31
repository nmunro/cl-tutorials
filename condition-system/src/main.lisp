(defpackage condition-system-5a
  (:use :cl))
(in-package :condition-system-5a)

(define-condition file-io-error (error)
  ((message :initarg :message :reader message)))

(define-condition another-file-io-error (error)
  ((message :initarg :message :reader message)))

(defun fake-io (&key (fail nil fail-p) (message "Nope!"))
  (cond
    ((not fail-p)
     (if (evenp (random 100))
         (error 'file-io-error :message message)
         "Success"))

    (fail
     (error 'another-file-io-error :message message))

    (t "success")))

(defun read-new-value ()
  (format t "Enter a new value: ")
  (force-output)
  (multiple-value-list (eval (read))))

(let ((fail t))
  (restart-case (fake-io :fail fail)
    (do-nothing ()
      :report "Return String"
      "Done with this")

    (retry-without-errors (new-fail)
      :report "Accept User Input"
      :interactive read-new-value
      (fake-io :fail new-fail))))

(handler-case (fake-io :fail t)
  (file-io-error () (fake-io :fail nil))
  (another-file-io-error () (fake-io :fail nil)))
