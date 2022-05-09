(defpackage condition-system/tests/main
  (:use :cl
        :condition-system
        :rove))
(in-package :condition-system/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :condition-system)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
