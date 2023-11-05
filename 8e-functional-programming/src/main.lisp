(defpackage 8e-functional-programming
  (:use :cl)
  (:export #:main))

(in-package 8e-functional-programming)

;; 1) What are they?

(print (lambda (x) (* x x)))

;; 2) Using them with higher order functions.
(mapcar (lambda (x) (* x x)) '(1 2 3 4 5))

(reduce (lambda (a b) (* a b)) '(1 2 3 4 5))
;;; is also equal to
(reduce #'* '(1 2 3 4 5))

(reduce (lambda (a b) (+ 1 (* a b))) '(1 2 3 4 5))

;; 3) Immediate invokation.
((lambda (x) (+ x x)) 9)

;;; print it out if you want
(let ((result ((lambda (x) (+ x x)) 9)))
  (print result))

((lambda (x) (+ x x)) ((lambda (y) (* y y)) 9))

;; 4) Binding to symbols.
(let ((square (lambda (x) (* x x))))
  (apply square '(9)))

(defun fn ()
  (lambda (x) (* x x)))

(defun fn2 ()
  (lambda (x y) (* x y)))

(apply (fn) '(8))
(apply (fn2) '(8 9))

;; 5) Closures.
(defun adder (num)
  (lambda (X) (* num x)))

(let ((add5 (adder 5)))
  (apply add5 '(5)))

;; 6) Currying
(defun curry (fn &rest args1)
  (lambda (&rest args2)
    (apply fn (append args1 args2))))

(expt 2 3)

(let ((cexpt (curry #'expt 2)))
  (apply cexpt '(3)))

(defun something (a b c)
  (+ a b c))

(let ((s (curry #'something 1 2)))
  (mapcar s '(1 2 3 4 5)))

(let* ((s1 (curry #'something 1))
       (s2 (curry s1 2))
       (s3 (curry s2 3)))
  (apply s3 '()))
