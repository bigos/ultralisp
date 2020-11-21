(defpackage #:ultralisp/models/project-moderator
  (:use #:cl)
  (:import-from #:mito)
  (:import-from #:weblocks-auth/models
                #:get-nickname
                #:user)
  (:import-from #:ultralisp/models/project
                #:project2)
  (:import-from #:ultralisp/protocols/moderation
                #:is-moderator)
  (:export #:project-moderator
           #:project-id
           #:user-id
           #:moderator
           #:moderated-project
           #:user->projects))
(in-package ultralisp/models/project-moderator)


(defclass project-moderator ()
  ((project-id :col-type :bigint
               :initarg :project-id
               :reader project-id
               :references (project2 id)
               )
   (user-id :col-type :bigint
            :initarg :user-id
            :reader user-id
            :references (user id)))
  (:primary-key project-id user-id)
  (:metaclass mito:dao-table-class))


(defun moderator (project-moderator)
  (first
   (mito:retrieve-dao 'user
                      :id (user-id project-moderator))))

(defun user->projects (user)
  (check-type user user)
  (mito.dao:select-by-sql
   'project2
   "SELECT project2.* FROM project2
      JOIN project_moderator ON project2.id = project_moderator.project_id
     WHERE project_moderator.user_id = ?
       AND project2.latest = True"
   :binds (list (mito:object-id user))))

(defun moderated-project (project-moderator)
  (first
   (mito:retrieve-dao 'project2
                      :id (project-id project-moderator)
                      :latest "true")))


(defmethod print-object ((obj project-moderator) stream)
  (let ((user (moderator obj)))
    (print-unreadable-object (obj stream :type t)
      (format stream
              "~A"
              (get-nickname user)))))


(defmethod is-moderator ((user user) (project project2))
  (mito:retrieve-dao 'project-moderator
                     :project-id (mito:object-id project)
                     :project-id (mito:object-id project)))
