import 'package:dex_venger/base/base_stateless_widget.dart';
import 'package:dex_venger/const/sp_const.dart';
import 'package:dex_venger/view_models/add_wallet_vm.dart';
import 'package:dex_venger/view_models/wallet_address_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddWalletPage extends BaseStatelessWidget {
  final TextEditingController _walletController = TextEditingController();

  AddWalletPage({super.key});

  Future<void> _pasteFromClipboard() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null) {
      _walletController.text = data.text!;
    }
  }

  Future<void> _validateAddress(BuildContext context, WidgetRef ref) async {
    final walletAddress = _walletController.text.trim();
    if (walletAddress.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(s.wallet_address_invalid)),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final addWalletVM = ProviderScope.containerOf(context).read(addWalletVMProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(s.add_wallet_title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              s.add_wallet_desc,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            // Wallet Address Input Field
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _walletController,
                    decoration: InputDecoration(
                      hintText: s.enter_wallet_address,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // Paste Button
                ElevatedButton(
                  onPressed: _pasteFromClipboard,
                  child: Text(s.paste),
                ),
              ],
            ),

            const Spacer(),

            // Next Button
            Consumer(
              builder: (context, ref, child) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final result = await addWalletVM.addWalletOnClick(ref, _walletController.text);
                      if (result.isSuccess != true) {
                        if (!context.mounted) return;

                        final msg = 'Error ${result.errorCode}: ${result.errorMessage ?? s.error_generic}';
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(msg)),
                        );
                      }
                    },
                    child: Text(s.next),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
