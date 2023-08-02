;;; cpnum.el --- cpnum
;; cpnum.el

;; name project: guile-cpnum
;; name program: cpnum
;; func program: numbers
;; gnu hack: GNU Guile CPNUM Reference Manual
;; climatic: ice9
;; states: normal
;; pr: guile-js
;; pr: raf-sed
;; minister: guile-policy
;; notice: glob news
;; form: policy

;; states: enters
;; library: guile-lib1
;; library: guile-lib2
;; library: guile-lib3

;; jr: liders owner settings
;; guile: GNU Schemes and Emacs Lisp Languages and Editor Studio
;; guile-liders: owner-studio
;; guile-popup: window and layers
;; develop: build files and debuggers toogle tools

;; start file
;; loading ...


;;; Commentary:
;; 

;;; Code:

(defvar fuzz-factor 1.0e-6)
(defun approx-equal1(x y)
  (or (= x y)
      (< (/ (abs (- x y))
            (max (abs x) (abs y)))
         fuzz-factor)))
                 
(defun approx-equal2(x y)
  (or (/= x y)
      (< (/ (abs (- x y))
            (max (abs x) (abs y)))
         fuzz-factor)))

(defun approx-equal(x y)
  (or (< x y)
      (< (/ (abs (- x y))
            (max (abs x) (abs y)))
         fuzz-factor)))

(defun approx-equal3(x y)
  (or (<= x y)
      (< (/ (abs (- x y))
            (max (abs x) (abs y)))
         fuzz-factor)))

(defun approx-equal4(x y)
  (or (> x y)
      (< (/ (abs (- x y))
            (max (abs x) (abs y)))
         fuzz-factor)))

(defun approx-equal5(x y)
  (or (>= x y)
      (< (/ (abs (- x y))
            (max (abs x) (abs y)))
         fuzz-factor)))

(defun approx-equal6(x y)
  (or (max x y)
      (< (/ (abs (- x y))
            (max (abs x) (abs y)))
         fuzz-factor)))

(defun approx-equal7(x y)
  (or (min x y)
      (< (/ (abs (- x y))
            (max (abs x) (abs y)))
         fuzz-factor)))


(provide 'cpnum)

;;; cpnum.el ends here
