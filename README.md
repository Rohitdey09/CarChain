# 🚗 CarChain – Decentralized Vehicle Ownership Registry

CarChain is a smart contract-based system for registering and managing vehicle ownership on the Ethereum blockchain. It ensures transparent and secure handling of vehicle data using VIN (Vehicle Identification Number) as a unique identifier.

---

## ✨ Features

- 🔐 **Secure Car Registration**: Only admin can register vehicles.
- 👤 **Ownership Transfer**: Only the current owner can transfer ownership.
- 🧾 **View Car Details**: Anyone can view car details (VIN, model, year, owner).
- 📦 **On-Chain Storage**: All data stored on blockchain using smart contracts.

---

## ⚙️ Smart Contract Overview

```solidity
function registerCar(string memory vin, string memory model, uint16 year, address owner) external onlyAdmin;
function transferOwnership(string memory vin, address newOwner) external onlyOwner(vin);
function getCarDetails(string memory vin) external view returns (string memory, string memory, uint16, address);

Transaction Hash:0xa9cb212dc928a725b7fd2b9f08742c6305cec80575b9aac2b0f0836ebf063043

![Screenshot 2025-05-26 143040](https://github.com/user-attachments/assets/a3c787e3-e614-4acf-8158-340f5e16168a)


