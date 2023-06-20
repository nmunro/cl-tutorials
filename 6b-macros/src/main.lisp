(defpackage 6b-macros
  (:use :cl))

(in-package 6b-macros)

(defmacro read-lines (stream)
  (let ((s (gensym)))
    `(when ,stream
       (loop :for ,s = (read-line ,stream nil)
             :while ,s
             :collect ,s))))

; Original without macro
(with-open-file (in #p"~/quicklisp/local-projects/cl-tutorials/6b-macros/src/main.lisp" :if-does-not-exist nil)
  (when in
    (loop :for line = (read-line in nil)
          :while line
          :do (format t "~A~%" line))))

; New with macro
(with-open-file (in #p"~/quicklisp/local-projects/cl-tutorials/6b-macros/src/main.lisp" :if-does-not-exist nil)
  (format t "~{~A~%~}~%" (read-lines in)))
