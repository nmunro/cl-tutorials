(defpackage coin-toss/tests/main
  (:use :cl
        :coin-toss
        :rove))
(in-package :coin-toss/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :coin-toss)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
