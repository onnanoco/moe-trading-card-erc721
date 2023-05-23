require('dotenv').config();
const hre = require('hardhat');

async function main() {
    const MoeErc721 = await hre.ethers.getContractFactory('MoeErc721');
    const moeTCG = await MoeErc721.deploy(process.env.TOKEN_NAME, process.env.TOKEN_SYMBOL, process.env.MOE_ERC20_CA);

    await moeTCG.deployed();

    console.log(`MOE TCG contract has been deployed : ${moeTCG.address}`);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    })