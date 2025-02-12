import 'package:dex_venger/database/entity/universal/token_entity.dart';
import 'package:dex_venger/database/my_database.dart';
import 'package:drift/drift.dart';

part 'token_dao.g.dart';

@DriftAccessor(tables: [TokenEntity])
class TokenDao extends DatabaseAccessor<MyDatabase> with _$TokenDaoMixin {
  TokenDao(MyDatabase db) : super(db);

  /// TODO: JAY_LOG - old code
  /// Insert
  // Future<void> insertDmcHotList(List<DmcHotEntityCompanion> list) async =>
  //     await db.batch((batch) => batch.insertAllOnConflictUpdate(db.dmcHotEntity, list));
  //
  // // Get hot lists in streams
  // Stream<List<DmcHotEntityData>> getDmcHotListStream(TimePeriod selectedTimePeriod) =>
  //     (select(dmcHotEntity)..where((tbl) => tbl.timePeriodIndex.equals(selectedTimePeriod.index))).watch();
  //
  // Future<int> clearDb() async => await delete(dmcHotEntity).go();
}
