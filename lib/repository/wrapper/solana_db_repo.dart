import 'package:dex_venger/base/base_repo.dart';
import 'package:dex_venger/repository/db/holding_repo.dart';
import 'package:dex_venger/repository/db/token_price_repo.dart';
import 'package:dex_venger/repository/db/token_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Main repo for Solana operations (contains all Solana-related db repos)
final solanaDbRepo = Provider((ref) => SolanaDbRepo());

class SolanaDbRepo {
  late final tokenRepo = TokenRepo();
  late final holdingRepo = HoldingRepo();
  late final tokenPriceRepo = TokenPriceRepo();
}