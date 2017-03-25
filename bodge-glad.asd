(in-package :cl-user)

(defpackage :bodge-glad.def
  (:use :cl :asdf))

(in-package :bodge-glad.def)


(defsystem bodge-glad
  :description "OpenGL 4.1 Core GLAD wrapper for cl-bodge system"
  :version "0.0.1"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (alexandria cffi)
  :serial t
  :components ((:file "glad")))
