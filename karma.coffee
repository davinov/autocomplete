module.exports = (config) ->
  config.set
    files: [
      'vendor/**/*.js'
      'bower_components/angular-mocks/angular-mocks.js'
      'public/js/partials.js'
      'app/**/*.coffee'
      'test/unit/**/*.spec.coffee'
    ]
    frameworks: ['jasmine']
    browsers: ['PhantomJS']
    preprocessors:
      '**/*.coffee': ['coffee']
      'app/**/*.coffee': ['coverage']
    plugins: [
      'karma-coffee-preprocessor'
      'karma-coverage'
      'karma-jasmine'
      'karma-phantomjs-launcher'
    ]
    reporters: ['dots', 'coverage']
    coverageReporter:
      type: 'lcov'
      dir: 'coverage/'
    autoWatch: true
