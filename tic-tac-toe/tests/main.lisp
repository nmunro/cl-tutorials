(defpackage tic-tac-toe/tests/main
  (:use :cl
        :tic-tac-toe
        :rove))
(in-package :tic-tac-toe/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :tic-tac-toe)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
