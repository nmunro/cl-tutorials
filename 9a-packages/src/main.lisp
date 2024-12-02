(defpackage 9a-packages
  (:use :cl)
  (:import-from :9a-packages.stuff :greeting)
  (:export #:say-hi))

(in-package 9a-packages)

(defun say-hi (name)
  (format t "~A!~%" (greeting name)))
