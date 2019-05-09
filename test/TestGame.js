const Game = artifacts.require('Game')

contract('Game', ([ceo, user]) => {
    let game
    before( async () => {
        console.log(ceo)
        game = await Game.new(ceo, {from: ceo})
    })

    describe('Contract information', () => {
        it('currentQuestion', async () => {
            let currentQues = await game.currentQuestion()
            assert.equal(currentQues, 0)
        }) 
    }) 

    describe('setBounty', () => {
        it('set bounty for game', async () => {
            await game.setBounty({from: ceo, value: 5 * 10 ** 18})
            bounty = await game.bounty()
            assert.equal(bounty, 5 * 10 ** 18)
        })
    })
})