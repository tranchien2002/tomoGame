pragma solidity ^0.5.0;

contract AccessControl {
    address payable public ceoAddress;

    constructor() public {
        ceoAddress = msg.sender;
    }

    modifier onlyCeo() {
        require(msg.sender == ceoAddress);
        _;
    }

    function setCeo(address payable _newCeo) external onlyCeo {
        require(_newCeo != address(0));
        ceoAddress = _newCeo;
    }
}
