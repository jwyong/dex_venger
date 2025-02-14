import 'package:dex_venger/const/sp_const.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Global notifier for a selected wallet address. if null / empty, will show "Add wallet page".
final walletAddressVMProvider = StateNotifierProvider<WalletAddressVM, String?>(
      (ref) => WalletAddressVM(),
);

class WalletAddressVM extends StateNotifier<String?> {
  WalletAddressVM() : super(null) {
    _loadWallet();
  }

  Future<void> _loadWallet() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getString(sp_wallet_address);
  }

  Future<void> setWallet(String newAddress) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(sp_wallet_address, newAddress);
    state = newAddress;
  }

  Future<void> clearWallet() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(sp_wallet_address);
    state = null;
  }
}
