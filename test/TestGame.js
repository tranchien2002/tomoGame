const Game = artifacts.require('Game');
// import { increaseTime } from ('./helpers/timeBlock.js')
const { mined } = require('./helpers/timeBlock');

contract('Game', ([ceo, user1, user2]) => {
  let game;
  before(async () => {
    game = await Game.new(ceo, { from: ceo });
  });

  describe('Contract information', () => {
    it('currentQuestion', async () => {
      let currentQues = await game.currentQuestion();
      assert.equal(currentQues, 0);
    });
  });

  describe('setBounty', () => {
    it('set bounty for game', async () => {
      await game.setBounty({ from: ceo, value: 5 * 10 ** 18 });
      bounty = await game.bounty();
      assert.equal(bounty, 5 * 10 ** 18);
    });
  });

  describe('Question', () => {
    before(async () => {
      await game.setQuestion(web3.utils.fromAscii('A'), { from: ceo });
      await game.answer(web3.utils.fromAscii('A'), { from: user1, value: 3 * 10 ** 18 });
      await game.answer(web3.utils.fromAscii('B'), { from: user2, value: 3 * 10 ** 18 });
    });

    it('question was set', async () => {
      let currentQues = await game.currentQuestion();
      let asked = await game.asked(currentQues);
      assert(asked, true);
    });

    it('question bounty', async () => {
      let questionBounty = await game.questionBounty();
      assert.equal(questionBounty.toString(), (6 * 10 ** 18).toString());
    });

    it('answer', async () => {
      await mined(5);
      await game.shareQuestionBounty({ from: ceo });
      user1Wincount = await game.winCount(user1);
      user2Wincount = await game.winCount(user2);

      assert.equal(user1Wincount, 1, 'user1 win');
      assert.equal(user2Wincount, 0, 'user2 lose');
    });
  });
});
