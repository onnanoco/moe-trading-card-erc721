# MOEスマートコントラクト(ERC721)

- Name: MOE Character NFT
- Symbol: MOENFT
- TYPE : ERC721
- Contract address: 
- Hardhatを使用します。
- SOLC version: 0.8.19

## Dependencies

```bash
npm install
cp .env.sample. env
vi .env
```

## Deploy

```bssh
npx hardhat run --network {ethereum||goerli} "scripts/deploy.js"
```

## Verify

```bash
npx hardhat verify --constructor-args arguments.js --contract "contracts/MoeErc20.sol:MoeErc20" --network {ethereum||goerli} {CONTRACT_ADDRESS}
```

