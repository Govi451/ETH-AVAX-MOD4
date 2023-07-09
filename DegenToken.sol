// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    constructor() ERC20("Degen", "DGN") {}

    function mint(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);
    }

    function transfer(address _to, uint256 _amount) public override returns (bool) {
        _transfer(msg.sender, _to, _amount);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _amount) public override returns (bool) {
        _transfer(_from, _to, _amount);
        _approve(_from, msg.sender, allowance(_from, msg.sender) - _amount);
        return true;
    }

    function approve(address _spender, uint256 _amount) public override returns (bool) {
        _approve(msg.sender, _spender, _amount);
        return true;
    }

    function redeem(uint256 _amount) external {
        _burn(msg.sender, _amount);
    }

    function checkBalance(address _address) external view returns (uint256) {
        return balanceOf(_address);
    }

    function burn(uint256 _amount) external {
        _burn(msg.sender, _amount);
    }
}
