(defsystem "4c-tic-tac-toe"
  :version "0.0.1"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on (:meq
               :rove)
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Generate a skeleton for modern project"
  :in-order-to ((test-op (test-op "4c-tic-tac-toe/tests"))))

(defsystem "4c-tic-tac-toe/tests"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ("4c-tic-tac-toe"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for 4c-tic-tac-toe"
  :perform (test-op (op c) (symbol-call :rove :run c)))
