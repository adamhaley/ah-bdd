# this.browser will be available in step definitions
# log status output from web driver
chai = require 'chai'
chai.should()

wd = require 'wd'
# chaiAsPromised.transferPromiseness = wd.transferPromiseness

World = (callback) ->
	@browser = wd.remote()
	# run the callback when we are done so cucumber knows we are ready
	@browser.init { browserName: 'phantomjs' }, ->
		callback()


exports.World = World
