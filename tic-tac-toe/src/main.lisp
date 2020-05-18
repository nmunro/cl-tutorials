(defpackage tic-tac-toe
  (:use :cl)
  (:export #:game))
(in-package :tic-tac-toe)

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
  (equal (aref board (getf coords :x) (getf coords :y)) '-))

(defun cpu-turn (board)
  (let* ((x (random (array-dimension board 0) (make-random-state t)))
         (y (random (array-dimension board 0) (make-random-state t)))
         (coords `(:x ,x :y ,y)))
    (if (valid-position-p board coords)
        coords
        (cpu-turn board))))

(defun player-turn (board)
  (format t "Please enter X position: ")

  (let ((x (parse-integer (read-line) :junk-allowed t)))
    (unless (member x '(0 1 2))
      (player-turn board))

    (format t "Please enter Y position: ")

    (let ((y (parse-integer (read-line) :junk-allowed t)))
      (unless (member y '(0 1 2))
        (player-turn board))

      (let ((coords `(:x ,x :y ,y)))
        (if (valid-position-p board coords)
            coords
            (player-turn board))))))

(defun game-over-p (board)
  (flet ((draw-p (board)
           (let ((counter 0))
             (dotimes (x 3)
               (dotimes (y 3)
                 (when (equal '- (aref board x y))
                   (incf counter))))

             (= 0 counter))))

    (cond
      ; Rows
      ((and (equal (aref board 0 0) (aref board 0 1)) (equal (aref board 0 0) (aref board 0 2)) (not (equal (aref board 0 0) '-))) t)
      ((and (equal (aref board 1 0) (aref board 1 1)) (equal (aref board 1 0) (aref board 1 2)) (not (equal (aref board 1 0) '-))) t)
      ((and (equal (aref board 2 0) (aref board 2 1)) (equal (aref board 2 0) (aref board 2 2)) (not (equal (aref board 2 0) '-))) t)

      ; Columns
      ((and (equal (aref board 0 0) (aref board 1 0)) (equal (aref board 0 0) (aref board 2 0)) (not (equal (aref board 0 0) '-))) t)
      ((and (equal (aref board 0 1) (aref board 1 1)) (equal (aref board 0 1) (aref board 2 1)) (not (equal (aref board 0 1) '-))) t)
      ((and (equal (aref board 0 2) (aref board 1 2)) (equal (aref board 0 2) (aref board 2 2)) (not (equal (aref board 0 2) '-))) t)

      ; Diagonals
      ((and (equal (aref board 0 0) (aref board 1 1)) (equal (aref board 0 0) (aref board 2 2)) (not (equal (aref board 0 0) '-))) t)
      ((and (equal (aref board 0 2) (aref board 1 1)) (equal (aref board 0 2) (aref board 2 0)) (not (equal (aref board 0 2) '-))) t)

      ; Draw state
      ((draw-p board) t)

      (t nil))))

(defun game (&key (board (make-array '(3 3) :initial-element '-)))
  (let ((turn-counter (1+ (random 2 (make-random-state t)))))
    (do ()
        ((game-over-p board))

      (display-board board)

      (if (evenp turn-counter)
          (let ((coords (player-turn board)))
            (update-board board coords "x"))

          (let ((coords (cpu-turn board)))
            (update-board board coords "o")))

      (incf turn-counter))

    (display-board board)
    (format t "Game over!~%")))

(game)
