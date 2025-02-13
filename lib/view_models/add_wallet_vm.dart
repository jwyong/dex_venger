import 'package:dex_venger/repository/http/solana_repo.dart';
import 'package:dex_venger/view_models/wallet_address_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addWalletVMProvider =
StateNotifierProvider<AddWalletViewModel, AsyncValue<String?>>(
      (ref) => AddWalletViewModel(ref.read(solanaRepo)),
);

/// User click next button:
/// - TODO: JAY_LOG - recognise Solana, ETH, etc and add to db. Treated as a different address.
/// - call Helius API: getAssetsForWallet - process and add to db for Holdings list
/// - start transactions syncing process in parallel with getAssets API (need to notify global loading UI too)
/// - update sharedPrefs and update walletAddressNotifier, to change UI to home
class AddWalletViewModel extends StateNotifier<AsyncValue<String?>> {
  final SolanaRepo _solanaRepo;

  AddWalletViewModel(this._solanaRepo) : super(const AsyncValue.data(null));

  void addWalletOnClick(WidgetRef ref, String walletAddress) {
    // Get assets for this wallet from Helius API
    _solanaRepo.getTokensForAddress(walletAddress)

    // Update Riverpod state (update sp there as well)
    ref.read(walletAddressVMProvider.notifier).setWallet(walletAddress);
  }
}
