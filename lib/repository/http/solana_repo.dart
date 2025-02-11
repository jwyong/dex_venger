import 'dart:convert';

import 'package:dex_venger/const/http_const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Solana related APIs to get blockchain data (Helius)
class SolanaRepo {
// Get list of fungible tokens (coins) from a given wallet address
  Future<List<String>?> getTokensForAddress(String walletAddress) async {
    final apiUrl = '$apiHelius$apiKeyHelius';
    final Map<String, dynamic> requestData = {
      "jsonrpc": "2.0",
      "id": "1", // required id per Helius doc. Not important for this particular call
      "method": "searchAssets",
      "params": {
        "ownerAddress": walletAddress,
        "page": 1,
        "sortBy": {"sortBy": "recent_action", "sortDirection": "desc"},
        "tokenType": "fungible"
      }
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        debugPrint("JAY_LOG: , _getTokensForAddress, $responseData");
      } else {
        debugPrint("JAY_LOG: , _getTokensForAddress, Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      debugPrint("JAY_LOG: , _getTokensForAddress, Exception: $e");
    }

    return ["testing"];
  }
}