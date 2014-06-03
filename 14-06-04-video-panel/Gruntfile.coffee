# Wrapper function
module.exports = (grunt) ->

  #Initialize grunt
  grunt.initConfig

    # Read package.json
    pkg: grunt.file.readJSON("package.json")

    copy:
      build:
        files: [
          {
            expand: true
            cwd: 'src/img'
            src: '**/*',
            dest: 'build/img'
            # flatten: true
            # filter: 'isFile'
          }
          {
            "build/css/normalize.css": "src/css/vendor/normalize.css"
            "build/js/vendor/jquery-1.11.0.min.js": "src/js/vendor/jquery-1.11.0.min.js"
            "build/js/vendor/modernizr-2.7.1.min.js": "src/js/vendor/modernizr-2.7.1.min.js"
          }
        ]

      dist:
        files: [
          {
            expand: true
            cwd: 'src/img'
            src: '**/*',
            dest: 'dist/img'
            # flatten: true
            # filter: 'isFile'
          }
          {
            "dist/css/normalize.css": "src/css/vendor/normalize.css"
            "dist/js/vendor/jquery-1.11.0.min.js": "src/js/vendor/jquery-1.11.0.min.js"
            "dist/js/vendor/modernizr-2.7.1.min.js": "src/js/vendor/modernizr-2.7.1.min.js"
          }
        ]

    concat:
      build:
        files: [
          {
            'build/js/plugin.js':['src/js/vendor/input1.js','src/js/vendor/input2.js']
          }
        ]

      dist:
        files: [
          {
            'dist/js/plugin.js':['src/js/vendor/input1.js','src/js/vendor/input2.js']
          }
        ]

    stylus:
      build:
        options:
          compress: false
        files: [
          {
            "build/css/main.css": "src/css/main.styl"
          }
        ]

      dist:
        options:
          compress: false
        files: [
          {
            "dist/css/main.css": "src/css/main.styl"
          }
        ]

    coffee:
      build:
        options:
          bare: true
        files: [
          {
            "build/js/main.js": "src/js/main.coffee"
          }
        ]

      dist:
        options:
          bare: true
        files: [
          {
            "dist/js/main.js": "src/js/main.coffee"
          }
        ]

    jade:
      build:
        options:
          pretty: true
        files: [
          {
            "build/index.html": "src/index.jade"
          }
        ]

      dist:
        files: [
          {
            "dist/index.html": "src/index.jade"
          }
        ]

    sprite:
      options:
        spritepath: "../img/"
        newsprite: true

      build:
        options:
          imagepath: "build/img/slice"
          spritedest: "build/img"
        files: [
          {
            "build/css/main.css": "build/css/main.css"
          }
        ]

      dist:
        options:
          imagepath: "dist/img/slice"
          spritedest: "dist/img"
        files: [
          {
            "dist/css/main.css": "dist/css/main.css"
          }
        ]

    uglify:
      dist:
        files: [
          {
            "dist/js/main.js": "dist/js/main.js"
            # "dist/js/plugin.js": "dist/js/plugin.js"
          }
        ]

    cssmin:
      dist:
        files: [
          {
            "dist/css/main.css": "dist/css/main.css"
            "dist/css/normalize.css": "dist/css/normalize.css"
          }
        ]

    watch:
      options:
        livereload: true
      jade:
        files: ["src/*.jade"]
        tasks: ["jade:build"]
      stylus:
        files: ["src/css/**/*.styl"]
        tasks: ["stylus:build"]
      coffee:
        files: ["src/js/**/*.coffee"]
        tasks: ["coffee:build"]

    connect:
      options:
        port: 9000
        hostname: 'localhost'
        open: true

      build:
        options:
          base: 'build'

      dist:
        options:
          base: 'dist'

  # Load Grunt Dependencies
  require("load-grunt-tasks") grunt

  # load task
  grunt.registerTask "build", [
    "copy:build"
    # "concat:build"
    "jade:build"
    "stylus:build"
    "coffee:build"
    "sprite:build"
  ]

  grunt.registerTask "dist", [
    "copy:dist"
    # "concat:dist"
    "jade:dist"
    "stylus:dist"
    "sprite:dist"
    "coffee:dist"
    "cssmin:dist"
    "uglify:dist"
  ]

  # serve
  grunt.registerTask 'serve', (target) ->
    grunt.task.run [target, 'connect:' + target + ':keepalive'] if target

  # Create Default Task
  grunt.registerTask "default", ["build"]