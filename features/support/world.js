var World, chai, wd

chai = require('chai')

chai.should()

wd = require('wd')

World = function(callback) {
  this.browser = wd.remote()
  return this.browser.init({
    browserName: 'phantomjs'
  }, function() {
    return callback()
  })
}

exports.World = World