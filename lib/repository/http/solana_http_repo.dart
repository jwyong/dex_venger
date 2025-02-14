import 'dart:convert';

import 'package:dex_venger/base/resource.dart';
import 'package:dex_venger/const/const.dart';
import 'package:dex_venger/const/http_const.dart';
import 'package:dex_venger/model/api/solana/solana_token_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final solanaHttpRepo = Provider((ref) => SolanaHttpRepo());

/// Solana related APIs to get blockchain data (Helius)
class SolanaHttpRepo {
// Get list of fungible tokens (coins) from a given wallet address
  Future<Resource<List<SolanaTokenItem>>?> getTokensForAddress(String walletAddress) async {
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
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        // Extract "items" array from "result"
        final List<dynamic> itemsJson = jsonResponse["result"]["items"];

        // Convert to List<Item>
        final List<SolanaTokenItem> items = itemsJson.map((json) => SolanaTokenItem.fromJson(json)).toList();

        return Resource.success(data: items);

      } else {
        return Resource.error(code: response.statusCode, msg: response.body);
      }
    } catch (e) {
      return Resource.error(code: errorCodeException, msg: e.toString());
    }
  }
}