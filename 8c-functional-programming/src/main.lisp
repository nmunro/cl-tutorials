(defpackage 8c-functional-programming
  (:use :cl))

(in-package 8c-functional-programming)

; trivial example
(print (+ 1 2 3 4 5))

; Same example using reduce
(print (reduce #'+ '(1 2 3 4 5)))

; another trivial example
(print (- 1 2 3 4 5))

; Same example using reduce
(print (reduce #'- '(1 2 3 4 5)))

; Remember these three are the same
(print (reduce #'- '(1 2 3 4 5)))
(print (- 1 2 3 4 5))
(print (- 1 (- 2 (- 3 (- 4 5))))) ; is 3

; but order matters, because math does
(print (- 1 (- 2 (- 3 (- 4 5))))) ; is 3
; Not the same as
(print (- (- (- (- 1 2) 3) 4) 5)) ; is -13

; so gives us -13
(print (reduce #'- '(1 2 3 4 5)))
; but what if we wanted the 3 that the inverse order gives us?
(print (reduce #'- '(1 2 3 4 5 6 7 8 9 10) :from-end t)) ; we compute from the end instead of the beginning

(print (reduce #'+ '(1 2 3 4 5 6 7 8 9 10))) ; 55
(print (reduce #'+ '(1 2 3 4 5 6 7 8 9 10) :start 1)) ; 54
(print (reduce #'+ '(1 2 3 4 5 6 7 8 9 10) :end 9)) ; 45
(print (reduce #'+ '(1 2 3 4 5 6 7 8 9 10) :start 1 :end 9)) ; 44

; setting initial values
(print (reduce #'+ '() :initial-value 1))
; because what if you have only one value?
(print (reduce #'+ '(2))) ; will be 2

(print (reduce #'+ '(2) :initial-value 1)) ; will be 3, because the initial value was 1

; interactions with initial value and a complete list
(print (reduce #'+ (1 2 3 4 5) :initial-value 5)) ; is 20 because prior to 1, the value is 5, so 5 + 1 + 2 + 3 + 4 + 5...

; Adding in a :key function

(defun square (x)
  (* x x))

(print (reduce #'+ '(1 2 3 4 5) :key #'square)) ; equal to (+ (* 1 1) (* 2 2) (* 3 3) (* 4 4) (* 5 5))
(+ (* 1 1) (* 2 2) (* 3 3) (* 4 4) (* 5 5)) ; Equal to the above, but _lots_ more logic

; if we combine initial-value and key
(print (reduce #'+ '(1 2 3 4 5) :key #'square :initial-value 5))
; The initial value does not interact with the 'key' function

; lets quit numbers for now
(defun join-str (x y)
  (format nil "~A, ~A" x y))

(print (reduce #'join-str '("this" "is" "a" "string")))
