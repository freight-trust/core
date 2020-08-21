# Ethereum Registration Authority Code

These directories contain the Ethereum Registration Authority
solidity code, test code, and sample code.

The contracts are written in Solidity. The code is tested utilising the Truffle
framework. For more information on installing and using Truffle, please
refer to: http://truffleframework.com/docs/getting_started/installation

# Install and dependancies:

```
npm install -g truffle
npm install web3
```

# Running the tests:

Truffle permits writing tests in Javascript or Solidity. The tests that
are currently included are writted in Javascript, which uses the
Mocha framework (https://mochajs.org/) and
Chai (http://www.chaijs.com/) for assertions.

## To run the tests:

1. Start the Truffle dev blockchain + console:

```
truffle develop
```

2. Compile the Solidity source:

```
compile
```

3. Ensure the latest contracts are deployed:

```
migrate --reset
```

4. Run the tests:

```
test
```

5. To exit:

```
.exit
```

## To run gas tests:

```
sh ./test_gas.sh

```

# Running the Truffle console logger

Execute the following command in a separate window to your Truffle developer console:

```
truffle develop --log
```
