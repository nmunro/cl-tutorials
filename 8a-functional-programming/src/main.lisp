(defpackage 8a-functional-programming
  (:use :cl)
  (:export #:main))

(in-package 8a-functional-programming)

;; Using `map'
;;; Listing and printing a basic list
(let ((l '(1 2 3 4 5)))
  (print l))

;;; Mapping over two lists
(let ((l '(1 2 3 4 5))
      (m '(6 7 8 9 10)))
  (print (map 'list #'(lambda (x y) `(,(1+ x) ,(1+ y))) l m)))

;;; Mapping/transforming the values of a list, specifying the output type of the list
(let ((l '(#\h #\e #\l #\l #\o)))
  (print (map 'string #'char-upcase l)))

;;; It could just as easily be a list
(let ((l '(#\h #\e #\l #\l #\o)))
  (print (map 'list #'char-upcase l)))

(let ((l '(#\h #\i)))
  (print (map 'string #'(lambda (x) x) l)))

;;; Creating lists of modified numbers using the 1+ function
(let ((l '(1 2 3 4 5)))
  (print (map 'list #'1+ l)))

;;; Storing it in a vector works too
(let ((l '(1 2 3 4 5)))
  (print (map 'vector #'1+ l)))

;; Using `mapcar'
;;; Creating lists of modified numbers using the 1+ function
(let ((l '(1 2 3 4 5)))
  (print (mapcar #'1+ l)))

;;; Using a lambda function to square the elements in the list
(let ((l '(1 2 3 4 5)))
  (print (mapcar #'(lambda (x) (* x x)) l)))

;;; Using a lambda function to cube the elements in the list
(let ((l '(1 2 3 4 5)))
  (print (mapcar #'(lambda (x) (* x x x)) l)))

;; Using `mapc', results are not returned, instead the original list is returned
;; results can be placed elsewhere
(defparameter *data* '())

(let ((l '(1 2 3 4 5)))
  (print (mapc #'(lambda (x) (push (* x x x) *data*)) l)))

;; Using `maplist'
(let ((l '(1 2 3 4 5)))
  (print (maplist #'(lambda (x) (* x x x)) l)))

;; Looping using maplist over two lists
(let ((l '(1 2 3 4 5))
      (m '(6 7 8 9 10)))
  (print (maplist #'(lambda (x y) `(,x ,y)) l m)))

;; Using `maplist'
(defparameter *data2* '())
(let ((l '(1 2 3 4 5))
      (m '(6 7 8 9 10)))
  (print (maplist #'(lambda (x y) (push (car x) *data2*)
                             (push (car y) *data2*))
                  l m)))

;;; Mapcan combines the results using nconc instead of list
(let ((l '(1 2 3 4 5)))
  (print (mapcan #'(lambda (x) (* x x)) l)))

;; It's easier to see the difference between mapcar and mapcan this way
;; This produces a list of lists
(let ((l '(1 2 3 4 5))
      (m '(6 7 8 9 10)))
  (print (mapcar #'(lambda (x y) `(,x, y)) l m)))

;; This produces a list of values
(let ((l '(1 2 3 4 5))
      (m '(6 7 8 9 10)))
  (print (mapcan #'(lambda (x y) `(,x, y)) l m)))

;; This creates a list of lists where each list is the cdr each time
(let ((l '(1 2 3 4 5))
      (m '(6 7 8 9 10)))
  (print (mapcon #'(lambda (x y) `(,x, y)) l m)))
