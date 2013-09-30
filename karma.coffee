module.exports = (config) ->
  config.set
    files: [
      'vendor/**/*.js'
      'bower_components/angular-mocks/angular-mocks.js'
      'app/**/*.coffee'
      'test/unit/**/*.coffee'
    ]
    frameworks: ['jasmine']
    browsers: ['Chrome']
    preprocessors:
      '**/*.coffee': ['coffee']
      'app/**/*.coffee': ['coverage']
    plugins: [
      'karma-junit-reporter'
      'karma-chrome-launcher'
      'karma-firefox-launcher'
      'karma-jasmine'
      'karma-coffee-preprocessor'
      'karma-coverage'
    ]
    reporters: ['dots', 'coverage']
    coverageReporter:
      type: 'text-summary'
      dir: '../coverage/'
    autoWatch: true
