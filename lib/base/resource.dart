enum Status { success, error, loading }

class Resource<T> {
  final Status status;
  final T? data;
  final int? errorCode;
  final String? errorMessage;

  Resource._({required this.status, this.data, this.errorCode, this.errorMessage});

  static Resource<T> success<T>({T? data}) => Resource._(status: Status.success, data: data);

  static Resource<T> error<T>({int? code, String? msg}) =>
      Resource._(status: Status.error, errorCode: code, errorMessage: msg);

  static Resource<T> errorRes<T>(Resource<T>? resource) =>
      Resource._(status: Status.error, errorCode: resource?.errorCode, errorMessage: resource?.errorMessage);

  static Resource<T> loading<T>() => Resource._(status: Status.loading);

  bool get isSuccess => status == Status.success;
}
