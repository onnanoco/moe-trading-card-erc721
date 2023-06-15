# MOE Token(ERC721)

- Name: MOE TRADING CARD
- Symbol: MOETCG
- TYPE: ERC721
- Contract address: 0x12B9c5b74b195731BC64a8aC3A43550d808f50a8
- Testnet(Sepolia) contract address: 0xD79C48C54fce96486e3f1F90dB81CFd4EF0e1496
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

