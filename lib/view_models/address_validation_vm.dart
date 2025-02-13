import 'package:dex_venger/repository/http/solana_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addressValidationVMProvider =
StateNotifierProvider<AddressValidationVM, AsyncValue<String?>>(
      (ref) => AddressValidationVM(),
);

/// Address validation:
/// - not null / empty
/// - TODO: JAY_LOG - differentiate Solana, ETH, etc (and valid address for each)
class AddressValidationVM extends StateNotifier<AsyncValue<String?>> {
  AddressValidationVM() : super(const AsyncValue.data(null));


}
