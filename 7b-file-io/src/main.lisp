(defpackage 7b-file-io
  (:use :cl))

(in-package 7b-file-io)

; Get 15 characters from the stream
(with-open-file (in #p"~/quicklisp/local-projects/cl-tutorials/7b-file-io/src/main.lisp")
  (let ((data (make-array 15 :initial-element nil)))
    (read-sequence data in)
    (format t "~A~%" data)))

; Get all characters from the stream
(with-open-file (in #p"~/quicklisp/local-projects/cl-tutorials/7b-file-io/src/main.lisp")
  (let ((data (make-array (file-length in) :initial-element nil)))
    (read-sequence data in)
    (format t "~A~%" data)))

; Get 15 characters starting from the 15th
(with-open-file (in #p"~/quicklisp/local-projects/cl-tutorials/7b-file-io/src/main.lisp")
  (let ((data (make-array 15 :initial-element nil)))
    (file-position in 15)
    (read-sequence data in)
    (format t "~A~%" data)))

; reads macro to simplfy read-sequence
(defmacro reads (stream length &key (offset 0))
  (let ((data (gensym)))
    `(let ((,data (make-array ,length :initial-element nil)))
       (file-position ,stream ,offset)
       (read-sequence ,data ,stream)
       ,data)))

; read 15 bytes
(with-open-file (in #p"~/quicklisp/local-projects/cl-tutorials/7b-file-io/src/main.lisp")
  (reads in 15))

; read all bytes
(with-open-file (in #p"~/quicklisp/local-projects/cl-tutorials/7b-file-io/src/main.lisp")
  (reads in (file-length in)))

; read 15 bytes from offset 15
(with-open-file (in #p"~/quicklisp/local-projects/cl-tutorials/7b-file-io/src/main.lisp")
  (reads in 15 :offset 15))
