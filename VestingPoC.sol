// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IZKVerifier {
    function verifyProof(bytes memory proof, bytes32 publicSignal) external view returns (bool);
}

contract VestingPoC {
    IZKVerifier public verifier;
    IERC20 public token;
    address public owner; // Added owner for security

    mapping(bytes32 => bool) public isEligible;
    event TokensClaimed(address indexed user, uint256 amount);

    constructor(address _verifierAddress, address _tokenAddress) {
        verifier = IZKVerifier(_verifierAddress);
        token = IERC20(_tokenAddress);
        owner = msg.sender; // Set the contract deployer as the owner
    }

    // --- NEW FUNCTION ---
    // Allows the owner to add a new eligible person
    function addEligibleRecipient(bytes32 _signal) external {
        require(msg.sender == owner, "Only owner can call this function.");
        isEligible[_signal] = true;
    }

    function claimTokens(bytes memory proof, bytes32 publicSignal) external {
        require(isEligible[publicSignal], "Not an eligible recipient.");
        require(proof.length > 0, "Proof cannot be empty");

        isEligible[publicSignal] = false;
        token.transfer(msg.sender, 100 * 10**18); // Send 100 tokens

        emit TokensClaimed(msg.sender, 100 * 10**18);
    }
}
