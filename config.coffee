exports.config =
  # See http://brunch.io/#documentation for docs.
  modules:
    wrapper: false
  files:
    javascripts:
      joinTo: 'app.js'
    stylesheets:
      joinTo: 'app.css'
    templates:
      joinTo:
        'js/templates.js': /.+\.jade$/
  plugins:
    jade:
      pretty: yes