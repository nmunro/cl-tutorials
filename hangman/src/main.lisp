(defpackage hangman
  (:use :cl))
(in-package :hangman)

(defun pick-sitcom (sitcoms)
  (nth (random (length sitcoms) (make-random-state t)) sitcoms))

(defun get-letter (guessed-letters)
  (format t "Please enter a letter: ")

  (let ((in (read-line)))
    (cond
      ; If the user just hit enter
      ((= 0 (length in))
       (get-letter g:uessed-letters))

      ; If the first character entered has already been used
      ((member (char in 0) guessed-letters)
       (get-letter guessed-letters))

      ; Return the first character
      (t (char in 0)))))

(defun scramble (sitcom guessed-letters)
  (flet ((letter-or-underscore (letter)
           (if (or (member letter guessed-letters) (equal letter #\Space))
               letter
               #\_)))

    (map 'string #'letter-or-underscore sitcom)))

(defun game-over (lives scrambled-sitcom)
  (cond
    ((or (string= scrambled-sitcom "") (<= lives 0)) "CPU")
    ((eq nil (position #\_ scrambled-sitcom)) "Player")
    (t nil)))

(defun info (scrambled-sitcom lives guessed-letters)
  (format nil "Lives: ~A~%Letters: ~{~A~^, ~}~%~A~%" lives guessed-letters scrambled-sitcom))

(defun game (&key (sitcom nil) (lives 10) (guessed-letters'()))
  (unless sitcom
    (let ((sitcom (pick-sitcom '("friends" "the big bang theory" "frasier" "cheers" "how i met your mother" "the it crowd"))))
        (game :sitcom sitcom :lives lives :guessed-letters guessed-letters)))

  (let ((game-over (game-over lives (scramble sitcom guessed-letters))))
    (when game-over
      (return-from game (format nil "Game over!" game-over)))

    (format t "~A~%" (info (scramble sitcom guessed-letters) lives guessed-letters))

    (let ((letter (get-letter guessed-letters)))
        (if (equal nil (position letter sitcom))
            (game :sitcom sitcom :lives (1- lives) :guessed-letters (cons letter guessed-letters))
            (game :sitcom sitcom :lives lives      :guessed-letters (cons letter guessed-letters))))))
