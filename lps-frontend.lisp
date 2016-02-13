;;;; lps-frontend.lisp

(in-package #:lps-frontend)

;;; "lps-frontend" goes here. Hacks and glory await!


(defparameter *random-color* sdl:*white*)
(defun mouse-rect-2d (parts)
  (sdl:with-init ()
    (sdl:window 600 600 :title-caption "Lisp Particle Simulator"
		:fps (make-instance 'sdl:fps-timestep
				    :dt 2
				    :max-dt 100))
    (setf (sdl:frame-rate) 60)
    (sdl:initialise-default-font)
    (sdl:with-events ()
      (:quit-event () t)
      (:key-down-event ()
       (sdl:push-quit-event))
      (:idle ()
	     (let ((coordinates (mapcar #'car parts)))	     
	       ;; Clear the display each game loop
	       (sdl:clear-display sdl:*black*)
	       
	       ;;Draw a circle for each particle
	       (loop for i in coordinates do
		    (sdl:draw-circle-* (floor (+ 280 (car i)))
				       (floor (+ 280 (cadr i)))
				       13 :color sdl:*white*))
	       (sdl:with-timestep ()
				  (setq parts (lps::misc parts)))

	       ;;Status
	       (sdl:draw-string-solid-*
		(format nil "Number of particles: ~d" (length parts))
		10 10 :color sdl:*green*)

	       (sdl:draw-string-solid-*
		(format nil "FPS: ~d" (floor (sdl:average-fps)))
		10 20 :color sdl:*green*)

	       
	       ;; Redraw the display
	       (sdl:update-display))))))
