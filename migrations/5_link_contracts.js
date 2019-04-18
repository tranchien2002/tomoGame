var SafeMath256 = artifacts.require('SafeMath256')
var Factory = artifacts.require('Factory')
var Game = artifacts.require('Game')

module.exports = function (deployer) {
    deployer.deploy(Factory)
}