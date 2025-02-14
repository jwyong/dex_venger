import 'package:dex_venger/base/base_view_model.dart';
import 'package:dex_venger/base/resource.dart';
import 'package:dex_venger/database/dao/universal/token_dao.dart';
import 'package:dex_venger/database/my_database.dart';
import 'package:dex_venger/repository/db/token_repo.dart';
import 'package:dex_venger/repository/http/solana_http_repo.dart';
import 'package:dex_venger/repository/wrapper/solana_db_repo.dart';
import 'package:dex_venger/view_models/wallet_address_vm.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addWalletVMProvider = StateNotifierProvider<AddWalletViewModel, AsyncValue<String?>>(
  (ref) => AddWalletViewModel(ref.read(solanaHttpRepo), ref.read(solanaDbRepo)),
);

/// User click next button:
/// - TODO: JAY_LOG - recognise Solana, ETH, etc and add to db. Treated as a different address.
/// - call Helius API: getAssetsForWallet - process and add to db for Holdings list
/// - start transactions syncing process in parallel with getAssets API (need to notify global loading UI too)
/// - update sharedPrefs and update walletAddressNotifier, to change UI to home
class AddWalletViewModel extends BaseViewModel<String?> {
  final SolanaHttpRepo _solanaHttpRepo;
  final SolanaDbRepo _solanaDbRepo;

  AddWalletViewModel(this._solanaHttpRepo, this._solanaDbRepo) : super(null);

  Future<Resource> addWalletOnClick(WidgetRef ref, String walletAddress) async {
    // TODO: JAY_LOG - get signatures + transactions in parallel with assets. Tie together with loading indicator (and continue in "service" if possible).
    // Get assets for this wallet from Helius API
    final result = await _solanaHttpRepo.getTokensForAddress(walletAddress);

    if (result?.isSuccess == true) {
      // Bulk insert to tokens basic details to Tokens db (ignore on conflict)
      _solanaDbRepo.tokenRepo.insertSolanaTokens(result?.data);

      // Bulk insert token prices (update on conflict)
      _solanaDbRepo.tokenPriceRepo.insertSolanaTokenPrices(result?.data);

      // Insert holdings basic details to Holdings db (calculate additional data after txn API)
      _solanaDbRepo.holdingRepo.insertHoldings(result?.data, walletAddress);

      // Update Riverpod state after all operations successful
      ref.read(walletAddressVMProvider.notifier).setWallet(walletAddress);

      return Resource.success();
    } else {
      return Resource.errorRes(result);
    }
  }
}
