import 'package:dex_venger/const/sp_const.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final walletNotifierProvider = StateNotifierProvider<WalletNotifier, String?>(
      (ref) => WalletNotifier(),
);

class WalletNotifier extends StateNotifier<String?> {
  WalletNotifier() : super(null) {
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
