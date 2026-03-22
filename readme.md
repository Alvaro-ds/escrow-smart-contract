## Escrow Smart Contract 
Basic escrow contract where a buyer deposits eth that is held until the buyer confirms delivery or cancles the transaction.

## How it works 
1. Buyer deposits eth
2. Funds are locked in the contract 
3. Buyer can:
    - Confirm delivery -> funds go to seller
    - Cancel -> funds are refunded

## Roles
- Buyer: deposits and controls the escrow
- Seller: receives funds upon confirmation

## Functions 
- deposit() -> deposit eth
- confirmDelivery() -> release funds to seller
- cancel() -> refund buyer

## Tech
- Solidity 0.8.24
- Remix IDE