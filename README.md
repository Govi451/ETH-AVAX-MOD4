# DeganToken

DegenToken is an ERC20 token called "Degen" with the symbol "DGN" that is implemented via a Solidity smart contract. The contract adds functionality for minting, transferring, approving, redeeming, checking balance, and burning tokens to the OpenZeppelin ERC20 and Ownable contracts.

## Steps
* Create the ERC-20 token
* Set the name to “Degen”
* Set the symbol to “DGN”
* Test the smart-contract (All tests should pass)
* Deploy the contract to Avalanche Fuji Testnet
* Test on testnet (All tests should pass)
* Verify the smart-contract on Snowtrace
  
## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract adds functionality for minting, transferring, approving, redeeming, checking balance, and burning tokens. This program serves as a simple and straightforward introduction to Solidity programming, and can be used as a stepping stone for more complex projects in the future.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., DegenToken.sol). Copy and paste the following code into the file:

```javascript
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


```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile HelloWorld.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar.

Once the contract is deployed, you can interact with it by calling functions.

## Steps
* Import OpenZeeplin
* Write ERC Contract.
* Compile the Contract
* On Deployment tab selct injectet metamsk.
* Connect Your Remix with Metamask
* Get Some tokens For testing on "https://core.app/tools/testnet-faucet/?subnet=c&token=c"
* Connect your Metamask wallet with Avalanche C-Chain network
* Try calling Functions
* Transactions will be reflected on Snowtrace

## Authors

Govind Pandey

## License

This project is licensed under the MIT License.
