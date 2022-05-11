(defpackage 6a-macros/tests/main
  (:use :cl
        :6a-macros
        :rove))
(in-package :6a-macros/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :6a-macros)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
  (format t "Testing~%")
    (ok (= 1 1))))