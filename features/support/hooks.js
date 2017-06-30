var Cucumber, fs

Cucumber = require('cucumber')

fs = require('fs')

module.exports = function() {
  var JsonFormatter
  JsonFormatter = Cucumber.Listener.JsonFormatter()
  JsonFormatter.log = function(string) {
    var filePath
    console.log('attempting to output json to file.')
    filePath = 'test-results.json'
    fs.writeFile(filePath, string, function(err) {
      if (err != null) {
        console.log(err)
      }
      return console.log(filePath + ' saved.')
    })
  }
  this.registerListener(JsonFormatter)
}