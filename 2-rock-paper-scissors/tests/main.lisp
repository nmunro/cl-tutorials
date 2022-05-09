(defpackage 2-rock-paper-scissors/tests/main
  (:use :cl
        :2-rock-paper-scissors
        :rove))
(in-package :2-rock-paper-scissors/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :2-rock-paper-scissors)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
  (format t "Testing~%")
    (ok (= 1 1))))