(defpackage 8b-functional-programming
  (:use :cl))

(in-package 8b-functional-programming)

(defclass album ()
  ((artist :initarg :artist :initform "" :accessor artist)
   (name   :initarg :name   :initform "" :accessor name)
   (rating :initarg :rating :initform "" :accessor rating)))

(defmethod print-object ((object album) stream)
  (print-unreadable-object (object stream)
    (format stream "~A: ~A (~A/10)" (artist object) (name object) (rating object))))

(print (remove 4 '(1 2 3 4 5 6 7 8 9 10)))
(print (remove '(1 2) '((1 2) (3 4) (5 6) (7 8) (9 10)) :test #'equal))
(print (remove '(1 2) '((1 2) (3 4) (5 6) (7 8) (9 10)) :test-not #'equal))
(print (remove 1 '(1 1 1 1 2 1 1 1 1) :count 4))
(print (remove 1 '(1 1 1 1 2 1 1 1 1) :count 4 :from-end t))
(print (remove 1 '(1 1 1 1 2 1 1 1 1) :count 4 :start 2))
(print (remove 1 '(1 1 1 1 2 1 1 1 1) :count 4 :start 2 :end 6))
(print (remove 1 '(1 1 1 1 2 1 1 1 1) :start 2 :end 6))

(defparameter *albums* nil)
(defparameter *nums* '(1 2 3 4 5 6 7 8 9 10))

(push (make-instance 'album :artist "Green Day" :name "American Idiot" :rating 6) *albums*)
(push (make-instance 'album :artist "Coheed And Cambria" :name "The Second Stage Turbine Blade" :rating 7) *albums*)
(push (make-instance 'album :artist "Fleetwood Mac" :name "Rumours" :rating 9) *albums*)
(print (remove 6 *albums* :test #'>= :key #'rating))
(print (remove-if #'(lambda (rating) (>= 6 rating)) *albums* :key #'rating))

(remove-if #'oddp *nums*)
(remove-if #'(lambda (x) (not (evenp x))) *nums*)

(remove-if #'evenp *nums*)
(remove-if #'(lambda (x) (not (oddp x))) *nums*)

(print (delete 6 *albums* :test #'>= :key #'rating))
(print (delete 6 *albums* :test-not #'>= :key #'rating))

(print (delete-if 6 *albums* :test-not #'>= :key #'rating))

(print (delete-if #'oddp *nums*))
(print (delete-if-not #'oddp *nums*))
