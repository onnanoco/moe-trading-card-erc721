# MOE Token(ERC721)

- Name: MOE TRADING CARD
- Symbol: MOETCG
- TYPE: ERC721
- Contract address: 0xC65eE7960A99D739B277b8dBBF6a75eAAd5482bd
- Testnet(Sepolia) contract address: 0x83D6Bf47456d5BC474ceB8f39CDF95bEEf6Ed1cE
- Hardhat
- SOLC version: 0.8.19

## Env.

```bash
npm install
cp .env.sample .env
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

