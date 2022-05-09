(defpackage 2-rock-paper-scissors
  (:use :cl)
  (:export #:main))

(in-package 2-rock-paper-scissors)

(defun get-player-choice (options)
  (format t "Please enter either -> ~{~A~^, ~}: " options)
  (force-output)

  (let ((choice (string-downcase (read-line))))
    (if (member choice options :test #'equal)
        choice
        (get-player-choice options))))

(defun game ()
  (let* ((options '("rock" "paper" "scissors"))
         (cpu-choice (nth (random (length options) (make-random-state t)) options))
         (player-choice (get-player-choice options)))

    (cond
      ; when a draw has occured
      ((equal cpu-choice player-choice)
       (format t "You entered: ~A, CPU entered: ~A. It's a draw!~%" player-choice cpu-choice))

      ; if user enters rock and cpu enters scissors
      ((and (equal player-choice "rock")
            (equal cpu-choice "scissors"))
       (format t "You entered: ~A, CPU entered: ~A. You win!~%" player-choice cpu-choice))

      ; if user enters paper and cpu enters rock
      ((and (equal player-choice "paper")
            (equal cpu-choice "rock"))
       (format t "You entered: ~A, CPU entered: ~A. You win!~%" player-choice cpu-choice))

      ; if user enters scissors and cpu enters rock
      ((and (equal player-choice "paper")
            (equal cpu-choice "rock"))
       (format t "You entered: ~A, CPU entered: ~A. You win!~%" player-choice cpu-choice))

      (t (format t "You entered: ~A, CPU entered: ~A. You loose!~%" player-choice cpu-choice)))))

(game)
