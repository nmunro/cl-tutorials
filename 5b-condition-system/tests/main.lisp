(defpackage 5b-condition-system/tests/main
  (:use :cl
        :5b-condition-system
        :rove))
(in-package :5b-condition-system/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :5b-condition-system)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
  (format t "Testing~%")
    (ok (= 1 1))))