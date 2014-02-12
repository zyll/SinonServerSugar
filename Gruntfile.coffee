module.exports = (grunt)->

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-mocha'

  grunt.initConfig
    coffeelint:
      app:
        files:
          src: ['*.coffee', 'test/**/*.coffee']
        options:
          max_line_length:
            level: 'warn'
          no_backticks:
            level: 'warn'
    jshint:
      manifest: ['*.json']
    coffee:
      assets:
        files:
          'sinon_server_sugar.js': ['sinon_server_sugar.coffee']
      test:
        files:
          'test/sinon_server_sugar.js': ['test/sinon_server_sugar.coffee']
    mocha:
      options:
        run: true
      test:
        src: ['test/test.html']

  grunt.registerTask 'default', ['jshint', 'coffeelint', 'coffee', 'mocha']
