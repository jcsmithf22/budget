# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "chartkick", to: "chartkick.js", preload: false
pin "Chart.bundle", to: "Chart.bundle.js", preload: false
pin "insights", to: "insights.js", preload: false
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@floating-ui/dom", to: "@floating-ui--dom.js" # @1.6.11
pin "@floating-ui/core", to: "@floating-ui--core.js" # @1.6.8
pin "@floating-ui/utils", to: "@floating-ui--utils.js" # @0.2.8
pin "@floating-ui/utils/dom", to: "@floating-ui--utils--dom.js" # @0.2.8
pin "stimulus-use" # @0.52.2
