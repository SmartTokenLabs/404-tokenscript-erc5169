# Improved 404 Token - Integrated with ERC5169 and TokenScript
The Improved 404 is based on [404 V2](https://github.com/Pandora-Labs-Org/erc404), [ERC5169](https://eips.ethereum.org/EIPS/eip-5169) and [TokenScript](https://github.com/SmartTokenLabs/TokenScript). By incorporating ERC5169 and TokenScript into the 404 tokens as the token frontend, we facilitate a safer and more convenient operation for users. This integration not only secures and improves user experience, it makes it easier and more intuitive for users to trade with confidence.
# Features
- Standardized Token Frontend: Utilizing TokenScript to provide an HTML-like frontend framework for tokens, standardizing token display and interaction.
- Secure Frontend-Backend Connection: Ensuring a secure and convenient connection between the token frontend and smart contract backend via the ERC5169 standard.
- Enhanced Interoperability: Supporting the development of highly interoperable applications, enabling tokens to be seamlessly used across various apps and platforms.
- User-Centric Design
# Getting Started

## Installation

First create a HardHat project .env file with the following API keys:

```
PRIVATE_KEY = "0x2222222222222222233333333333333333333333333334444444444444455555"
INFURA_KEY = "232323baba122323232abab23232323b"
ETHERSCAN_API_KEY="AAAAAAAAAAAAAAAA123456AAAAAAAAAAAA"
```

The private key should have funding for either Eth Mainnet, Sepolia or Mumbai.
If you use Infura for your RPC then you will need to source a key, or simply change the RPC to any of the free RPCs from https://chainlist.org

In the project root directory init the HardHat environment:

```bash
npm init -y
npm install hardhat
npm install stl-contracts
npx hardhat compile
```

After editing the derived `TokenScript404.sol` as you wish you can deploy on the chosen chain eg:

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

# Example Usage
This specific 404 improvement will give token holders greater visibility and control over ERC-20 and ERC-721 token transfers.
It will also enable advanced use cases beyond collectibles, such as 404 Token memberships and 404 Token accounts.  
# Documentation
[Ethereum Improvement Proposals-ERC5169](https://eips.ethereum.org/EIPS/eip-5169)

[TokenScript Papers](https://github.com/SmartTokenLabs/papers/releases)
# Contributing
We welcome contributions of all kinds, from feature requests and bug reports to code contributions.
# License
This project is licensed under the MIT License. See the LICENSE file for more details.
