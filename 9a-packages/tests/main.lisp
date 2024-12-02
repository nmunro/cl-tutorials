(defpackage 9a-packages/tests/main
  (:use :cl
        :9a-packages
        :rove))
(in-package :9a-packages/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :9a-packages)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
  (format t "Testing~%")
    (ok (= 1 1))))