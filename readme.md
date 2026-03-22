## Escrow Smart Contract 
This project implements a basic scrow smart contract in Solidity.
It allows a buyer to deposit eth into a contract, which is then securely held until the buyer either confirms delivery or cancels the transaction.
The contract removes the need for trust between parties by enforcing the rules directly on-chain.

## How it works 
1. Buyer deposits eth into de contract.
2. Funds are locked and cannot be accessed by either party.
3. Buyer can then:
    - Confirm delivery -> funds are released to the seller.
    - Cancel the transaction -> funds are refunded to the buyer.

## Roles
- Buyer: deposits and controls the outcome of the transaction.
- Seller: receives funds the funds once delivery is confirmed.
- Contract: Acts as a trustless intermediary holding the funds.

## Smart Contract Features
- Access control via modifiers
- Protection against invalid execution flows
- Simple and deterministic logic
- No reliance on third parties

## Functions 
# deposit()
Allows the buyer to deposit eth into the contract.
- Must be called by the buyer
- Requires a non-zero eth value
- Can only be executed once

# confirmDelivery()
Releases the funds to the seller.
- ONly calleable by the buyer
- Requires that funds have been deposited
- Marks the escrow as completed

# cancel()
Refunds the buyer.
- Only callable by the buyer.
- Requires that funds have been deposited
- Marks the escrow as completed

## Tech
- Solidity 0.8.24
- Remix IDE

## Possible Improvements
- Add an arbitrator role
- Introduce deadlines for automatic refunds
- Support ERC20 tokens instead of eth
- Add events for tracking and indexing

## Author
Álvaro Dapena Salinas.
Developed as a part of the master Blockchain Accelerator, with custom logic.

## License
LGPL-3.0-only
