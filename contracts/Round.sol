pragma solidity ^0.5.0;
import "./AccessControl.sol";
import "./SafeMath.sol";
contract Round is AccessControl {
    uint public bounty;
    address payable[] public winners;
    using SafeMath256 for uint256;

    constructor() public {
        ceoAddress = msg.sender;
    }

    function setBounty() 
        external
        onlyCeo
        payable
    {
        bounty = bounty.safeAdd(msg.value);
    }

    modifier hasBounty() {
        require(bounty > 0, "Bounty must be > 0");
        _;
    }

    function winRound(address winner)
        external
    {
        bool found = false;
        for(uint8 i = 0; i < winners.length; i++) {
            if(winners[i] == winner) {
                found = true;
                break;
            }
        }

        if(!found) {
            winners.push(address(uint160(winner)));
        }
    }

    function shareBounty() 
        hasBounty
        onlyCeo
        external
    {
        uint bountySharing = address(this).balance / winners.length;
        for(uint8 i = 0; i < winners.length; i++) {
           winners[i].transfer(bountySharing);
        }
    }
}