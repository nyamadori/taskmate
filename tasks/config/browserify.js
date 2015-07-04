var browserify = require('browserify');
var coffeeify = require('coffeeify');
var vueify = require('vueify');
var source = require('vinyl-source-stream');
var through = require('through')

module.exports = function(gulp, plugins, growl) {
  var extensions = ['.js', '.vue', '.coffee', '.json']

  gulp.task('babel:dev', function () {
    return browserify({
      entries: 'assets/js/app.coffee',
      extensions: ['.js', '.vue', '.coffee', '.json']
    })
    .transform(vueify)
    .transform(coffeeify)
    .bundle()
    .pipe(source('bundle.js'))
    .pipe(gulp.dest('.tmp/public/js'))
  })
}