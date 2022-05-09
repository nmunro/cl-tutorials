(defsystem "tic-tac-toe-clos"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "tic-tac-toe-clos/tests"))))

(defsystem "tic-tac-toe-clos/tests"
  :author ""
  :license ""
  :depends-on ("tic-tac-toe-clos"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for tic-tac-toe-clos"
  :perform (test-op (op c) (symbol-call :rove :run c)))
