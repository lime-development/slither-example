// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Lock {
    uint public immutable unlockTime;
    address payable public immutable owner;

    event Withdrawal(uint amount, uint when);

    constructor(uint _unlockTime) payable {
        // We are using block.timestamp to ensure the unlock time is set in the future.
        // In Proof-of-Stake Ethereum, validators can slightly influence the timestamp,
        // but only within a bounded range. This check is generally safe for enforcing
        // simple time-based restrictions and prevents initializing the contract with a past unlock time.
        // slither-disable-next-line timestamp
        require(
            block.timestamp < _unlockTime,
            "Unlock time should be in the future"
        );

        unlockTime = _unlockTime;
        owner = payable(msg.sender);
    }

    function withdraw() public {
        // Uncomment this line, and the import of "hardhat/console.sol", to print a log in your terminal
        // console.log("Unlock time is %o and block timestamp is %o", unlockTime, block.timestamp);

        // We are using block.timestamp to check if the unlock time has passed.
        // Validators in Proof-of-Stake Ethereum can slightly influence the timestamp,
        // but only within a limited range. This comparison is generally safe for basic
        // time-lock logic that doesn’t require high-precision or external guarantees.
        // slither-disable-next-line timestamp
        require(block.timestamp >= unlockTime, "You can't withdraw yet");
        require(msg.sender == owner, "You aren't the owner");

        emit Withdrawal(address(this).balance, block.timestamp);

        owner.transfer(address(this).balance);
    }
}
