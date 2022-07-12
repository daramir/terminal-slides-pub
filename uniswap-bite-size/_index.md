# Uniswap Bite-Size



## What is Uniswap?
Uniswap is a [decentralized] automated market maker ([AMM]) [protocol] that allows anyone to swap [token] A for token B [source](https://mirror.xyz/roherrera.eth/BMg6IoBHO8fNuyvmAuSDqjWf3ur-YZEAsNyG-aA1f9Y)

### Decentralised

> What does this mean? To what extent?

Looking at it from the traditional client-server architecture lens, bottom up.

- Infrastructure? ✅

High number of nodes participating on the Ethereum mainnet, which host the system logic.

- Transaction processing? ✅

Transaction logic is processed at the blockchain level, meaning multiple p2p clients execute the code and come to consensus.

- User interface? 🆗 

While Uniswap's official UI is hosted by a US company, anyone can run this frontend locally. The dApp code is OSS which makes it even easier. it has also been deployed to IPFS - only requires connection to a node.

### Beyond Decentralised

> What does this mean? To what extent?

Looking at it from the traditional client-server architecture lens, bottom up.

- Infrastructure? ✅


1. Background (Univ1 - Uni v3, some about AMMs)

Uniswap v1 - 2018. can only pair ERC20-ETH. No token-to-token "directly". Can still be done in the same tx, but had to route through an ETH pair. 

Uni V3 defines [Range Orders](https://docs.uniswap.org/protocol/concepts/V3-overview/range-orders#buy-limit-orders), but in fact, it is still not a CLOB. [Its creators tout it](https://twitter.com/danrobinson/status/1504867385009852419?s=20&t=Gm0NAAlzU5Yt9huMjuSgcQ) as a hybrid between AMM and CLOB.
2. Actors
3. Pricing


## Questions that may arise?

How does Uniswap’s pricing mechanism work ?
Who provides liquidity to the system ?
Why would someone provide liquidity to the system ?
How does the system represents the liquidity ?

Can you provide liquidity with only 1 side of the pair?
