;;;; lps-frontend.asd

(asdf:defsystem #:lps-frontend
  :description "Describe lps-frontend here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :depends-on (#:lispbuilder-sdl
               #:lps)
  :serial t
  :components ((:file "package")
               (:file "lps-frontend")))

