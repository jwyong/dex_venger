import 'package:dex_venger/database/entity/universal/token_entity.dart';
import 'package:dex_venger/database/entity/universal/token_price_entity.dart';
import 'package:dex_venger/database/my_database.dart';
import 'package:drift/drift.dart';

part 'token_price_dao.g.dart';

@DriftAccessor(tables: [TokenPriceEntity])
class TokenPriceDao extends DatabaseAccessor<MyDatabase> with _$TokenPriceDaoMixin {
  TokenPriceDao(MyDatabase db) : super(db);

  /// Bulk insert holdings of a wallet to db (just replace if conflict)
  Future<void> insertTokenPrices(List<TokenPriceEntityCompanion>? tokenPrices) async {
    if (tokenPrices?.isNotEmpty == true) {
      await db.batch((batch) {
        batch.insertAll(db.tokenPriceEntity, tokenPrices!, mode: InsertMode.insertOrReplace);
      });
    }
  }
}
