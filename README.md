# SavingsBank Smart Contract

This repository contains a simple Solidity smart contract called **SavingsBank**.  
It allows users to deposit Ether into the contract, check the balance, and lets only the contract owner withdraw funds.

## Ownership Logic

- When the contract is deployed, the **deployer’s address** is stored as the `owner`.
- The `withdraw` function uses the `require` statement to enforce ownership:
  ```solidity
  require(msg.sender == owner, "Access Denied: Only owner can withdraw");
