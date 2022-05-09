(defsystem "2-rock-paper-scissors"
  :version "0.0.1"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ("rove")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Generate a skeleton for modern project"
  :in-order-to ((test-op (test-op "2-rock-paper-scissors/tests"))))

(defsystem "2-rock-paper-scissors/tests"
  :author "nmunro"
  :license "BSD3-Clause"
  :depends-on ("2-rock-paper-scissors"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for 2-rock-paper-scissors"
  :perform (test-op (op c) (symbol-call :rove :run c)))
