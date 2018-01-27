(asdf:defsystem bodge-glad
  :description "OpenGL 4.6 Core GLAD wrapper for cl-bodge system"
  :version "1.0.0"
  :author "Pavel Korolev"
  :mailto "dev@borodust.org"
  :license "MIT"
  :depends-on (alexandria cffi)
  :serial t
  :components ((:file "glad")))
