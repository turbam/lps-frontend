;;;; lps-frontend.lisp

(in-package #:lps-frontend)

;;; "lps-frontend" goes here. Hacks and glory await!


(defparameter *random-color* sdl:*white*)
(defun mouse-rect-2d (parts)
  (sdl:with-init ()
    (sdl:window 800 800 :title-caption "Move a rectangle using the mouse")
    (setf (sdl:frame-rate) 220)    
    (sdl:with-events ()
      (:quit-event () t)
      (:key-down-event ()
       (sdl:push-quit-event))
      (:idle ()
	     (let ((coordinates (mapcar #'car parts)))	     
	       ;; Clear the display each game loop
	       (sdl:clear-display sdl:*black*)
	       
	       ;; Draw the box having a center at the mouse x/y coordinates.
	       (loop for i in coordinates do
		    (sdl:draw-circle-* (floor (+ 400 (car i)))
				       (floor (+ 400 (cadr i)))
				       13 :color sdl:*white*))

	       (setq parts (lps::misc parts))
	       ;; Redraw the display
	       (sdl:update-display))))))
