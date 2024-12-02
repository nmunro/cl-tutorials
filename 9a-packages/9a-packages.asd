(defsystem "9a-packages"
  :version "0.0.1"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "stuff")
                 (:file "main"))))
  :description "Generate a skeleton for modern project"
  :in-order-to ((test-op (test-op "9a-packages/tests"))))

(defsystem "9a-packages/tests"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ("9a-packages"
               :rove)
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for 9a-packages"
  :perform (test-op (op c) (symbol-call :rove :run c)))
