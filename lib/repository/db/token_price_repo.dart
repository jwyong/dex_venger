import 'package:dex_venger/base/base_repo.dart';
import 'package:dex_venger/database/dao/universal/token_dao.dart';
import 'package:dex_venger/database/dao/universal/token_price_dao.dart';
import 'package:dex_venger/database/my_database.dart';
import 'package:dex_venger/model/api/solana/solana_token_item.dart';
import 'package:dex_venger/model/enum/token_chain.dart';
import 'package:drift/drift.dart';

/// Solana related APIs to get blockchain data (Helius)
class TokenPriceRepo extends BaseRepo {
  late final _tokenPriceDao = TokenPriceDao(database);

  Future<void> insertSolanaTokenPrices(List<SolanaTokenItem>? solanaTokens) async {
    final tokenPriceCompanions = solanaTokens?.map((item) {
      return TokenPriceEntityCompanion.insert(
        tokenAddress: item.id,
        price: Value(item.token_info?.price_info?.price_per_token)
      );
    }).toList();
    await _tokenPriceDao.insertTokenPrices(tokenPriceCompanions);
  }
}
