request = require 'request'
parsen = require '../parsen'

batch = (requests) =>
  parsen.checkForKeys()

  data =
    requests: requests

  request
    method: 'POST'
    uri: "https://api.parse.com/1/batch"
    headers:
      "X-Parse-Application-Id": parsen.parseApplicationId
      "X-Parse-REST-API-Key": parsen.parseRESTAPIKey
      "Content-Type": "application/json"
    body: JSON.stringify data
  , (error, response, body) =>
    callback error, response, body

createBatchObject = (method, className, data = {}) =>
  {
    method: method
    path: "/1/classes/#{className}"
    body: data
  }

module.exports.batch = batch
module.exports.createBatchObject = createBatchObject
