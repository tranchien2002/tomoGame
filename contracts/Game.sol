pragma solidity ^0.5.0;
import "./AccessControl.sol";
import "./SafeMath.sol";

contract Game is AccessControl {
    uint public bounty;
    using SafeMath256 for uint256;
    address payable[] public winners;
    bytes32 private seed;

    address payable[] public players;
    mapping (address=>uint) winCount;
    
    mapping (uint => mapping(address => bytes32)) public questionAnswer;
    mapping (uint => address payable[]) public questionPlayer;

    bytes32[10] private correctAnswer;
    address public questionAsker;
    uint8 public currentQuestion = 0;
    uint256 public questionBounty;
    uint public deadlineQuestion;

    event NewQuestion(uint8 currentQuestion);
    
    constructor() public {
        seed = keccak256(
            abi.encodePacked(blockhash(block.number - 1), msg.sender)
        );    
    }

    function setBounty() 
        public 
        payable 
        onlyCeo 
    {
        require(msg.value > 0, "bounty must be > 0");
        bounty = msg.value;
    }

    function _nextUint() 
        internal 
        returns (uint256) 
    {
        uint256 next = uint256(blockhash(block.number) ^ seed);
        seed = keccak256(abi.encodePacked(blockhash(block.number), seed));
        return next;
    }
    
    function randomRange(uint256 lower, uint256 upper)
        external
        returns (uint256)
    {
        return _nextUint() % (upper - lower) + lower;
    }

    modifier hasBounty() {
        require(bounty > 0, "Bounty must be > 0");
        _;
    }

    modifier beforeDeadline() {
        require(block.number <= deadlineQuestion);
        _;
    }

    function containArray(address payable[] storage array, address element) 
        internal 
        returns (bool) 
    {
        bool found = false;
        for(uint8 i = 0; i < array.length; i++) {
            if(array[i] == element) {
                found = true;
                break;
            }
        }
        return found;
    }


    function setQuestion(bytes32 _correctAnswer) 
        external 
    {
        correctAnswer[currentQuestion] = _correctAnswer;
        emit NewQuestion(currentQuestion);
        deadlineQuestion = block.number + 5;
    } 

    function answer(bytes32 _answer) 
        beforeDeadline 
        external 
        payable 
    {
        require(currentQuestion < 10, "one round has only 10 question");
        require(msg.value > 2 * 10 ** 18, "fee must be > 2 TOMO");
        require(containArray(questionPlayer[currentQuestion], msg.sender), "player has only one answer");
        questionBounty = questionBounty.safeAdd(msg.value);
        questionPlayer[currentQuestion].push(address(uint160(msg.sender)));
        questionAnswer[currentQuestion][msg.sender] = _answer;
        if(containArray(players, msg.sender)) {
            players.push(msg.sender);
        }
    }

    function shareQuestionBounty() 
        onlyCeo 
        external 
    {
        require(block.number > deadlineQuestion, "Sharing must be after deadline");
        require(currentQuestion < 10, "one round has only 10 question");
        uint bountySharing = questionBounty / questionPlayer[currentQuestion].length;
        for(uint8 i = 0; i < questionPlayer[currentQuestion].length; i++) {
            if(questionAnswer[currentQuestion][questionPlayer[currentQuestion][i]] == correctAnswer[currentQuestion]) {
                questionPlayer[currentQuestion][i].transfer(bountySharing);
                winCount[msg.sender].safeAdd(1);
            }

            if(currentQuestion == 9) {
                if(winCount[msg.sender] == 10) {
                    winners.push(msg.sender);
                }
            }
        }
    }

    function shareBounty() 
        onlyCeo 
        hasBounty 
        external 
    {
        require(block.number > deadlineQuestion, "Sharing must be after deadline");
        require(currentQuestion > 9, "Sharing bounty must be after 10 question");
        uint bountySharing = address(this).balance / winners.length;
        for(uint8 i = 0; i < winners.length; i++) {
           winners[i].transfer(bountySharing);
        }
    }
}
