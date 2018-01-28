(cl:defpackage :glad
  (:use :cl :cffi)
  (:export libglad
           init))
(in-package :glad)

(define-foreign-library (libglad
                         :search-path (asdf:system-relative-pathname :bodge-glad "."))
  (:darwin "libglad.dylib.bodged")
  (:unix "libglad.so.bodged")
  (:windows "libglad.dll.bodged"))

(cffi:defcfun ("gladLoadGL" load-glad) :int)

(defun init ()
  (assert (/= 0 (load-glad)) nil "Loading GLAD failed"))
