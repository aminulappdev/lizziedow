enum Status { loading, completed, error }

class ApiResponse<T> {
  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : this(Status.loading, null, null);

  ApiResponse.completed(T data) : this(Status.completed, data, null);

  ApiResponse.error(String message) : this(Status.error, null, message);

  final Status status;
  final T? data;
  final String? message;

  @override
  String toString() {
    return 'ApiResponse{status: $status, data: $data, message: $message}';
  }
}
