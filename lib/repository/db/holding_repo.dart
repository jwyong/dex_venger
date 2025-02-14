import 'package:dex_venger/base/base_repo.dart';
import 'package:dex_venger/database/dao/universal/holding_dao.dart';
import 'package:dex_venger/database/dao/universal/token_dao.dart';
import 'package:dex_venger/database/my_database.dart';
import 'package:dex_venger/model/api/solana/solana_token_item.dart';
import 'package:dex_venger/model/enum/token_chain.dart';
import 'package:drift/drift.dart';

/// Solana related APIs to get blockchain data (Helius)
class HoldingRepo extends BaseRepo {
  late final _holdingDao = HoldingDao(database);

  Future<void> insertHoldings(List<SolanaTokenItem>? solanaTokens, String ownerWalletAddress) async {
    final holdingCompanions = solanaTokens?.map((item) {

      return HoldingEntityCompanion.insert(
        tokenAddress: item.id,
        ownerAddress: Value(ownerWalletAddress),
        amount: Value(item.token_info?.balance?.toDouble()),
        totalValue: Value(item.token_info?.price_info?.total_price),

        // Calculated data e.g. avgBuyPrice, PnL are to be calculated and updated later (after getting transactions)

      );
    }).toList();
    await _holdingDao.insertHoldings(holdingCompanions);
  }
}
