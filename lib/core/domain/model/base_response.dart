import 'package:equatable/equatable.dart';

enum ResponseState { ok, error, initial, loading }

///this class created to encapsulate state data
///with <T> as type of object
class BaseResponse<T> extends Equatable {
  static const String errorMessage = 'Something went wrong! Please try again.';

  final ResponseState state;
  final T? data;
  final String message;

  const BaseResponse({
    this.state = ResponseState.initial,
    this.data,
    this.message = '',
  });

  static BaseResponse<T> loading<T>({T? data}) {
    return BaseResponse(state: ResponseState.loading, data: data);
  }

  static BaseResponse<T> ok<T>(T data) {
    return BaseResponse(
      state: ResponseState.ok,
      data: data,
    );
  }

  static BaseResponse<T> error<T>(
      {String message = BaseResponse.errorMessage}) {
    return BaseResponse(state: ResponseState.error, message: message);
  }

  BaseResponse<T> copyWith({ResponseState? state, T? data, String? message}) {
    return BaseResponse<T>(
        state: state ?? this.state,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props {
    return [state, data, message];
  }
}
