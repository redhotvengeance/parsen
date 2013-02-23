request = require 'request'
users = require './parsen/users'
objects = require './parsen/objects'
batch = require './parsen/batch'

checkForKeys = =>
  if !(@parseApplicationId and @parseRESTAPIKey)
    throw new Error('Woah, slow down there. Set your keys before getting all Parse-happy!')

module.exports.parseApplicationId = @parseApplicationId
module.exports.parseRESTAPIKey = @parseRESTAPIKey

module.exports.checkForKeys = checkForKeys

module.exports.createUser = users.createUser
module.exports.loginUser = users.loginUser
module.exports.getUser = users.getUser
module.exports.updateUser = users.updateUser
module.exports.deleteUser = users.deleteUser
module.exports.queryUsers = users.queryUsers

module.exports.createObject = objects.createObject
module.exports.getObject = objects.getObject
module.exports.updateObject = objects.updateObject
module.exports.deleteObject = objects.deleteObject
module.exports.queryObjects = objects.queryObjects

module.exports.batch = batch.batch
module.exports.createBatchObject = batch.createBatchObject
