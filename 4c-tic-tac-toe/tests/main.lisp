(defpackage 4c-tic-tac-toe/tests/main
  (:use :cl
        :4c-tic-tac-toe
        :rove))
(in-package :4c-tic-tac-toe/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :4c-tic-tac-toe)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
  (format t "Testing~%")
    (ok (= 1 1))))