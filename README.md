# MOE Token(ERC721)

- Name: MOE TRADING CARD
- Symbol: MOETCG
- TYPE: ERC721
- Contract address: 
- Testnet(Sepolia) contract address: 0x6fED12485dAd32c2f86E8278D95DD9004c774FB7
- Hardhat
- SOLC version: 0.8.19

## Env.

```bash
npm install
cp .env.sample. env
vi .env
```

## Deploy

```bssh
npx hardhat run --network {ethereum||sepolia} "scripts/deploy.js"
```

## Verify

```bash
npx hardhat verify --constructor-args arguments.js --contract "contracts/MoeErc721.sol:MoeErc721" --network {ethereum||sepolia} {CONTRACT_ADDRESS}
```

