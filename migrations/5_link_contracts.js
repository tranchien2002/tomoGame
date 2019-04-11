var SafeMath256 = artifacts.require('SafeMath256')
var Factory = artifacts.require('Factory')
var Game = artifacts.require('Game')

module.exports = function (deployer) {
    deployer.deploy(SafeMath256)
    deployer.link(SafeMath256, Factory)
    deployer.deploy(Factory)
    deployer.link(SafeMath256, Game)
    deployer.deploy(Game)
}