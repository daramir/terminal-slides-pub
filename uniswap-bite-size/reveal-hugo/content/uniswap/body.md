+++
weight = 10
+++

## Agenda

1. [What is Uniswap?](#what-is-uniswap)
1. [Background](#background)
1. [Actors](#actors)

---

## What is Uniswap?

Uniswap is a [decentralized](#decentralised-12) automated market maker ([AMM](#background)) **protocol** that allows anyone to swap **token** A for token B

<small>- roherrera.eth@[source](https://mirror.xyz/roherrera.eth/BMg6IoBHO8fNuyvmAuSDqjWf3ur-YZEAsNyG-aA1f9Y)</small>

---

### Decentralised (1/2)

<small>
> What does this mean? To what extent?
</small>

Bottom up approach, traditional client-server architecture lens:

{{% fragment %}}

- Infrastructure

  High number of nodes participating in p2p network. Nodes store records and host the system logic.

{{% /fragment %}}

{{< frag c="✅" >}}

{{% fragment %}}

- Transaction processing

  Transaction logic is processed at the blockchain level, meaning multiple clients execute the code and come to consensus.

{{% /fragment %}}

{{< frag c="✅" >}}

---

### Decentralised (2/2)

{{% fragment %}}

- User interface

  While Uniswap's official UI is hosted by a US company, anyone can run this frontend locally - the [dApp code is OSS](https://github.com/Uniswap/interface).

  - UI has also been deployed to IPFS

{{% /fragment %}}

{{% fragment %}}

Only requires connection to a node.

{{% /fragment %}}

{{< frag c="🆗" >}}

---

### Beyond Decentralised

{{% fragment %}}

#### Permissionless

<small>
> What does this mean? To what extent?
</small>

{{% /fragment %}}

{{% fragment %}}

- Who is allowed to participate?

  Any Ethereum account can perform swaps or provide liquidity. ✅

{{% /fragment %}}

{{% fragment %}}

#### Immutable

No party is able to pause the contracts or reverse trade execution.

{{% /fragment %}}

{{% fragment %}}

#### Governable

Uniswap Governance has the right (but no obligation) to divert a percentage of swap fees

{{% /fragment %}}

---

1. Background (Univ1 - Uni v3, some about AMMs)

## Background

{{% fragment %}} Uniswap v1 - 2018. {{% /fragment %}}
{{% fragment %}} Can only pair ERC20-ETH. No token-to-token "directly". {{% /fragment %}}
{{% fragment %}} Can still be done in the same tx, but had to route through an ETH pair. {{% /fragment %}}

{{% fragment %}}
Uni V3 defines [Range Orders](https://docs.uniswap.org/protocol/concepts/V3-overview/range-orders#buy-limit-orders), but in fact, it is still not a CLOB. [Its creators tout it](https://twitter.com/danrobinson/status/1504867385009852419?s=20&t=Gm0NAAlzU5Yt9huMjuSgcQ) as a hybrid between AMM and CLOB.
{{% /fragment %}}

{{% fragment %}}
When **market makers** add liquidity, they get a "liquidity pool share"<small><sup>[wp](https://uniswap.org/whitepaper.pdf)</sup></small> token.
{{% /fragment %}}

---

## Actors

Who provides liquidity to the system ?
Why would someone provide liquidity to the system ?

2. Actors

3. Pricing

## Questions that may arise?

How does Uniswap’s pricing mechanism work ?

How does the system represents the liquidity ?

Can you provide liquidity with only 1 side of the pair?
