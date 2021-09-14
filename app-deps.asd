(DEFSYSTEM
 "app-deps"
 :CLASS
 :PACKAGE-INFERRED-SYSTEM
 :DEPENDS-ON
 ("3bmd"
  "40ants-doc"
  "40ants-doc/changelog"
  "40ants-doc/core"
  "40ants-doc/glossary"
  "40ants-doc/locatives"
  "40ants-doc/locatives/base"
  "40ants-doc/locatives/define-definer"
  "40ants-doc/locatives/dislocated"
  "40ants-doc/object-package"
  "40ants-doc/reference"
  "40ants-doc/reference-api"
  "40ants-doc/restart"
  "40ants-doc/source-api"
  "alexandria"
  "anaphora"
  "arrows"
  "babel"
  "babel-streams"
  "bordeaux-threads"
  "cffi"
  "chanl"
  "chipz"
  "chunga"
  "circular-streams"
  "cl+ssl"
  "cl-annot"
  "cl-base64"
  "cl-change-case"
  "cl-containers"
  "cl-cookie"
  "cl-cron"
  "cl-dbi"
  "cl-fad"
  "cl-gearman"
  "cl-inflector"
  "cl-info"
  "cl-info/core"
  "cl-interpol"
  "cl-markdown"
  "cl-mustache"
  "cl-package-locks"
  "cl-postgres"
  "cl-ppcre"
  "cl-ppcre-unicode"
  "cl-reexport"
  "cl-store"
  "cl-strings"
  "cl-syntax"
  "cl-syntax-annot"
  "cl-unicode"
  "cl-unicode/base"
  "cl-utilities"
  "cl-yandex-metrika"
  "clack"
  "clack-socket"
  "closer-mop"
  "closure-common"
  "cxml"
  "cxml/dom"
  "cxml/klacks"
  "cxml/xml"
  "dbi"
  "defmain"
  "defmain/changelog"
  "defmain/defmain"
  "dexador"
  "dissect"
  "docs-config"
  "docs-config/config"
  "documentation-utils"
  "drakma"
  "dynamic-classes"
  "esrap"
  "external-program"
  "f-underscore"
  "fare-quasiquote"
  "fare-quasiquote-extras"
  "fare-quasiquote-optima"
  "fare-quasiquote-readtable"
  "fare-utils"
  "fast-http"
  "fast-io"
  "flexi-streams"
  "function-cache"
  "global-vars"
  "group-by"
  "http-body"
  "introspect-environment"
  "ironclad"
  "iterate"
  "jonathan"
  "kebab"
  "lack"
  "lack-component"
  "lack-middleware-backtrace"
  "lack-middleware-mito"
  "lack-middleware-session"
  "lack-request"
  "lack-response"
  "lack-util"
  "lambda-fiddle"
  "lass"
  "legit"
  "lev"
  "link-header"
  "link-header/core"
  "lisp-namespace"
  "local-time"
  "local-time-duration"
  "log4cl"
  "log4cl-extras/appenders"
  "log4cl-extras/config"
  "log4cl-extras/context"
  "log4cl-extras/error"
  "log4cl-extras/json"
  "log4cl-extras/plain"
  "log4cl-extras/secrets"
  "log4cl-extras/utils"
  "lparallel"
  "mailgun"
  "mailgun/core"
  "md5"
  "metabang-bind"
  "metacopy"
  "metatilities"
  "metatilities-base"
  "mito"
  "mito-core"
  "mito-migration"
  "moptilities"
  "named-readtables"
  "net.didierverna.clon.core"
  "net.didierverna.clon.setup"
  "parenscript"
  "parse-declarations-1.0"
  "parse-number"
  "proc-parse"
  "prometheus"
  "prometheus.collectors.process"
  "prometheus.collectors.sbcl"
  "prometheus.formats.text"
  "puri"
  "pythonic-string-reader"
  "qlot"
  "qlot/errors"
  "qlot/install"
  "qlot/install/quicklisp"
  "qlot/logger"
  "qlot/main"
  "qlot/parser"
  "qlot/proxy"
  "qlot/server"
  "qlot/source"
  "qlot/source/base"
  "qlot/source/dist"
  "qlot/source/git"
  "qlot/source/github"
  "qlot/source/http"
  "qlot/source/ql"
  "qlot/source/ultralisp"
  "qlot/utils"
  "qlot/utils/asdf"
  "qlot/utils/ql"
  "qlot/utils/shell"
  "qlot/utils/tmp"
  "quantile-estimator"
  "quickdist"
  "quicklisp"
  "quri"
  "routes"
  "rutils"
  "salza2"
  "secret-values"
  "serapeum"
  "simple-inferiors"
  "slynk"
  "smart-buffer"
  "spinneret"
  "spinneret/cl-markdown"
  "split-sequence"
  "static-vectors"
  "str"
  "string-case"
  "swap-bytes"
  "sxql"
  "symbol-munger"
  "trivia"
  "trivia.balland2006"
  "trivia.level0"
  "trivia.level1"
  "trivia.level2"
  "trivia.quasiquote"
  "trivia.trivial"
  "trivial-backtrace"
  "trivial-cltl2"
  "trivial-features"
  "trivial-file-size"
  "trivial-garbage"
  "trivial-gray-streams"
  "trivial-indent"
  "trivial-macroexpand-all"
  "trivial-mimes"
  "trivial-timeout"
  "trivial-types"
  "trivial-utf-8"
  "trivial-with-current-source-form"
  "type-i"
  "uax-15"
  "uiop"
  "usocket"
  "uuid"
  "vom"
  "weblocks-auth/auth"
  "weblocks-auth/button"
  "weblocks-auth/conditions"
  "weblocks-auth/core"
  "weblocks-auth/github"
  "weblocks-auth/models"
  "weblocks-auth/utils"
  "weblocks-file-server"
  "weblocks-file-server/core"
  "weblocks-lass"
  "weblocks-lass/core"
  "weblocks-navigation-widget"
  "weblocks-navigation-widget/core"
  "weblocks-parenscript"
  "weblocks-parenscript/weblocks-parenscript"
  "weblocks-ui"
  "weblocks-ui/core"
  "weblocks-ui/form"
  "weblocks/actions"
  "weblocks/app"
  "weblocks/app-actions"
  "weblocks/app-dependencies"
  "weblocks/app-mop"
  "weblocks/commands"
  "weblocks/debug"
  "weblocks/dependencies"
  "weblocks/error-handler"
  "weblocks/hooks"
  "weblocks/html"
  "weblocks/js"
  "weblocks/js/base"
  "weblocks/js/jquery"
  "weblocks/linguistic/grammar"
  "weblocks/page"
  "weblocks/request"
  "weblocks/request-handler"
  "weblocks/response"
  "weblocks/routes"
  "weblocks/server"
  "weblocks/session"
  "weblocks/session-lock"
  "weblocks/session-reset"
  "weblocks/utils/i18n"
  "weblocks/utils/list"
  "weblocks/utils/misc"
  "weblocks/utils/string"
  "weblocks/utils/timing"
  "weblocks/utils/uri"
  "weblocks/utils/warn"
  "weblocks/variables"
  "weblocks/widget"
  "weblocks/widgets/base"
  "weblocks/widgets/dom"
  "weblocks/widgets/mop"
  "weblocks/widgets/render-methods"
  "weblocks/widgets/root"
  "with-output-to-stream"
  "woo"
  "xsubseq"
  "zs3"))