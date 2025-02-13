enum Status { success, error, loading }

class Resource<T> {
  final Status status;
  final T? data;
  final String? message;

  Resource._({required this.status, this.data, this.message});

  static Resource<T> success<T>(T data) => Resource._(status: Status.success, data: data);
  static Resource<T> error<T>(String message) => Resource._(status: Status.error, message: message);
  static Resource<T> loading<T>() => Resource._(status: Status.loading);
}