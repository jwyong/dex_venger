import 'dart:math';

import 'package:dex_venger/base/base_repo.dart';
import 'package:dex_venger/database/dao/universal/holding_dao.dart';
import 'package:dex_venger/database/dao/universal/token_dao.dart';
import 'package:dex_venger/database/my_database.dart';
import 'package:dex_venger/ext/num_ext.dart';
import 'package:dex_venger/model/api/solana/solana_token_item.dart';
import 'package:dex_venger/model/enum/token_chain.dart';
import 'package:dex_venger/model/ui/holding.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final holdingRepo = Provider((ref) => HoldingRepo());

/// Solana related APIs to get blockchain data (Helius)
class HoldingRepo extends BaseRepo {
  late final _holdingDao = HoldingDao(database);

  Future<void> insertHoldings(List<SolanaTokenItem>? solanaTokens, String ownerWalletAddress) async {
    debugPrint("JAY_LOG: HoldingRepo, insertHoldings, solanaTokens = $solanaTokens");

    final holdingCompanions = solanaTokens?.map((item) {
      // Amount needs to be adjusted with decimals of the crypto token
      double? amount;
      final balance = item.token_info?.balance?.toDouble();
      if (balance != null) {
        final decimals = item.token_info?.decimals?.toDouble()?? 0;
        amount = balance.safeDiv(pow(10, decimals)).toDouble();
      }

      return HoldingEntityCompanion.insert(
        tokenAddress: item.id,
        ownerAddress: Value(ownerWalletAddress),
        amount: Value(amount),
        totalValue: Value(item.token_info?.price_info?.total_price),

        // Calculated data e.g. avgBuyPrice, PnL are to be calculated and updated later (after getting transactions)
      );
    }).toList();
    await _holdingDao.insertHoldings(holdingCompanions);
  }

  // Get combined list of Holding items for display on Holdings List UI
  Stream<List<Holding>> watchHoldings(String walletAddress) {
    final holdingEntity = database.holdingEntity;
    final tokenEntity = database.tokenEntity;

    // Show every holding for this walletAddress, with additional info from token and prices tables.
    final query = database.select(holdingEntity).join([
      leftOuterJoin(tokenEntity, tokenEntity.tokenAddress.equalsExp(holdingEntity.tokenAddress)),
    ])
      ..where(holdingEntity.ownerAddress.equals(walletAddress))
      ..orderBy([
        OrderingTerm.desc(holdingEntity.totalValue),
      ]);

    ; // Filter by walletAddress

    return query.watch().map((rows) {
      return rows.map((row) {
        final holding = row.readTable(holdingEntity);
        final token = row.readTableOrNull(tokenEntity);

        return Holding(
            id: '${holding.tokenAddress}|${holding.ownerAddress}',
            imgUrl: token?.imgUrl,
            name: token?.name,
            symbol: token?.symbol,
            amount: holding.amount,
            totalValue: holding.totalValue,
            pnlUnrealised: holding.pnlUnrealised);
      }).toList();
    });
  }
}
