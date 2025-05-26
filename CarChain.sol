// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CarChain {
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    struct Car {
        string vin;         // Vehicle Identification Number
        string model;
        uint16 year;
        address currentOwner;
    }

    mapping(string => Car) public cars; // VIN → Car
    mapping(string => bool) public isRegistered;

    event CarRegistered(string vin, address owner);
    event OwnershipTransferred(string vin, address from, address to);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin");
        _;
    }

    modifier onlyOwner(string memory vin) {
        require(msg.sender == cars[vin].currentOwner, "Not car owner");
        _;
    }

    function registerCar(string memory vin, string memory model, uint16 year, address owner) external onlyAdmin {
        require(!isRegistered[vin], "Already registered");
        cars[vin] = Car(vin, model, year, owner);
        isRegistered[vin] = true;
        emit CarRegistered(vin, owner);
    }

    function transferOwnership(string memory vin, address newOwner) external onlyOwner(vin) {
        require(newOwner != address(0), "Invalid address");
        address oldOwner = cars[vin].currentOwner;
        cars[vin].currentOwner = newOwner;
        emit OwnershipTransferred(vin, oldOwner, newOwner);
    }

    function getCarDetails(string memory vin) external view returns (string memory, string memory, uint16, address) {
        require(isRegistered[vin], "Car not registered");
        Car memory c = cars[vin];
        return (c.vin, c.model, c.year, c.currentOwner);
    }
}
