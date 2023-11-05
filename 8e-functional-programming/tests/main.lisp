(defpackage 8e-functional-programming/tests/main
  (:use :cl
        :8e-functional-programming
        :rove))
(in-package :8e-functional-programming/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :8e-functional-programming)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
  (format t "Testing~%")
    (ok (= 1 1))))