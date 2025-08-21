# zk-Vest - Proof of Concept (PoC)

This repository contains the Proof of Concept for zk-Vest, a private, ZK-powered payroll and token vesting platform submitted for the Soundness Layer testnet.

## Live Demo

A live version of this PoC is deployed on Vercel: **[Try](https://test-self-alpha.vercel.app/)**

## PoC Overview

This PoC demonstrates the core on-chain functionality of the zk-Vest protocol. It includes:
- A simple frontend to connect a wallet and claim tokens.
- A smart contract (`VestingPoC.sol`) deployed on the Sepolia testnet.
- A mock ERC-20 token (`MockERC20.sol`) for testing the transfer of vested funds.

The frontend is network-aware and will prompt the user to switch to the Sepolia testnet if they are on the wrong network.

## Testing Instructions

To test this PoC manually, follow these steps:

**1. Prerequisites:**
   - Have a web3 wallet (like MetaMask) installed.
   - Switch your wallet's network to the **Sepolia Testnet**.
   - Obtain Sepolia ETH from a faucet (e.g., [sepoliafaucet.com](https://sepoliafaucet.com/)).

**2. Smart Contract Addresses (on Sepolia):**
   - **VestingPoC:** `0xE214A510a8Fd7c83ADb3821406128456d56bBF98`
   - **MockERC20:** `0xdCCfB288F10Dbf7c56E48BE39643C79f12dE32CD`

**3. Test the Live Demo:**
   - Go to the **[Live Demo](https://test-self-alpha.vercel.app/)**.
   - Click **"Connect Wallet"**. Your wallet should connect successfully.
   - Click **"Claim Tokens"**. MetaMask will prompt you to sign the transaction.
   - Once you approve, the transaction will be sent. After it confirms on the blockchain, you will receive an alert, and 100 Mock Tokens will be transferred to your wallet.
