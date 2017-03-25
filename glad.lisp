(in-package :bodge-glad.def)

(defpackage :glad
  (:use :cl :cffi)
  (:export init))

(in-package :glad)


(define-foreign-library (libglad
                         :search-path (asdf:component-pathname
                                       (asdf:find-system :bodge-glad)))
  (:darwin "libglad.dylib")
  (:unix "libglad.so")
  (:windows "libglad.dll"))

(use-foreign-library libglad)

(defun init ()
  (assert (/= 0 (cffi:foreign-funcall "gladLoadGL" :int)) nil "Loading GLAD failed"))
