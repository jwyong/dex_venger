import 'dart:io';

import 'package:dex_venger/database/dao/universal/token_dao.dart';
import 'package:dex_venger/database/entity/universal/token_entity.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'my_database.g.dart';

@DriftDatabase(tables: [TokenEntity], daos: [TokenDao])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  // TODO: JAY_LOG - need to clear sp as well when upgrading schemaVersion. Otherwise, need to write migration strategy.
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
