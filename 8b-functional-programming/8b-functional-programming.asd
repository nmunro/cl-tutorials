(defsystem "8b-functional-programming"
  :version "0.0.1"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Generate a skeleton for modern project"
  :in-order-to ((test-op (test-op "8b-functional-programming/tests"))))

(defsystem "8b-functional-programming/tests"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ("8b-functional-programming"
               :rove)
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for 8b-functional-programming"
  :perform (test-op (op c) (symbol-call :rove :run c)))
