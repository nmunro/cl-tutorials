(defpackage 9a-packages.stuff
  (:use :cl)
  (:export #:greeting
           #:greeting2
           #:greeting3
           #:greeting4
           #:greeting5
           #:greeting6))

(in-package 9a-packages.stuff)

(defun greeting (name)
  (format nil "Hi, ~A" name))

(defun greeting2 (name)
  (format nil "Hi, ~A" name))

(defun greeting3 (name)
  (format nil "Hi, ~A" name))

(defun greeting4 (name)
  (format nil "Hi, ~A" name))

(defun greeting5 (name)
  (format nil "Hi, ~A" name))

(defun greeting6 (name)
  (format nil "Hi, ~A" name))
