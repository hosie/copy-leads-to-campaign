const fs = require('fs')
var YAML = require('js-yaml')


var inputFileName = process.argv[2]
var integrationName = process.argv[3]
var outputFileName = process.argv[4]

if (inputFileName) {
  console.log(`inputFileName = ${inputFileName}`)
}
else {
  console.error("inputFileName not provided")
  process.exit(1)
}


if(outputFileName) {
  console.log(`outputFileName = ${outputFileName}`)
}else {
  console.error("outputFileName not provided")
  process.exit(1)
}

var integrationYaml = fs.readFileSync(inputFileName,{encoding:'utf8'})
var integrationObj = YAML.load(integrationYaml)
integrationObj.integration.name = integrationName
var deploymentObj = {
  "integration_document": integrationObj
}
fs.writeFileSync(outputFileName,JSON.stringify(deploymentObj,null,2),{encoding:'utf8'})
