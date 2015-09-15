Cucumber = require 'cucumber'
fs = require 'fs'

module.exports = ->
    JsonFormatter = Cucumber.Listener.JsonFormatter()

    JsonFormatter.log = (string) ->
        #write out to file
        console.log 'attempting to output json to file.'
        filePath = 'test-results.json'
        fs.writeFile filePath, string, (err) ->
        	if err?
        		console.log err

        	console.log filePath + ' saved.'

        return

    @registerListener JsonFormatter
    return
