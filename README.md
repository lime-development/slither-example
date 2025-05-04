# Slither Demo with Hardhat

This is a demo project showcasing how to integrate [Slither](https://github.com/crytic/slither) — a static analysis tool for Solidity — into a Hardhat-based development environment.

It builds upon the default Hardhat sample project and includes:

- A sample smart contract
- A unit test for the contract
- A Hardhat Ignition module for deployment
- A GitHub Actions workflow to run Slither on each push or pull request

## Getting Started

You can try running some of the following tasks:

```bash
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.js
```

## Static Analysis

To run Slither manually:
```bash
slither .
```
