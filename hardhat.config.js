require("@nomiclabs/hardhat-waffle");
require("@nomicfoundation/hardhat-verify");
require("dotenv").config();

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
    defaultNetwork: "goerli",
    networks: {
        ethereum: {
            url: process.env.ETHEREUM_RPC_ENDPOINT,
            accounts: [process.env.ETHEREUM_PRIVATE_KEY],
            chainId: 1,
            gas: "auto",
            gasPrice: "auto"
        },
        goerli: {
            url: process.env.GOERLI_RPC_ENDPOINT,
            accounts: [process.env.GOERLI_PRIVATE_KEY],
            chainId: 5,
            gas: "auto",
            gasPrice: "auto"
        }
    },
    etherscan: {
        apiKey: process.env.ETHERESCAN_KEY
    },
    paths: {
        sources: "./contracts",
        cache: "./cache",
        artifacts: "./artifacts"
    },
    solidity: {
        version: "0.8.19",
        settings: {
            optimizer: {
                enabled: true,
                runs: 200
            }
        }
    }
};