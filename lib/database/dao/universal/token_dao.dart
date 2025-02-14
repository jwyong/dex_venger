import 'package:dex_venger/database/entity/universal/token_entity.dart';
import 'package:dex_venger/database/my_database.dart';
import 'package:drift/drift.dart';

part 'token_dao.g.dart';

@DriftAccessor(tables: [TokenEntity])
class TokenDao extends DatabaseAccessor<MyDatabase> with _$TokenDaoMixin {
  TokenDao(MyDatabase db) : super(db);

  /// Bulk insert tokens to db, ignore if already exists
  Future<void> insertTokens(List<TokenEntityCompanion>? tokens) async {
    if (tokens?.isNotEmpty == true) {
      await db.batch((batch) {
        batch.insertAll(db.tokenEntity, tokens!, mode: InsertMode.insertOrIgnore);
      });
    }
  }
}
