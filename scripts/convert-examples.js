

// convert-examples.js
//
// usage: convert-examples ex1.java ex2.java... Template.ftl > WhereToWrite.ftl
var fs = require('fs')

// the files
process.argv.splice(0,2)

files_to_add = process.argv

input_schema = files_to_add.splice(process.argv.length-1)


var template = require(input_schema[0])

// goal: populate the "Samples" key with an array of objects of form {Name : 'name', Source: 'Source'}

Samples = []
files_to_add.forEach(function(filename){
  var data = fs.readFileSync(filename, 'utf8');

  Samples.push({Name : filename.split('/').reverse()[0], Source : data})
})

template['Samples'] = Samples


console.log(JSON.stringify(template))
