(defpackage 8f-functional-programming/tests/main
  (:use :cl
        :8f-functional-programming
        :rove))
(in-package :8f-functional-programming/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :8f-functional-programming)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
  (format t "Testing~%")
    (ok (= 1 1))))