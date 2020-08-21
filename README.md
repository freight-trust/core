# Freight Trust Core Network

> Monocore

## Abstract

Freight Trust Core Network is a collection of packages that in turn, create the core components of Freight Trust Network.

## Overview

Freight Trust Network enables EDI-based in-protocol messaging between trading partners through AS2/Kafka and RPC. Message support for ASC X12 4010 is currently the only supported transaction set, but more are on their way. UN EDIFACT support is partially available as well.

## Specification

[see specification](https://github.com/freight-trust/spec])

## Governance

[see governance](https://github.com/freight-chain/rfc)

## Protocol

[see protocol](https://github.com/freight-trust/protocol)

## Releases

[see releases](https://github.com/freight-trust/releases])

##### ARN Schema

arn:partition:service:region:account-id:resource-id
arn:partition:service:region:account-id:resource-type/resource-id
arn:partition:service:region:account-id:resource-type:resource-id

## Kubernetes

### DevOps Flow

- Create private/public keys for the validators & update the secrets/validator-keys-secret.yaml with the validator private keys
- Update the configmap/configmap.yml with the public keys & genesis file
- Update the number of nodes you would like in deployments/node-deployment.yaml
- Run kubectl
- Monitoring via prometheus & grafana is also setup up in a separate _monitoring_ namespace and exposed via NodePort services (ports 30090, 30030 respectively)
- Credentials for grafana are admin:password. When grafana loads up select the "besu Dashboard"

#### Bootnode

```bash
docker run --rm --volume $PWD/ibftSetup/:/opt/besu/data hyperledger/besu:latest operator generate-blockchain-config --config-file=/opt/besu/data/ibftConfigFile.json --to=/opt/besu/data/networkFiles --private-key-file-name=key
sudo chown -R $USER:$USER ./ibftSetup
mv ./ibftSetup/networkFiles/genesis.json ./ibftSetup/
```

#### Validate Deployment

```bash
minikube ssh

# once in the terminal
curl -X POST --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' <besu_NODE_SERVICE_HOST>:8545

# which should return:
The result confirms that the node running the JSON-RPC service has two peers:
{
  "jsonrpc" : "2.0",
  "id" : 1,
  "result" : "0x5"
}

```

## AtomicSwaps

> 'Chunnel'

- Swapping Ether on one blockchain for Ether on another blockchain.
- Allowing for partial swapping of Ether. That is, allowing one entity to offer an
  amount of Ether on one blockchain, say 5 Ether with an exchange rate between chains of
  1.0, and allow another entity to accept the offer but only swap a partial amount,
  say 2 Ether.

### Contracts

- Receiver Contract: A lockable contract deployed on Sidechain 2 by the Entity Offering Ether.
  The entity funds the contract when deploying it and can later add funds to the contract.
- Sender Contract: A lockable contract deployed on Sidechain 1 by the Entity Offering Ether.
  The entity can withdraw funds from the contract once an exchange has occurred.
- Registration Contract: A non-lockable contract deployed on Sidechain 1 by the Registration Owner.

#### Workflow

- Entity Offering Ether deploys Receiver Contract, funding it with some Ether.
- Entity Offering Ether deploys Sender Contract linking it to the Receiver Contract and specifying an
  exchange rate between blockchains.
- Entity Offering Ether links the Receiver Contract to the Sender Contract by calling `setSenderContract`.
- Entity Offering Ether registers the Sender Contract with the Registration Contract by calling `register`.
- Entity Accepting Offer uses the Registration Contract to locate an appropriate Sender
  Contract for the sidechain they wish to obtain Ether for, at an exchange rate they find acceptable.
- Entity Accepting Offer calls the Sender Contracts `exchange` function with a Crosschain Transaction.
  The transaction includes a Subordinate Transaction which calls the Receiver Contract's `exchange`
  function.
- Entity Offering Ether withdraws Ether from the Sender Contract.

### Design Features

#### Parametric Exchange Rate

The exchange rate is a number indicating the relative worth of Ether on one sidechain compared
to another sidechain.
The exchange rate is a decimal number which can range from 2<sup>63</sup>-1 to 2<sup>-64</sup>
(9.223372036854776e18 to 5.421010862427522e-20).

It is passed into the Solidity code assuming
the decimal point is 2<sup>64</sup>.

##### Registration Process

The `registration` function takes the address of the Sender Contract as as parameter. It
then calls the Sender Contract to determine which sidechain Ether is to be swapped and at
what exchange rate the Sender Contract will use.

##### Crosschain Call Authentication

The Receiver Contract's `exchange` function checks that the function is being called from
the expected Sender contract. This authentication information is fetched out of the Subordinate
Transaction. The crosschain transaction will not be committed if the Subordinate Transaction
information is invalid.

## Deployments

> see Deployments

## Support

> see Support

## Security

> see security

## License

Apache-2.0
