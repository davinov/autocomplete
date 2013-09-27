# See http://brunch.io/#documentation for docs.
exports.config =
  modules:
    wrapper: false
  files:
    javascripts:
      joinTo:
        'js/app.js': /^app/
        'js/vendor.js': /^vendor/
    stylesheets:
      joinTo: 'css/app.css'
    templates:
      joinTo:
        'js/templates.js': /.+\.jade$/
  plugins:
    jade:
      pretty: yes
