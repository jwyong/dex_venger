import 'package:dex_venger/model/enum/token_chain.dart';
import 'package:drift/drift.dart';

/// Token basic details, regardless of what network it's on (unique by token address)
class TokenEntity extends Table {
  // Token address (String)
  TextColumn get tokenAddress => text()();

  @override
  Set<Column> get primaryKey => {tokenAddress};

  // Token display data
  TextColumn get imgUrl => text().nullable()();

  TextColumn get name => text().nullable()();

  TextColumn get symbol => text().nullable()();

  // Chain which this token is on. Can have same "coin" on different chains.
  IntColumn get network => intEnum<TokenChain>().withDefault(Constant(TokenChain.SOL.index))();
}
