(defsystem "tic-tac-toe"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "tic-tac-toe/tests"))))

(defsystem "tic-tac-toe/tests"
  :author ""
  :license ""
  :depends-on ("tic-tac-toe"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for tic-tac-toe"
  :perform (test-op (op c) (symbol-call :rove :run c)))
