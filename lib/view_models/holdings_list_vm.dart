import 'package:dex_venger/base/base_view_model.dart';
import 'package:dex_venger/model/ui/holding.dart';
import 'package:dex_venger/repository/db/holding_repo.dart';
import 'package:dex_venger/view_models/wallet_address_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final holdingsListVmProvider = StateNotifierProvider<HoldingsListVm, AsyncValue<List<Holding>?>>((ref) {
  final repo = ref.read(holdingRepo);
  final walletAddress = ref.watch(walletAddressVMProvider);

  return HoldingsListVm(walletAddress, repo);
});

// PagingController provider
final holdingsPagingControllerProvider = Provider.autoDispose<PagingController<int, Holding>>((ref) {
  final controller = PagingController<int, Holding>(firstPageKey: 0);

  ref.onDispose(() {
    controller.dispose();
  });

  return controller;
});

class HoldingsListVm extends BaseViewModel<List<Holding>?> {
  final String? _walletAddress;
  final HoldingRepo _holdingRepo;

  HoldingsListVm(this._walletAddress, this._holdingRepo) : super(null) {
    _watchHoldings();
  }

  void _watchHoldings() {
    if (_walletAddress.isBlank == null) return;

    _holdingRepo.watchHoldings(_walletAddress!).listen((holdings) {
      setData(holdings);
    }, onError: (e, stack) {
      setError(e, stack);
    });
  }
}
