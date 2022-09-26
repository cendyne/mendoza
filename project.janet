(declare-project
  :name "mendoza"
  :author "Calvin Rose"
  :license "MIT"
  :version "0.0.1"
  :url "https://github.com/bakpakin/mendoza"
  :repo "git+https://github.com/bakpakin/mendoza.git"
  :dependencies [
    "https://github.com/janet-lang/circlet.git"
    "https://github.com/janet-lang/spork.git"
  ])

(declare-binscript
  :main "mdz"
  :hardcode-syspath true)

(declare-source
  :source ["mendoza"])
