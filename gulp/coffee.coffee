gulp        = require 'gulp'
browserify  = require 'gulp-browserify'
plumber     = require 'gulp-plumber'
concat      = require 'gulp-concat'
jade        = require 'gulp-jade'
livereload  = require 'gulp-livereload'

# Import Paths
paths = require './paths.coffee'

gulp.task 'coffee', ->
  stream = gulp.src(paths.src + 'coffee/manifest.coffee', { read: false })
    .pipe plumber()
    .pipe browserify
      debug:      true
      transform:  ['coffeeify', 'jadeify']
      extensions: ['.coffee', '.jade']
    .pipe concat('app.js')
    .pipe livereload()

  stream.pipe gulp.dest paths.dest + 'js/'
