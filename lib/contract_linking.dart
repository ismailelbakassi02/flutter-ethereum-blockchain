import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ContractLinking extends ChangeNotifier {
    final String _rpcUrl = "http://127.0.0.1:7545";
    final String _wsUrl = "ws://127.0.0.1:7545/";
    final String _privateKey = "0x6cc0be3ace8811a7b5f671eaec74e8631ff56ca97e3901389e630b2d93432a08";

    late Web3Client _client;
    bool isLoading = true;
    late String _abiCode;
    late EthereumAddress _contractAddress;
    late Credentials _credentials;
    late DeployedContract _contract;
    late ContractFunction _yourName;
    late ContractFunction _setName;
    late String deployedName;

    ContractLinking() {
        initialSetup();
    }

    initialSetup() async {
        try {
            // establish a connection to the ethereum rpc node.
            _client = Web3Client(_rpcUrl, Client());
            await getAbi();
            await getCredentials();
            await getDeployedContract();
        } catch (e) {
            print('Error during setup: $e');
            isLoading = false;
            deployedName = 'Error: $e';
            notifyListeners();
        }
    }

    Future<void> getAbi() async {
        // Reading the contract abi
        String abiStringFile =
            await rootBundle.loadString("build/contracts/HelloWorld.json");
        var jsonAbi = jsonDecode(abiStringFile);
        _abiCode = jsonEncode(jsonAbi["abi"]);
        _contractAddress =
            EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
    }

    Future<void> getCredentials() async {
        _credentials = EthPrivateKey.fromHex(_privateKey);
    }

    Future<void> getDeployedContract() async {
        // Telling Web3dart where our contract is declared.
        _contract = DeployedContract(
            ContractAbi.fromJson(_abiCode, "HelloWorld"), _contractAddress);
        // Extracting the functions, declared in contract.
        _yourName = _contract.function("yourName");
        _setName = _contract.function("setName");
        getName();
    }

    getName() async {
        try {
            // Getting the current name declared in the smart contract.
            var currentName = await _client
                .call(contract: _contract, function: _yourName, params: []);
            deployedName = currentName[0];
            isLoading = false;
            notifyListeners();
        } catch (e) {
            print('Error getting name: $e');
            deployedName = 'Error: $e';
            isLoading = false;
            notifyListeners();
        }
    }

    setName(String nameToSet) async {
        try {
            // Setting the name to nameToSet(name defined by user)
            isLoading = true;
            notifyListeners();
            
            // Use EIP-1559 transaction with chainId 1337 (Ganache default)
            await _client.sendTransaction(
                _credentials,
                Transaction.callContract(
                    contract: _contract, 
                    function: _setName, 
                    parameters: [nameToSet],
                    maxPriorityFeePerGas: EtherAmount.inWei(BigInt.from(1000000000)),
                    maxFeePerGas: EtherAmount.inWei(BigInt.from(100000000000))),
                chainId: 1337);
            getName();
        } catch (e) {
            print('Error setting name: $e');
            isLoading = false;
            notifyListeners();
        }
    }
}
