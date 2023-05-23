# MOE Token(ERC721)

- Name: MOE NFT
- Symbol: MOENFT
- TYPE : ERC721
- Contract address: 
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
npx hardhat verify --constructor-args arguments.js --contract "contracts/MoeErc20.sol:MoeErc20" --network {ethereum||sepolia} {CONTRACT_ADDRESS}
```

