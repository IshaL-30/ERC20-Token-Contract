// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    struct AccountDetails {
        string name;
        string userId;
        uint age;
        address accountAddress;
    }

    AccountDetails public Account_Details;
    address public Admin;

    constructor(string memory name, string memory symbol, uint age, address account) ERC20(name, symbol) Ownable(account) {
        require(account != address(0), "Invalid account address");

        Account_Details = AccountDetails({
            name: name,
            userId: symbol,
            age: age,
            accountAddress: account
        });

        Admin = account;
        _mint(msg.sender, 1 * 10**uint(decimals()));
    }

    function decimals() public view virtual override returns (uint8) {
        return 5;
    }

    function addAccount(string memory newName, string memory newUserId, uint newAge, address newAccount) external onlyOwner {
        require(newAccount != address(0), "New account address is invalid");

        Account_Details.name = newName;
        Account_Details.userId = newUserId;
        Account_Details.age = newAge;
        Account_Details.accountAddress = newAccount;

        Admin = Account_Details.accountAddress;
    }

    function Mint(address receiver, uint256 amount) external onlyOwner {
        _mint(receiver, amount);
    }

    function Burn(uint256 amount) external onlyOwner {
        _burn(_msgSender(), amount);
    }

    function Approve(address sender, uint256 amount) external onlyOwner {
        require(sender != address(0), "Invalid Sender Address");
        _approve(_msgSender(),sender, amount);
    }

    function TransferTokens(address receiver, uint256 amount) external onlyOwner {
        require(receiver != address(0), "Invalid Sender Address");
        _transfer(_msgSender(), receiver, amount);
    }

    function TransferFrom(address sender, address receiver, uint256 amount) external onlyOwner {
        require(sender != address(0), "Invalid Sender Address");
        require(receiver != address(0), "Invalid Receiver Address");
        _transfer(sender, receiver, amount);
    }
}
