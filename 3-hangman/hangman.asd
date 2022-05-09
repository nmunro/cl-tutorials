(defsystem "hangman"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "hangman/tests"))))

(defsystem "hangman/tests"
  :author ""
  :license ""
  :depends-on ("hangman"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for hangman"
  :perform (test-op (op c) (symbol-call :rove :run c)))
