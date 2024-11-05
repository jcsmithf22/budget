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
# pin "stimulus-use" # @0.52.2
# pin "motion" # @10.18.0
# pin "@motionone/animation", to: "@motionone--animation.js" # @10.18.0
# pin "@motionone/dom", to: "@motionone--dom.js" # @10.18.0
# pin "@motionone/easing", to: "@motionone--easing.js" # @10.18.0
# pin "@motionone/generators", to: "@motionone--generators.js" # @10.18.0
# pin "@motionone/types", to: "@motionone--types.js" # @10.17.1
# pin "@motionone/utils", to: "@motionone--utils.js" # @10.18.0
# pin "hey-listen" # @1.0.8
# pin "tslib" # @2.8.1
