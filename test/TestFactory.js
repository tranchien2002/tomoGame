const Factory = artifacts.require('Factory')

contract('Factory', ([ceo, user]) => {_
    let factory
    before(async () => {
        factory = await Factory.new({from: ceo}) 
    })

    describe('Contract information', () => {
        it('all games', async () => {
            let games = await factory.getAllGames()
            assert.equal(games.length, 0)
        }) 
    }) 
})