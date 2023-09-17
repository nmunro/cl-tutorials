(defpackage 8d-functional-programming
  (:use :cl))

(in-package 8d-functional-programming)

(defclass Person ()
  ((name :initarg :name :initform "" :accessor name)
   (age  :initarg :age  :initform "" :accessor age)))

(defun make-person (name age)
  (make-instance 'Person :name name :age age))

(defmethod print-object ((object Person) stream)
  (print-unreadable-object (object stream)
    (format stream "~A: ~A" (name object) (age object))))

(defun pretty-print (person)
  (format nil "~A is ~A" (name person) (age person)))

(defun str-join (a b)
  (format nil "~A, ~A" a b))

(defparameter people `(,(make-person "Gary" 25)
                       ,(make-person "Fred" 35)))

(defun square (x)
  (* x x))

(print (mapcar #'1+ '(1 2 3 4 5)))
(print (mapcar #'square '(1 2 3 4 5)))

; this
(print (reduce #'+ (mapcar #'square '(1 2 3 4 5))))

; is equal to this
(print (+ (square 1) (square 2) (square 3) (square 4) (square 5)))

; Using objects
(print (mapcar #'name people))
(print (mapcar #'age people))
(print (mapcar #'pretty-print people))
(print (reduce #'str-join (mapcar #'pretty-print people)))

(defparameter data '((:url "https://google.com" :hits 5)
                     (:url "https://duckduckgo.com")
                     (:url "http://cuil.com" :hits 2)
                     (:url "http://ask.com" :hits 3)))

(defun fix-missing-hits (obj)
  (if (getf obj :hits)
      obj
      `(:url ,(getf obj :url) :hits 1)))

(defun combine (a b)
  `(:urls ,(append (getf a :urls (list (getf a :url))) (list (getf b :url)))
     :hits ,(+ (getf a :hits) (getf b :hits))))

(print (mapcar #'fix-missing-hops data))
(print (reduce #'combine (mapcar #'fix-missing-hits data)))
