// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import "@openzeppelin/contracts@5.1.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.1.0/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts@5.1.0/access/Ownable.sol";

contract Mercury is ERC20, ERC20Permit, Ownable {
    constructor(address initialOwner)
        ERC20("Mercury", "Hg")
        ERC20Permit("Mercury")
        Ownable(initialOwner)
    {
        _mint(msg.sender, 10000);
    }

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

}
