var {defineSupportCode} = require('cucumber');

defineSupportCode(function({Given, Then, When}) {
  this.World = require('../support/world').World

  return Given(/^I am on Google$/, function(callback) {
    var browser
    browser = require('wd').remote()
    browser.on('status', console.log)
    browser.on('command', console.log)
    return browser.init(function() {
      return browser.get('http://google.com', callback)
    })
  })
})