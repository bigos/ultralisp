(defpackage #:ultralisp/widgets/landing
  (:use #:cl)
  (:import-from #:str)
  (:import-from #:ultralisp/widgets/changelog)
  (:import-from #:ultralisp/metadata)
  (:import-from #:weblocks/widget
                #:defwidget
                #:render)
  (:import-from #:ultralisp/models/action)
  (:import-from #:weblocks/html
                #:with-html)
  (:import-from #:ultralisp/models/project
                #:is-enabled-p
                #:get-url
                #:get-name
                #:get-description
                #:get-all-projects)
  (:import-from #:weblocks/page
                #:get-title)
  (:import-from #:ultralisp/models/version
                #:version
                #:get-built-at
                #:get-number
                #:get-latest-versions)
  (:import-from #:metatilities
                #:format-date)
  (:import-from #:local-time
                #:timestamp-to-universal)
  (:import-from #:ultralisp/models/check
                #:get-project
                #:get-pending-checks)
  (:export
   #:make-landing-widget))
(in-package ultralisp/widgets/landing)


(defwidget landing-widget ()
  ())


(defun make-landing-widget ()
  (make-instance 'landing-widget))



(defun render-version (version)
  (check-type version version)
  
  (let* ((number (get-number version))
         (built-at (get-built-at version))
         (version-type (ultralisp/models/version:get-type version))
         (actions (ultralisp/models/action:get-version-actions version))
         (version-uri (format nil "/versions/~A" number)))
    (with-html
      (:tr
       (:td :class "version-cell"
            (case version-type
              (:ready
               (:a :href version-uri
                   number))
              (t (:span "No version yet"))))
       (:td :class "timestamp-cell"
            (if built-at
                (format-date "%Y-%m-%d %H:%M:%S UTC"
                             (timestamp-to-universal built-at))
                "Pending")))
      (:tr 
       (:td :class "changelog-cell"
            :colspan 2
            (ultralisp/widgets/changelog:render actions))))))


(defun get-projects-with-pending-checks ()
  "Returns all project which were added but not checked yet."
  (let ((checks (get-pending-checks)))
    (loop for check in checks
          for project = (get-project check)
          ;; if project is already enabled and included in a
          ;; previous version, we don't need to show it in
          ;; a pending checks list.
          unless (is-enabled-p project)
            collect project)))

(defun render-projects-table (projects)
  (with-html
    (:table :class "projects-list"
            (loop for project in projects
                  for description = (get-description project)
                  for url = (get-url project)
                  for name = (get-name project)
                  do (:tr
                      (:td :style "white-space: nowrap" (:a :href url
                                                            name))
                      (:td description))))))


(defmethod render ((widget landing-widget))
  (setf (get-title)
        "Ultralisp - Fast Common Lisp Repository")
  
  (with-html
    (:p "Ultralisp is a quicklisp distribution, updated as fast as you can push commits to the GitHub.")
    (:p "Work in progress, but you already can install some packages, like quickdist or weblocks from this repository.")
    (:h3 "How to use it")
    (:p "To use it, open your Lisp REPL and eval:")
    (:pre "(ql-dist:install-dist \"http://dist.ultralisp.org/\"
                      :prompt nil)")

    (:h3 "How to add my own project")

    (:a :class "button"
        :href "/github"
        :title "Add your projects from Github to Ultralisp distribution!"
        "Add projects from Github")

    (:h3 "Roadmap")

    (:ul
     (:li (:s "Plug in a real database to store projects' metadata and other information."))
     (:li (:s "Integration with the GitHub to add projects in one click."))
     (:li "Support for project sources other than GitHub.")
     (:li "Automatic distribution's ChangeLog generation.")
     (:li "Running tests for updated project and all dependent systems."))

    (let ((latest-versions (get-latest-versions))
          (all-projects (get-all-projects :only-enabled t))
          (pending-projects (get-projects-with-pending-checks)))
      (when pending-projects
        (:div :class "checks"
              (:h3 "Projects to be included in the next version")
              (render-projects-table pending-projects)))
      (when latest-versions
        (:div :class "latest-builds"
              (:h3 "Latest builds")

              (:table :class "versions-list"
                      (:tr
                       (:th :class "version-cell"
                            "Version")
                       (:th :class "timestamp-cell"
                            "Built-at"))
                      (mapc #'render-version
                            latest-versions))))

      (when all-projects
        (:h3 "Projects in the dist")
        (render-projects-table all-projects)))))


(defmethod weblocks/dependencies:get-dependencies ((widget landing-widget))
  (append
   (list
    (weblocks-lass:make-dependency
      `(.versions-list
        ((:or .version-cell .timestamp-cell)
         :vertical-align top
         :white-space nowrap
         :text-align left)
        (.timestamp-cell
         :width 100%)
        (.changelog-cell
         :padding-left 1.7em
         (.changelog
          :margin 0
          (p :margin 0)
          (.diff
           :margin 0
           (dt :margin 0
               :margin-right 0.6em
               :display inline-block)
           (dd :margin 0
               :display inline-block)))))))
   (call-next-method)))
