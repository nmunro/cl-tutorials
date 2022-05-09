(defpackage tic-tac-toe-clos/tests/main
  (:use :cl
        :tic-tac-toe-clos
        :rove))
(in-package :tic-tac-toe-clos/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :tic-tac-toe-clos)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
