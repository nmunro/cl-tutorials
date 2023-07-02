(defpackage 7c-file-io
  (:use :cl))

(in-package 7c-file-io)

; Writing using `write', entire string (plus quotes) is written
(with-open-file (out #p"~/out.txt" :direction :output :if-does-not-exist :create :if-exists :supersede)
  (write (format nil "Hello world!~%") :stream out))

; Writing using `write', everything in the iterable it written
(with-open-file (out #p"~/out.txt" :direction :output :if-does-not-exist :create :if-exists :supersede)
  (write (list #\H #\e #\l #\l #\o #\Space #\W #\o #\r #\l #\d #\!) :stream out))

; Writing using `write-char', a single char is written to the stream
(with-open-file (out #p"~/out.txt" :direction :output :if-does-not-exist :create :if-exists :supersede)
  (write-char #\a out))

; Writing using `write-sequence', a sequence is written to the steam (no quotes this time!)
(with-open-file (out #p"~/out.txt" :direction :output :if-does-not-exist :create :if-exists :supersede)
  (write-sequence (format nil "Hello world!~%") out))

; Writing using `write-sequence', a sequence is written to the steam (doesn't have to be a string)
(with-open-file (out #p"~/out.txt" :direction :output :if-does-not-exist :create :if-exists :supersede)
  (write-sequence (list #\1 #\2 #\3 #\4 #\5) out))

; Writing using `write-string', a string is written to the steam (no quotes this time!)
(with-open-file (out #p"~/out.txt" :direction :output :if-does-not-exist :create :if-exists :supersede)
  (write-string (format nil "Hello world!~%") out))

; Writing using `write-line', a string is written to the stream and automatically includes a new line
(with-open-file (out #p"~/out.txt" :direction :output :if-does-not-exist :create :if-exists :supersede)
  (write-line "Hello world!" out)
  (write-line "Goodbye world!" out)
  ; Writing only _part_ of a string
  (write-line "But wait, there's more..." out :start 4 :end 22))

(with-open-file (out #p"~/out2.txt" :direction :output :if-does-not-exist :create :if-exists :supersede :element-type 'unsigned-byte)
  (write-byte 72 out)
  (write-byte 101 out)
  (write-byte 108 out)
  (write-byte 108 out)
  (write-byte 111 out)
  (write-byte 32 out)
  (write-byte 119 out)
  (write-byte 111 out)
  (write-byte 114 out)
  (write-byte 108 out)
  (write-byte 100 out)
  (write-byte 33 out))

(with-open-file (out #p"~/out3.txt" :direction :output :if-does-not-exist :create :if-exists :supersede :element-type 'unsigned-byte)
  (let ((seq (list 72 101 108 108 111 32 119 111 114 108 100 33)))
    (write-sequence seq out)))

(with-open-file (out #p"~/out4.txt" :direction :output :if-does-not-exist :create :if-exists :supersede)
  (write-string "Hello world!" out))

(with-open-file (out #p"~/out4.txt" :direction :output :if-does-not-exist :create :if-exists :supersede)
  (write-string "Hi world!" out))

(with-open-file (out #p"~/out5.txt" :direction :output :if-does-not-exist :create :if-exists :overwrite)
  (write-string "Hello world!" out))

(with-open-file (out #p"~/out5.txt" :direction :output :if-does-not-exist :create :if-exists :overwrite)
  (write-string "Hi world!" out))
