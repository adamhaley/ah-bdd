module.exports = ->
	@World = require('../support/world').World

	@Given 'I am on Google', (callback) ->
		browser = require('wd').remote()
		browser.on 'status', console.log
		browser.on 'command', console.log
		browser.init ->
			browser.get 'http://google.com', callback

