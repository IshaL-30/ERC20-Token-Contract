# MyToken Smart Contract

This repository contains the implementation of the `MyToken` ERC-20 token smart contract using Solidity. The contract is built using OpenZeppelin libraries for secure and standardized functionality. It includes additional functionality for owner-only operations such as minting, burning, approving, and transferring tokens.

## Features

- **ERC-20 Compliance**: Implements standard ERC-20 functions for token operations.
- **Owner-Only Operations**: Allows only the contract owner to perform specific functions like minting, burning, approving, and transferring tokens.
- **Account Management**: The contract stores and allows updates to account details, including the name, user ID, age, and account address of the owner.
- **Custom Token Decimals**: The token uses 5 decimals instead of the standard 18.

## Contract Overview

  ### 1. Constructor
  
  ```solidity
  constructor(string memory name, string memory symbol, uint age, address account) ERC20(name, symbol) Ownable(account)
  ```
  
  - Initializes the token with a name, symbol, age, and account address for the owner.
  - Mints an initial supply of tokens to the contract deployer (admin).
  - Sets the owner and admin of the contract.
  
  ### 2. Owner-Only Functions
  
  #### `updateAccountDetails`
  
  ```solidity
  function updateAccountDetails(string memory newName, string memory newUserId, uint newAge, address newAccount) external onlyOwner
  ```
  
  - Updates the details of the owner account.
  - Ensures the new account address is valid.
  
  #### `Mint`
  
  ```solidity
  function Mint(address receiver, uint256 amount) external onlyOwner
  ```
  
  - Mints new tokens to a specified receiver address.
  
  #### `Burn`
  
  ```solidity
  function Burn(uint256 amount) external onlyOwner
  ```
  
  - Burns a specified amount of tokens from the owner's balance.
  
  #### `Approve`
  
  ```solidity
  function Approve(address sender, uint256 amount) external onlyOwner
  ```
  
  - Approves a specified amount of tokens for a sender to spend on behalf of the owner.
  - Ensures the sender's address is valid.
  
  #### `TransferTokens`
  
  ```solidity
  function TransferTokens(address receiver, uint256 amount) external onlyOwner
  ```
  
  - Transfers tokens from the owner to a specified receiver.
  - Ensures the receiver's address is valid.
  
  #### `TransferFrom`
  
  ```solidity
  function TransferFrom(address sender, address receiver, uint256 amount) external onlyOwner
  ```
  
  - Transfers tokens from a sender to a receiver, ensuring both addresses are valid.
  
  ### 3. Overridden ERC-20 Function
  
  #### `decimals`
  
  ```solidity
  function decimals() public view virtual override returns (uint8)
  ```
  
  - Specifies the token to use 5 decimal places.

## Getting Started

### Installing

  Clone the repository:
  ```bash
  git clone https://github.com/IshaL-30/ERC20-Token-Contract.git
  ```

### Executing program
  Navigate to the project directory:
  
  ```bash
  cd ERC20-Token-Contract
  ```
  
  Compile the Solidity contract using a Solidity compiler:
  
  ```bash
  solc MyToken.sol --bin --abi --optimize -o ./build
  ```
  Deploy the compiled contract on an Ethereum network using tools like Remix or Hardhat.

### Interacting with the Contract

- The contract owner can mint, burn, approve, and transfer tokens using the provided functions.
- Account details can be updated by the owner at any time.

## Security Considerations

- The contract is designed to ensure that only the contract owner can perform sensitive operations.
- It is essential to keep the owner's private key secure to prevent unauthorized access.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.
