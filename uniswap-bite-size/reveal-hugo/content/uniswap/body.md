+++
weight = 10
+++

## Agenda

1. [What is Uniswap?](#what-is-uniswap)
1. [Background](#background-1x)
1. [Actors](#actors)
1. [How does it work](#how-does-it-work)
   1. Constant Product AMM
   1. Pricing
   1. Deposit with only one token
1. SwapRouter ABI
1. [Blockchain-native](#blockchain-native)

---

## What is Uniswap?

Uniswap is a [decentralized](#decentralised-12) automated market maker ([AMM](#background-1x)) **protocol** that allows anyone to swap **token** A for token B

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

## Background (1/x)

{{% fragment %}} Uniswap v1 - 2018. {{% /fragment %}}
{{% fragment %}} Can only pair ERC20-ETH. No token-to-token "directly". {{% /fragment %}}
{{% fragment %}} Can still be done in the same tx, but had to route through an ETH pair. {{% /fragment %}}

{{% fragment %}}
Uni V3 defines [Range Orders](https://docs.uniswap.org/protocol/concepts/V3-overview/range-orders#buy-limit-orders), but in fact, it is still not a **CLOB**. [Its creators tout it](https://twitter.com/danrobinson/status/1504867385009852419?s=20&t=Gm0NAAlzU5Yt9huMjuSgcQ) as a hybrid between AMM and CLOB.
{{% /fragment %}}

{{% fragment %}}
When **market makers** add liquidity, they get a "liquidity pool share"<small><sup>[wp](https://uniswap.org/whitepaper.pdf)</sup></small> token.
{{% /fragment %}}

---

{{% section %}}

## Background (2/x)

1. **A**utomated **M**arket **M**aking
1. **C**entralised **L**imit **O**rder **B**ook
1. **R**equest **f**or **Q**uotation

<br/><br/><br/>

They're all types of exchanges.

---

### AMM, CLOB, what?

{{% fragment index="2" %}} \2. **C**entralised **L**imit **O**rder **B**ook {{% /fragment %}}

{{% fragment index="4" %}} Most commonly used exchange methodology. Collects orders from market makers and then publishes an aggregate order book. <br/>Examples: NYSE, CBOT, Coinbase, Binance. {{% /fragment %}}

---

### AMM, CLOB, what?

{{% fragment index="1" %}} \1. **A**utomated **M**arket **M**aking {{% /fragment %}}

{{% fragment index="5" %}} Mostly seen in research and prediction markets. Uniswap's innovation comes from developing a “constant function market making” system (CFMMs) - More specifically a CPMM. (Yes, more terms!)<br/>Examples: Uniswap, Bancor, Curve. {{% /fragment %}}

---

### AMM, CLOB, what?

{{% fragment index="3" %}} \3. **R**equest **f**or **Q**uotation {{% /fragment %}}

{{% fragment index="7" %}} A taker initiates a transaction by querying a known set of market makers with a specific demand (e.g. “buy 10 ETH”) Taker receives a quote from each, and decides which (if any) to accept. <br/>Examples: Airswap, Kyber, 0x. {{% /fragment %}}

---

## Background (6/6)

End of AMM intro.

Sources:

- Hummingbot [blog](https://hummingbot.io/en/blog/2019-04-crypto-exchange-types)
- "Constant Function Market Makers: DeFi’s “Zero to One” Innovation" [Medium article](https://medium.com/bollinger-investment-group/constant-function-market-makers-defis-zero-to-one-innovation-968f77022159)

{{% /section %}}

---

## Actors

Who provides liquidity to the system ?

![Ecosystem participants](./uniswap-v2-eco-participants-a3e150f3c98a0b402c2063de3e160f2e.jpeg)

<small>[source](https://docs.uniswap.org/protocol/V2/concepts/protocol-overview/ecosystem-participants)</small>

<!-- Why would someone provide liquidity to the system ?: Point to docs, otherwise will overextend -->

---

{{< slide background-image="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Raphael_School_of_Athens.jpg/2560px-Raphael_School_of_Athens.jpg" background-color="#000000" >}}

## How does it work?

<br/>

### x\*y = k

<br/><br/><br/><br/><br/><br/>

---

### Back to CPMM

<!-- Displayed equations are wrapped in double-\$
Inline equations like $E=mc^2$ are wrapped in single-\$ -->

$${x}*{y} = {k}$$

<div id="asdf" style="column-count: 2;">
    
Means that when a Liquidity pool is deployed, initial $k$ is set based on the amounts of $x$ and $y$ deposited.

Liquidity providers (LP) will receive LP tokens to represent share in pool.

This also means that because the product needs to remain constant\*, the universe of prices will be the resulting curve.

<!-- Constant ... actually non-depletable -->

!["xy = k" curve](./big-CPMM-curve.png)

</div>

---

### Pricing (1/x)

![Trade in pair](./uni-v2-trade-2027cdc01fe7c448f60a5e7da34af9b9.jpeg)

---

### Pricing (2/x)

- Spot (a.k.a Marginal, Mid) Price: The price represented by the status of the reserves.

  $${P} = \frac{x}{y}$$

- Execution Price: The average price for an executed trade. Below formula calculates how much of ${y}$ a trader will get, given input $\Delta{x}$

  $${\Delta{y}} = {y}*(1-{f})\Delta{x} / ({x} + (1-{f})\Delta{x})$$
  ${f}$ is the fee, which for Uni v2 sits at 0.3% for all pairs.

---

### Pricing (3/x)

The most important line of code in Uniswap v2

```solidity
    uint balance0Adjusted = balance0.mul(1000).sub(amount0In.mul(3));
    uint balance1Adjusted = balance1.mul(1000).sub(amount1In.mul(3));
    require(balance0Adjusted.mul(balance1Adjusted) >=
            uint(_reserve0).mul(_reserve1).mul(1000**2),
            'UniswapV2: K');
```

<small>https://github.com/Uniswap/v2-core/blob/master/contracts/UniswapV2Pair.sol#L170-L185</small>

If that assertion doesn't hold, the entire transaction gets rolled back.

---

### Can I LP with only one token?

Short answer is _yes_. But you will still have an LP share of the pool, which is denominated in reserves of token X and Y.

---

{{% section %}}

### Math behind optimal swap to LP

Let the two assets be asset $A$ and asset $B$, and let

$$
\begin{aligned}
res_A & = \text{amount of asset $A$ in the $A$-$B$ Uniswap pool reserve,} \\\
res_B & = \text{amount of asset $B$ in the $A$-$B$ Uniswap pool reserve,} \\\
amt_A & = \text{amount of $A$ the user wants to supply optimally, and} \\\
f     & = \text{swap fee (0.3\% for Uniswap).}\end{aligned}
$$

<br/><br/><br/><br/>
<small>[source](https://blog.alphaventuredao.io/onesideduniswap) for this and next two slides</small>

---

### Optimal​ amount to swap

**User's asset ratio = reserve's asset ratio**:The optimal $amt_A$ ($swapAmt_A$) should satisfy the equality constraint on user's asset ratio and reserve's asset ratio:

$$
\frac{amt_A - swapAmt_A}{res_A + swapAmt_A} = \frac{rcvAmt_B}{res'_B}.
$$

---

After multiple substitutions of known variables ($rcvAmt_A$, $res'_B$, $f$), rearranging the equation and solving for a non-negative root results in:

<small>
$$
swapAmt_A = \left\lfloor \frac{\lfloor \sqrt{(1997^2)*res_A^2 + 4 * 997 * 1000 * amt_A * res_A}\rfloor - 1997 * res_A}{2 * 997} \right\rfloor.
$$
</small>

Because of Uniswap/DeFi/Ethereum composability, anyone can:

- deploy a smart contract,
- implement the formula above,
- receive $amt_a$ fom the user,
- perform swap step,
- perform liquidity provision step

Enabling liquidity provision in a single transaction.

<small>⚡ [Zapper.Fi: Uniswap V2 Zap In 2 | Contract Code | Etherscan](https://etherscan.io/address/0x6d9893fa101cd2b1f8d1a12de3189ff7b80fdc10#code)</small>

{{% /section %}}

---

## SwapRouter ABI

ABI: Analog to the "OpenAPI" specification

```json
{
  "inputs": [
    { "internalType": "uint256", "name": "amountIn", "type": "uint256" },
    { "internalType": "uint256", "name": "amountOutMin", "type": "uint256" },
    { "internalType": "address[]", "name": "path", "type": "address[]" },
    { "internalType": "address", "name": "to", "type": "address" },
    { "internalType": "uint256", "name": "deadline", "type": "uint256" }
  ],
  "name": "swapExactTokensForTokens",
  "outputs": [
    { "internalType": "uint256[]", "name": "amounts", "type": "uint256[]" }
  ],
  "stateMutability": "nonpayable",
  "type": "function"
}
```

<small>Interface defined in [Uniswap/v2-periphery "IUniswapV2Router01.sol" | GitHub](https://github.com/Uniswap/v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router01.sol)</small>

---

## Blockchain-native

### Flashswaps

Withdraw up to the full reserves of any ERC20 token on Uniswap and **execute arbitrary logic** at no upfront cost, provided that by the end of the transaction you either:

- pay for the withdrawn ERC20 tokens with the corresponding pair tokens
- return the withdrawn ERC20 tokens along with a small fee

---

# THE END
