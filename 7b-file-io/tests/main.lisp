(defpackage 7b-file-io/tests/main
  (:use :cl
        :7b-file-io
        :rove))
(in-package :7b-file-io/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :7b-file-io)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
  (format t "Testing~%")
    (ok (= 1 1))))