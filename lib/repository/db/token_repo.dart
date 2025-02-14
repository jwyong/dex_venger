import 'package:dex_venger/base/base_repo.dart';
import 'package:dex_venger/database/dao/universal/token_dao.dart';
import 'package:dex_venger/database/my_database.dart';
import 'package:dex_venger/model/api/solana/solana_token_item.dart';
import 'package:dex_venger/model/enum/token_chain.dart';
import 'package:drift/drift.dart';

/// Solana related APIs to get blockchain data (Helius)
class TokenRepo extends BaseRepo {
  late final _tokenDao = TokenDao(database);

  Future<void> insertSolanaTokens(List<SolanaTokenItem>? solanaTokens) async {
    final tokenCompanions = solanaTokens?.map((item) {
      final metadata = item.content?.metadata;

      return TokenEntityCompanion.insert(
        tokenAddress: item.id,
        imgUrl: Value(item.content?.links?.image),
        name: Value(metadata?.name),
        symbol: Value(metadata?.symbol),
        network: Value(TokenChain.SOL)
      );
    }).toList();
    await _tokenDao.insertTokens(tokenCompanions);
  }
}
