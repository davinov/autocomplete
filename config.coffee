exports.config =
  # See http://brunch.io/#documentation for docs.
  modules:
    wrapper: false
  files:
    javascripts:
      joinTo: 'js/app.js'
    stylesheets:
      joinTo: 'css/app.css'
    templates:
      joinTo:
        'js/templates.js': /.+\.jade$/
  plugins:
    jade:
      pretty: yes