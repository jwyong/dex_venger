import 'package:drift/drift.dart';

/// Held token (whatever is held in the wallet, should have a non-zero amount)
class HoldingEntity extends Table {
  // Token address (String)
  TextColumn get tokenAddress => text()();

  // Owner address (wallet)
  TextColumn get ownerAddress => text().nullable()();

  // Composite primary key of token + owner address
  @override
  Set<Column> get primaryKey => {tokenAddress, ownerAddress};

  // The number of tokens held - double
  RealColumn get amount => real().nullable()();

  // The total price of tokens held - double
  RealColumn get totalValue => real().nullable()();

  /// Calculated values
  // Average buy price: total of ALL buys / amount bought
  RealColumn get avgBuyPrice => real().nullable()();

  // Unrealised PNL (current price - avgBuyPrice) * amount
  RealColumn get pnlUnrealised => real().nullable()();

  // Realised PNL (TODO: JAY_LOG - check gpt calcs, understand formula and test)
  RealColumn get pnlRealised => real().nullable()();

  // TODO: JAY_LOG - any other good info?
}
