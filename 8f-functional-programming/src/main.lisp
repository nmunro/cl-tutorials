(defpackage 8f-functional-programming
  (:use :cl))

(in-package 8f-functional-programming)

(defun person (name age)
  (lambda (property)
    (cond
      ((string= property 'name) name)
      ((string= property 'age) age))))

(defun get-property (object property)
  (apply object `(,property)))

(defun set-property (object property value)
  (cond
    ((string= property 'name) (person value (get-age object)))
    ((string= property 'age) (person (get-name object) value))))

(defun get-name (object)
  (get-property object 'name))

(defun set-name (object value)
  (set-property object 'name value))

(defun get-age (object)
  (get-property object 'age))

(defun set-age (object value)
  (set-property object 'age value))

(let ((p (person "Gary" 24)))
  (format t "~A is ~A~%" (get-name p) (get-age p))
  (setf p (set-name p "Bob"))
  (setf p (set-age p 18))
  (format t "~A is ~A~%" (get-name p) (get-age p)))
