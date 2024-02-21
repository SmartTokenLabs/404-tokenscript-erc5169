// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");
const { getContractAddress } = require('@ethersproject/address');

async function calculateContractAddress() {

    const [signer] = await hre.ethers.getSigners();
    const signerAddr = signer.address;
    const _nonce = await hre.ethers.provider.getTransactionCount(signerAddr);

    const futureAddress = getContractAddress({
        from: signerAddr,
        nonce: _nonce
    });

    return futureAddress;
}

async function main() {
    const currentTimestampInSeconds = Math.round(Date.now() / 1000);
    const [signer] = await hre.ethers.getSigners();
    const signerAddr = signer.address;

    console.log(`Address: ${signerAddr}`);

    let startBalance = await hre.ethers.provider.getBalance(signer.address);
    console.log(`deploy key balance ${hre.ethers.formatEther(startBalance)}`);

    //nonce + contract
    const addrDeployment = await calculateContractAddress();
    console.log(`deploy Addr: ${signer.address} : ${addrDeployment}`);

    //NB: Stop here if you just want to calculate ( for whatever reason :) ) where your contract will deploy in advance

    const tokenScript404 = await hre.ethers.deployContract("TokenScript404", [signer.address, signer.address]);
    await tokenScript404.waitForDeployment();

    let newBalance = await hre.ethers.provider.getBalance(signer.address);
    console.log(`deploy key balance ${hre.ethers.formatEther(newBalance)}`);
    console.log(`new contract address ${addrDeployment}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
