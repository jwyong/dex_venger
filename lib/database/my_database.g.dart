// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// ignore_for_file: type=lint
class $TokenEntityTable extends TokenEntity
    with TableInfo<$TokenEntityTable, TokenEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TokenEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, symbol];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'token_entity';
  @override
  VerificationContext validateIntegrity(Insertable<TokenEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TokenEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TokenEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol']),
    );
  }

  @override
  $TokenEntityTable createAlias(String alias) {
    return $TokenEntityTable(attachedDatabase, alias);
  }
}

class TokenEntityData extends DataClass implements Insertable<TokenEntityData> {
  final String id;
  final String? name;
  final String? symbol;
  const TokenEntityData({required this.id, this.name, this.symbol});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || symbol != null) {
      map['symbol'] = Variable<String>(symbol);
    }
    return map;
  }

  TokenEntityCompanion toCompanion(bool nullToAbsent) {
    return TokenEntityCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      symbol:
          symbol == null && nullToAbsent ? const Value.absent() : Value(symbol),
    );
  }

  factory TokenEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TokenEntityData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      symbol: serializer.fromJson<String?>(json['symbol']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String?>(name),
      'symbol': serializer.toJson<String?>(symbol),
    };
  }

  TokenEntityData copyWith(
          {String? id,
          Value<String?> name = const Value.absent(),
          Value<String?> symbol = const Value.absent()}) =>
      TokenEntityData(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        symbol: symbol.present ? symbol.value : this.symbol,
      );
  TokenEntityData copyWithCompanion(TokenEntityCompanion data) {
    return TokenEntityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TokenEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('symbol: $symbol')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, symbol);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TokenEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.symbol == this.symbol);
}

class TokenEntityCompanion extends UpdateCompanion<TokenEntityData> {
  final Value<String> id;
  final Value<String?> name;
  final Value<String?> symbol;
  final Value<int> rowid;
  const TokenEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.symbol = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TokenEntityCompanion.insert({
    required String id,
    this.name = const Value.absent(),
    this.symbol = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<TokenEntityData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? symbol,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (symbol != null) 'symbol': symbol,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TokenEntityCompanion copyWith(
      {Value<String>? id,
      Value<String?>? name,
      Value<String?>? symbol,
      Value<int>? rowid}) {
    return TokenEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TokenEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('symbol: $symbol, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  $MyDatabaseManager get managers => $MyDatabaseManager(this);
  late final $TokenEntityTable tokenEntity = $TokenEntityTable(this);
  late final TokenDao tokenDao = TokenDao(this as MyDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tokenEntity];
}

typedef $$TokenEntityTableCreateCompanionBuilder = TokenEntityCompanion
    Function({
  required String id,
  Value<String?> name,
  Value<String?> symbol,
  Value<int> rowid,
});
typedef $$TokenEntityTableUpdateCompanionBuilder = TokenEntityCompanion
    Function({
  Value<String> id,
  Value<String?> name,
  Value<String?> symbol,
  Value<int> rowid,
});

class $$TokenEntityTableFilterComposer
    extends Composer<_$MyDatabase, $TokenEntityTable> {
  $$TokenEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get symbol => $composableBuilder(
      column: $table.symbol, builder: (column) => ColumnFilters(column));
}

class $$TokenEntityTableOrderingComposer
    extends Composer<_$MyDatabase, $TokenEntityTable> {
  $$TokenEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get symbol => $composableBuilder(
      column: $table.symbol, builder: (column) => ColumnOrderings(column));
}

class $$TokenEntityTableAnnotationComposer
    extends Composer<_$MyDatabase, $TokenEntityTable> {
  $$TokenEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);
}

class $$TokenEntityTableTableManager extends RootTableManager<
    _$MyDatabase,
    $TokenEntityTable,
    TokenEntityData,
    $$TokenEntityTableFilterComposer,
    $$TokenEntityTableOrderingComposer,
    $$TokenEntityTableAnnotationComposer,
    $$TokenEntityTableCreateCompanionBuilder,
    $$TokenEntityTableUpdateCompanionBuilder,
    (
      TokenEntityData,
      BaseReferences<_$MyDatabase, $TokenEntityTable, TokenEntityData>
    ),
    TokenEntityData,
    PrefetchHooks Function()> {
  $$TokenEntityTableTableManager(_$MyDatabase db, $TokenEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TokenEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TokenEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TokenEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> symbol = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TokenEntityCompanion(
            id: id,
            name: name,
            symbol: symbol,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> name = const Value.absent(),
            Value<String?> symbol = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TokenEntityCompanion.insert(
            id: id,
            name: name,
            symbol: symbol,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TokenEntityTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $TokenEntityTable,
    TokenEntityData,
    $$TokenEntityTableFilterComposer,
    $$TokenEntityTableOrderingComposer,
    $$TokenEntityTableAnnotationComposer,
    $$TokenEntityTableCreateCompanionBuilder,
    $$TokenEntityTableUpdateCompanionBuilder,
    (
      TokenEntityData,
      BaseReferences<_$MyDatabase, $TokenEntityTable, TokenEntityData>
    ),
    TokenEntityData,
    PrefetchHooks Function()>;

class $MyDatabaseManager {
  final _$MyDatabase _db;
  $MyDatabaseManager(this._db);
  $$TokenEntityTableTableManager get tokenEntity =>
      $$TokenEntityTableTableManager(_db, _db.tokenEntity);
}
