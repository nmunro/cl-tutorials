(defpackage 8g-functional-programming
  (:use :cl))

(in-package 8g-functional-programming)

(defun build (&rest props)
  (lambda (prop &optional (setter nil) (value nil))
    (when setter
      (setf (getf props prop) val))
    (getf props prop)))

(defun extend (base &rest props)
  (let ((props (append `(:base ,base) props)))
    (lambda (prop &optional (setter nil) (val nil))
      (when setter
        (setf (getf props prop) val))

      (let ((local (getf props prop)))
        (if local
            local
            (apply base `(,prop)))))))

(defun get-property (obj prop)
  (apply obj `(,prop)))

(defun set-property (obj prop val)
  (apply obj `(,prop ,t ,val)))

(defun call (obj f &rest args)
  (apply (get-property obj f) (append `(,obj) args)))

(let* ((obj1 (build :name "NMunro"
                    :age 2345
                    :can-throw-axes (lambda (self) (>= (get-property self :age) 18))
                    :add (lambda (self num) (+ (get-property self :age) num))))
       (obj2 (extend obj1 :name "Bob" :age 17)))

  (format nil
          "Can ~A throw axes: ~A, also can ~A throw axes: ~A, add: ~A~%"
          (get-property obj2 :name)
          (call obj2 :can-throw-axes)
          (get-property obj1 :name)
          (call obj1 :can-throw-axes)
          (call obj1 :add 5)))
