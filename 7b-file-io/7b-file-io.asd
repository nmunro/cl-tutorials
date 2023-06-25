(defsystem "7b-file-io"
  :version "0.0.1"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Generate a skeleton for modern project"
  :in-order-to ((test-op (test-op "7b-file-io/tests"))))

(defsystem "7b-file-io/tests"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ("7b-file-io"
               :rove)
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for 7b-file-io"
  :perform (test-op (op c) (symbol-call :rove :run c)))
