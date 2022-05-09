(defpackage tic-tac-toe-clos
  (:use :cl)
  (:export #:game))
(in-package :tic-tac-toe-clos)

(defun display-board (board)
  (dotimes (x 3)
    (dotimes (y 3)
      (if (= y 2)
          (format t "~A~%"  (aref board x y))
          (format t "~A | " (aref board x y))))
    (format t "~%")))

(defun update-board (board coords player)
  (setf (aref board (getf coords :x) (getf coords :y)) player))

(defun valid-position-p (board coords)
  (eql (aref board (getf coords :x) (getf coords :y)) '-))

(defun game-over-p (board)
  (flet ((draw-p (board)
          (dotimes (x 3)
            (dotimes (y 3)
              (when (eql '- (aref board x y))
                (return-from draw-p))))
          t))

    (cond
      ; Rows
      ((and (eql (aref board 0 0) (aref board 0 1)) (eql (aref board 0 0) (aref board 0 2)) (not (eql (aref board 0 0) '-))) t)
      ((and (eql (aref board 1 0) (aref board 1 1)) (eql (aref board 1 0) (aref board 1 2)) (not (eql (aref board 1 0) '-))) t)
      ((and (eql (aref board 2 0) (aref board 2 1)) (eql (aref board 2 0) (aref board 2 2)) (not (eql (aref board 2 0) '-))) t)

      ; Columns
      ((and (eql (aref board 0 0) (aref board 1 0)) (eql (aref board 0 0) (aref board 2 0)) (not (eql (aref board 0 0) '-))) t)
      ((and (eql (aref board 0 1) (aref board 1 1)) (eql (aref board 0 1) (aref board 2 1)) (not (eql (aref board 0 1) '-))) t)
      ((and (eql (aref board 0 2) (aref board 1 2)) (eql (aref board 0 2) (aref board 2 2)) (not (eql (aref board 0 2) '-))) t)

      ; Diagonals
      ((and (eql (aref board 0 0) (aref board 1 1)) (eql (aref board 0 0) (aref board 2 2)) (not (eql (aref board 0 0) '-))) t)
      ((and (eql (aref board 0 2) (aref board 1 1)) (eql (aref board 0 2) (aref board 2 0)) (not (eql (aref board 0 2) '-))) t)

      ; Draw state
      ((draw-p board) t)

      (t nil))))

(defclass player ()
  ((icon :initarg :icon :initform (error "Must provide an icon") :reader icon)))

(defclass human (player)
  ())

(defclass cpu (player)
  ())

(defgeneric turn (player board)
  (:documentation "Executes a player turn"))

(defmethod turn ((player human) board)
  (flet ((get-pos (character)
           (format t "Please enter a ~A: " character)
           (force-output)
           (parse-integer (read-line) :junk-allowed t)))
    (do* ((x (get-pos "X") (get-pos "X"))
          (y (get-pos "Y") (get-pos "Y"))
          (coords `(:x ,x :y ,y) `(:x ,x :y ,y)))
       ((and (member x '(0 1 2)) (member y '(0 1 2)) (valid-position-p board coords))
        coords))))

(defmethod turn ((player cpu) board)
  (do* ((x (random (array-dimension board 0)) (random (array-dimension board 0)))
        (y (random (array-dimension board 0)) (random (array-dimension board 0)))
        (coords `(:x ,x :y ,y) `(:x ,x :y ,y)))
       ((valid-position-p board coords)
        coords)))

(defun game ()
  (make-random-state t)

  (let ((board (make-array    '(3 3) :initial-element '-))
        (human (make-instance 'human :icon "X"))
        (cpu   (make-instance 'cpu   :icon "O")))
    (do ((turn-counter (1+ (random 2)) (1+ turn-counter)))
        ((game-over-p board))

      (display-board board)
      (format t "~%")
      (force-output)

      (if (evenp turn-counter)
          (update-board board (turn human board) (icon human))
          (update-board board (turn cpu   board) (icon cpu))))

    (display-board board)
    (format t "Game Over!~%")
    (force-output)))
