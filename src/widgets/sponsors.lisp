(defpackage #:ultralisp/widgets/sponsors
  (:use #:cl)
  (:import-from #:weblocks/widget
                #:defwidget
                #:render)
  (:import-from #:weblocks/page
                #:get-title)
  (:import-from #:weblocks/html
                #:with-html)
  (:export
   #:make-sponsors-widget))
(in-package ultralisp/widgets/sponsors)


(defwidget sponsors-widget ()
  ())


(defun make-sponsors-widget ()
  (make-instance 'sponsors-widget))


(defmethod render ((widget sponsors-widget))
  (setf (get-title)
        "Ultralisp - Sponsors")
  
  (with-html
    (:h2 "Gold Sponsors")
    (:p "This place is vacant. Links to Gold Supporters will also be placed on the front page of the site.")
    
    (:h2 "Grand Supporters")
    (:ul
     (:li (:a :href "https://www.hexstreamsoft.com"
              "Jean-Philippe Paradis"))
     (:li (:a :href "https://blackbrane.com"
              "Black Brane Systems Inc.")))
    
    (:p ("To get listed on this page, become a \"gold\" or \"grand\" sponsor on [Patreon](https://www.patreon.com/ultralisp) or [Liberapay](https://en.liberapay.com/Ultralisp.org) and donate money to support further development of the Ultralisp.org:"))
    (:div :class "donate"
          (:a :class "button success"
              :href "https://www.patreon.com/join/ultralisp"
              "Donate $$$ at Patreon")
          (:span :style "display: inline-block; width: 2em"
                 " ")
          (:a :class "button success"
              :href "https://en.liberapay.com/Ultralisp.org/donate"
              "Donate $$$ at Liberapay"))))
