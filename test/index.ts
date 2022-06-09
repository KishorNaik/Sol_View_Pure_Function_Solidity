import { expect } from "chai";
import { ethers } from "hardhat";

// describe("Greeter", function () {
//   it("Should return the new greeting once it's changed", async function () {
//     const Greeter = await ethers.getContractFactory("Greeter");
//     const greeter = await Greeter.deploy("Hello, world!");
//     await greeter.deployed();

//     expect(await greeter.greet()).to.equal("Hello, world!");

//     const setGreetingTx = await greeter.setGreeting("Hola, mundo!");

//     // wait until the transaction is mined
//     await setGreetingTx.wait();

//     expect(await greeter.greet()).to.equal("Hola, mundo!");
//   });
// });


describe("View and Pure Function Test", function () {
  it.only("Get-and-Set-Function", async function () {
    const Contract = await ethers.getContractFactory("ViewAndPureFunctionCon");
    const contract = await Contract.deploy();
    await contract.deployed();

    await contract.set(1);

    expect(await contract.getView()).to.equal(1);
  });
});