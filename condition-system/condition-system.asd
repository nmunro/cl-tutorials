(defsystem "condition-system"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "condition-system/tests"))))

(defsystem "condition-system/tests"
  :author ""
  :license ""
  :depends-on ("condition-system"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for condition-system"
  :perform (test-op (op c) (symbol-call :rove :run c)))
