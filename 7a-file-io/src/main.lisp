(defpackage 7a-file-io
  (:use :cl)
  (:export #:main))

(in-package 7a-file-io)

; Printing the first line
(let ((in (open #p"~/quicklisp/local-projects/cl-tutorials/7a-file-io/src/main.lisp")))
  (format t "~A~%" (read-line in))
  (close in))

; Printing the first two lines
(let ((in (open #p"~/quicklisp/local-projects/cl-tutorials/7a-file-io/src/main.lisp")))
  (format t "~A~%" (read-line in))
  (close in))

; Printing the whole file
(let ((in (open #p"~/quicklisp/local-projects/cl-tutorials/7a-file-io/src/main.lisp")))
  (loop :for line = (read-line in nil)
        :while line
        :do (format t "~A~%" line))
  (close in))

; Handling files that don't exist
(let ((in (open #p"~/quicklisp/local-projects/cl-tutorials/7a-file-io/src/main2.lisp" :if-does-not-exist nil)))
  (when in
    (loop :for line = (read-line in nil)
        :while line
        :do (format t "~A~%" line))
    (close in)))

; Using macros
(with-open-file (in #p"~/quicklisp/local-projects/cl-tutorials/7a-file-io/src/main.lisp" :if-does-not-exist nil)
  (when in
    (loop :for line = (read-line in nil)
        :while line
        :do (format t "~A~%" line))))

; Macros with errors being thrown
(with-open-file (in #p"~/quicklisp/local-projects/cl-tutorials/7a-file-io/src/main2.lisp")
  (when in
    (loop :for line = (read-line in nil)
        :while line
        :do (format t "~A~%" line))))

; Macros reading characters, not lines
(with-open-file (in #p"~/quicklisp/local-projects/cl-tutorials/7a-file-io/src/main.lisp")
  (when in
    (loop :for char = (read-char in nil)
        :while char
        :do (format t "~A~%" char))))
