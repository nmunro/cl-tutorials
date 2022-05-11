(defsystem "5b-condition-system"
  :version "0.0.1"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ("rove")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Generate a skeleton for modern project"
  :in-order-to ((test-op (test-op "5b-condition-system/tests"))))

(defsystem "5b-condition-system/tests"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ("5b-condition-system"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for 5b-condition-system"
  :perform (test-op (op c) (symbol-call :rove :run c)))
