/*
 * Copyright 2018 ConsenSys AG.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License.
 */
/**
 * Finder_v1.sol tests with either a single ERA with a single domain.
 *
 * The tests in this file check the behaviour of the Finder contract in the simplest
 * circumstance:
 * There is a single ERA
 * The domain hash of the domain is in the ERA.
 */
var Web3 = require("web3");
var web3 = new Web3();

contract("Finder: Single Domain", function (accounts) {
  let common = require("./common");

  // For the purposes of this test, this can be a fake, non-zero address.
  const testDomainInfoAddress1 = "0x0102030405060708090a1112131415161718191a";

  let eraInterface;
  let finderInterface;

  let testDomainHash;
  let testDomainHashP1;
  let testDomainHashP2;
  let testDomainHashP3;

  beforeEach(async function () {
    // Only run this before the first test method is executed.
    if (testDomainHash == null) {
      eraInterface = await common.getDeployedERA();
      finderInterface = await common.getDeployedFinder();

      testDomainHash = web3.utils.keccak256(common.TEST_DOMAIN);
      testDomainHashP1 = web3.utils.keccak256(common.TEST_DOMAIN_P1);
      testDomainHashP2 = web3.utils.keccak256(common.TEST_DOMAIN_P2);
      testDomainHashP3 = web3.utils.keccak256(common.TEST_DOMAIN_P3);

      const domainOwner = accounts[1];
      await eraInterface.addUpdateDomain(
        testDomainHash,
        common.DONT_SET,
        testDomainInfoAddress1,
        domainOwner
      );
    }
  });

  it("resolveDomain", async function () {
    let eras = [];
    eras[0] = eraInterface.address;

    let resolvedDomainInfo = await finderInterface.resolveDomain.call(
      eras,
      testDomainHash,
      testDomainHashP1,
      testDomainHashP2,
      testDomainHashP3
    );
    assert.equal(testDomainInfoAddress1, resolvedDomainInfo);
    //        console.log("resolvedDomainInfo: " + resolvedDomainInfo);
  });

  it("resolveDomains", async function () {
    let eras = [];
    eras[0] = eraInterface.address;
    let domainHashes = [];
    domainHashes[0] = testDomainHash;
    let p1DomainHashes = [];
    p1DomainHashes[0] = testDomainHashP1;
    let p2DomainHashes = [];
    p2DomainHashes[0] = testDomainHashP2;
    let p3DomainHashes = [];
    p3DomainHashes[0] = testDomainHashP3;

    let resolvedDomainInfos = await finderInterface.resolveDomains.call(
      eras,
      domainHashes,
      p1DomainHashes,
      p2DomainHashes,
      p3DomainHashes
    );
    assert.equal(testDomainInfoAddress1, resolvedDomainInfos[0]);

    //        console.log("resolvedDomainInfos: " + resolvedDomainInfos);
    //        console.log("resolvedDomainInfos: " + resolvedDomainInfos.length);
  });
});
