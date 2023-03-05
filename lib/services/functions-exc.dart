// import 'package:election_eth/utils/constants.dart';
import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';

import '../constants/constants.dart';

Future<DeployedContract> loadContract() async{
  String abi = await rootBundle.loadString('assets/abi-exc.json');
  String contractAddress = contractAddress1;
  final contract = DeployedContract(ContractAbi.fromJson(abi, "Exchange"), EthereumAddress.fromHex(contractAddress));
  return contract;
}

Future<String> callFunc(String funcName,List<dynamic> args,Web3Client ethClient, String privateKey) async{
  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  DeployedContract contract = await loadContract();
  final ethFucn = contract.function(funcName);
  final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(contract: contract, function: ethFucn, parameters: args),
      chainId: null,
      fetchChainIdFromNetworkId: true );
  return result;
}
//
// Future<String> startElection(String name, Web3Client ethClient)async {
//   var response = await callFunc("startElection", [name], ethClient, owner_private_key);
//   print("Election Started Successfully");
//   return response;
// }
//
// Future<String> addCandidate(String name, Web3Client ethClient)async {
//   var response = await callFunc("addCandidate", [name], ethClient, owner_private_key);
//   print("Candidate added Successfully");
//   return response;
// }
//
// Future<String> authorizeVoter(String addr, Web3Client ethClient)async {
//   var response = await callFunc("authorizeVoter", [EthereumAddress.fromHex(addr)], ethClient, owner_private_key);
//   print("Voter Authorized Successfully");
//   return response;
// }

Future<List> addLiquidity(int tokenAmount,Web3Client ethClient) async{
  final response = await ask('addLiquidity',[BigInt.from(tokenAmount)],ethClient);
  return response;
}

Future<List> removeLiquidity(int amount,Web3Client ethClient) async{
  final response = await ask('removeLiquidity',[amount.toUnsigned(256)],ethClient);
  return response;
}

Future<List> getReserve(Web3Client ethClient) async{
  final response = await ask('getReserve',[],ethClient);
  return response;
}

Future<List> getTokenAmount(int ethSold,Web3Client ethClient) async{
  final response = await ask('getTokenAmount',[ethSold.toUnsigned(256)],ethClient);
  return response;
}

Future<List> getEthAmount(int tokenSold,Web3Client ethClient) async{
  final response = await ask('getEthAmount',[tokenSold.toUnsigned(256)],ethClient);
  return response;
}

Future<List> ethToTokenSwap(int minSwap,Web3Client ethClient) async{
  final response = await ask('ethToTokenSwap',[minSwap.toUnsigned(256)],ethClient);
  return response;
}
Future<List> tokenToEthSwap(int tokenSold,Web3Client ethClient) async{
  final response = await ask('tokenToEthSwap',[tokenSold.toUnsigned(256)],ethClient);
  return response;
}
Future<List> getAmount(int inputAmount,int inputRes,int outputRes ,Web3Client ethClient) async{
  final response = await ask('getAmount',[inputAmount.toUnsigned(256),inputRes.toUnsigned(256),outputRes.toUnsigned(256)],ethClient);
  return response;
}


Future<List<dynamic>> ask(String funcName,List<dynamic> args, Web3Client ethClient) async{
  final contract = await loadContract();
  final ethFunction = contract.function(funcName);
  final result = ethClient.call(contract: contract, function: ethFunction, params: args);
  return result;
}

// Future<String> vote(int candidateIndex,Web3Client ethClient) async{
//   final response = await callFunc("vote", [BigInt.from(candidateIndex)], ethClient, voter_private_key);
//   print("Vote counted successfully");
//   return response;
// }




