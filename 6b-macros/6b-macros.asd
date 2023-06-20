(defsystem "6b-macros"
  :version "0.0.1"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Generate a skeleton for modern project"
  :in-order-to ((test-op (test-op "6b-macros/tests"))))

(defsystem "6b-macros/tests"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ("6b-macros"
               :rove)
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for 6b-macros"
  :perform (test-op (op c) (symbol-call :rove :run c)))
