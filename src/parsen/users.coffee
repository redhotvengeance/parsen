request = require 'request'
parsen = require '../parsen'
utils = require '../utils/utils'

createUser = (username, password, data = {}, callback) =>
  parsen.checkForKeys()

  data.username = username
  data.password = password

  request
    method: 'POST'
    uri: "https://api.parse.com/1/users"
    headers:
      "X-Parse-Application-Id": parsen.parseApplicationId
      "X-Parse-REST-API-Key": parsen.parseRESTAPIKey
      "Content-Type": "application/json"
    body: JSON.stringify data
  , (error, response, body) =>
    callback error, response, body

loginUser = (username, password, callback) =>
  parsen.checkForKeys()

  params =
    "username": username
    "password": password

  request
    method: 'GET'
    uri: "https://api.parse.com/1/login?#{utils.serialize(params)}"
    headers:
      "X-Parse-Application-Id": parsen.parseApplicationId
      "X-Parse-REST-API-Key": parsen.parseRESTAPIKey
      "Content-Type": "application/json"
  , (error, response, body) =>
    callback error, response, body

getUser = (userId, callback) =>
  parsen.checkForKeys()

  request
    method: 'GET'
    uri: "https://api.parse.com/1/users/#{userId}"
    headers:
      "X-Parse-Application-Id": parsen.parseApplicationId
      "X-Parse-REST-API-Key": parsen.parseRESTAPIKey
      "Content-Type": "application/json"
  , (error, response, body) =>
    callback error, response, body

updateUser = (userId, sessionToken, data, callback) =>
  parsen.checkForKeys()

  request
    method: 'PUT'
    uri: "https://api.parse.com/1/users/#{userId}"
    headers:
      "X-Parse-Application-Id": parsen.parseApplicationId
      "X-Parse-REST-API-Key": parsen.parseRESTAPIKey
      "X-Parse-Session-Token": sessionToken
      "Content-Type": "application/json"
    body: JSON.stringify data
  , (error, response, body) =>
    callback error, response, body

deleteUser = (userId, sessionToken, callback) =>
  parsen.checkForKeys()

  request
    method: 'DELETE'
    uri: "https://api.parse.com/1/users/#{userId}"
    headers:
      "X-Parse-Application-Id": parsen.parseApplicationId
      "X-Parse-REST-API-Key": parsen.arseRESTAPIKey
      "X-Parse-Session-Token": sessionToken
      "Content-Type": "application/json"
  , (error, response, body) =>
    callback error, response, body

queryUsers = (params, callback) =>
  parsen.checkForKeys()

  request
    method: 'GET'
    uri: "https://api.parse.com/1/users?#{utils.serialize(params)}"
    headers:
      "X-Parse-Application-Id": parsen.parseApplicationId
      "X-Parse-REST-API-Key": parsen.parseRESTAPIKey
      "Content-Type": "application/json"
  , (error, response, body) =>
    callback error, response, body

module.exports.createUser = createUser
module.exports.loginUser = loginUser
module.exports.getUser = getUser
module.exports.updateUser = updateUser
module.exports.deleteUser = deleteUser
module.exports.queryUsers = queryUsers
