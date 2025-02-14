import 'package:dex_venger/database/my_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

abstract class BaseViewModel<T> extends StateNotifier<AsyncValue<T>> {
  BaseViewModel(T initialState) : super(AsyncValue.data(initialState));

  /// Set loading state
  void setLoading() {
    state = const AsyncValue.loading();
  }

  /// Set success state
  void setData(T data) {
    state = AsyncValue.data(data);
  }

  /// Set error state
  void setError(Object error, [StackTrace? stackTrace]) {
    state = AsyncValue.error(error, stackTrace ?? StackTrace.current);
  }
}
