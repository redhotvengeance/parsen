request = require 'request'
parsen = require '../parsen'
utils = require '../utils/utils'

createObject = (className, data = {}, callback) =>
  parsen.checkForKeys()

  request
    method: 'POST'
    uri: "https://api.parse.com/1/classes/#{className}"
    headers:
      "X-Parse-Application-Id": parsen.parseApplicationId
      "X-Parse-REST-API-Key": parsen.parseRESTAPIKey
      "Content-Type": "application/json"
    body: JSON.stringify data
  , (error, response, body) =>
    callback error, response, body

getObject = (className, objectId, callback) =>
  parsen.checkForKeys()

  request
    method: 'GET'
    uri: "https://api.parse.com/1/classes/#{className}/#{objectId}"
    headers:
      "X-Parse-Application-Id": parsen.parseApplicationId
      "X-Parse-REST-API-Key": parsen.parseRESTAPIKey
      "Content-Type": "application/json"
  , (error, response, body) =>
    callback error, response, body

updateObject = (className, objectId, data, callback) =>
  parsen.checkForKeys()

  request
    method: 'PUT'
    uri: "https://api.parse.com/1/classes/#{className}/#{objectId}"
    headers:
      "X-Parse-Application-Id": parsen.parseApplicationId
      "X-Parse-REST-API-Key": parsen.parseRESTAPIKey
      "Content-Type": "application/json"
    body: JSON.stringify data
  , (error, response, body) =>
    callback error, response, body

deleteObject = (className, objectId, callback) =>
  parsen.checkForKeys()

  request
    method: 'DELETE'
    uri: "https://api.parse.com/1/classes/#{className}/#{objectId}"
    headers:
      "X-Parse-Application-Id": parsen.parseApplicationId
      "X-Parse-REST-API-Key": parsen.parseRESTAPIKey
      "Content-Type": "application/json"
  , (error, response, body) =>
    callback error, response, body

queryObjects = (className, params, callback) =>
  parsen.checkForKeys()

  request
    method: 'GET'
    uri: "https://api.parse.com/1/classes/#{className}?#{utils.serialize(params)}"
    headers:
      "X-Parse-Application-Id": parsen.parseApplicationId
      "X-Parse-REST-API-Key": parsen.parseRESTAPIKey
      "Content-Type": "application/json"
  , (error, response, body) =>
    callback error, response, body

module.exports.createObject = createObject
module.exports.getObject = getObject
module.exports.updateObject = updateObject
module.exports.deleteObject = deleteObject
module.exports.queryObjects = queryObjects
