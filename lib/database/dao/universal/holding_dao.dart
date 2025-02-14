import 'package:dex_venger/database/entity/universal/holding_entity.dart';
import 'package:dex_venger/database/my_database.dart';
import 'package:drift/drift.dart';

part 'holding_dao.g.dart';

@DriftAccessor(tables: [HoldingEntity])
class HoldingDao extends DatabaseAccessor<MyDatabase> with _$HoldingDaoMixin {
  HoldingDao(MyDatabase db) : super(db);

  /// Bulk insert holdings of a wallet to db (just replace if conflict)
  Future<void> insertHoldings(List<HoldingEntityCompanion>? holdings) async {
    if (holdings?.isNotEmpty == true) {
      await db.batch((batch) {
        batch.insertAll(db.holdingEntity, holdings!, mode: InsertMode.insertOrReplace);
      });
    }
  }
}
