pragma solidity ^0.5.0;


library SafeMath256 {
    function safeAdd(uint256 a, uint256 b) public pure returns (uint256 c) {
        c = a + b;
        require(c >= a);
    }
    function safeSub(uint256 a, uint256 b) public pure returns (uint256 c) {
        require(b <= a);
        c = a - b;
    }
    function safeMul(uint256 a, uint256 b) public pure returns (uint256 c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function safeDiv(uint256 a, uint256 b) public pure returns (uint256 c) {
        require(b > 0);
        c = a / b;
    }
}


library SafeMath32 {
    function safeAdd(uint32 a, uint32 b) public pure returns (uint32 c) {
        c = a + b;
        require(c >= a);
    }
    function safeSub(uint32 a, uint32 b) public pure returns (uint32 c) {
        require(b <= a);
        c = a - b;
    }
    function safeMul(uint32 a, uint32 b) public pure returns (uint32 c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function safeDiv(uint32 a, uint32 b) public pure returns (uint32 c) {
        require(b > 0);
        c = a / b;
    }
}


library SafeMath24 {
    function safeAdd(uint24 a, uint24 b) public pure returns (uint24 c) {
        c = a + b;
        require(c >= a);
    }
    function safeSub(uint24 a, uint24 b) public pure returns (uint24 c) {
        require(b <= a);
        c = a - b;
    }
    function safeMul(uint24 a, uint24 b) public pure returns (uint24 c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function safeDiv(uint24 a, uint24 b) public pure returns (uint24 c) {
        require(b > 0);
        c = a / b;
    }
}


library SafeMath16 {
    function safeAdd(uint16 a, uint16 b) public pure returns (uint16 c) {
        c = a + b;
        require(c >= a);
    }
    function safeSub(uint16 a, uint16 b) public pure returns (uint16 c) {
        require(b <= a);
        c = a - b;
    }
    function safeMul(uint16 a, uint16 b) public pure returns (uint16 c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function safeDiv(uint16 a, uint16 b) public pure returns (uint16 c) {
        require(b > 0);
        c = a / b;
    }
}


library SafeMath8 {
    function safeAdd(uint8 a, uint8 b) public pure returns (uint8 c) {
        c = a + b;
        require(c >= a);
    }
    function safeSub(uint8 a, uint8 b) public pure returns (uint8 c) {
        require(b <= a);
        c = a - b;
    }
    function safeMul(uint8 a, uint8 b) public pure returns (uint8 c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function safeDiv(uint8 a, uint8 b) public pure returns (uint8 c) {
        require(b > 0);
        c = a / b;
    }
}
