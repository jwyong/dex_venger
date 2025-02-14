import 'package:dex_venger/model/enum/token_chain.dart';
import 'package:drift/drift.dart';

/// Token price in USD, regardless of network
class TokenPriceEntity extends Table {
  // Token address (String)
  TextColumn get tokenAddress => text()();

  @override
  Set<Column> get primaryKey => {tokenAddress};

  // Numerical data
  RealColumn get price => real().nullable()();
}
