(defsystem "7a-file-io"
  :version "0.0.1"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Generate a skeleton for modern project"
  :in-order-to ((test-op (test-op "7a-file-io/tests"))))

(defsystem "7a-file-io/tests"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ("7a-file-io"
               :rove)
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for 7a-file-io"
  :perform (test-op (op c) (symbol-call :rove :run c)))
