import 'package:dio/dio.dart';

abstract class Failuer {
  final String errorMessage;

  Failuer({required this.errorMessage});
}

class ServerFailuer extends Failuer {
  ServerFailuer({required super.errorMessage});

  factory ServerFailuer.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuer(
          errorMessage:
              "Connection timeout with the server. Please check your internet.",
        );
      case DioExceptionType.sendTimeout:
        return ServerFailuer(
          errorMessage: "Send timeout occurred. Please try again.",
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailuer(
          errorMessage:
              "Receive timeout from the server. Please try again later.",
        );
      case DioExceptionType.badCertificate:
        return ServerFailuer(
          errorMessage:
              "Bad SSL certificate. Unable to establish a secure connection.",
        );
      case DioExceptionType.badResponse:
        return ServerFailuer.fromResponse(
          e.response?.statusCode,
          e.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailuer(
          errorMessage: "The request was cancelled before completion.",
        );
      case DioExceptionType.connectionError:
        return ServerFailuer(
          errorMessage:
              "Failed to connect to the server. Please check your network.",
        );
      case DioExceptionType.unknown:
        return ServerFailuer(
          errorMessage:
              "An unknown error occurred while processing the request.",
        );
    }
  }

  factory ServerFailuer.fromResponse(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return ServerFailuer(
          errorMessage: "Bad request. Please check your input.",
        );
      case 401:
        return ServerFailuer(
          errorMessage: "Unauthorized. Please log in again.",
        );
      case 403:
        return ServerFailuer(
          errorMessage:
              "Forbidden. You don’t have permission to access this resource.",
        );
      case 404:
        return ServerFailuer(
          errorMessage: "Not found. The requested resource doesn’t exist.",
        );
      case 409:
        return ServerFailuer(
          errorMessage: "Conflict occurred. Please try again.",
        );
      case 500:
        return ServerFailuer(
          errorMessage: "Internal server error. Please try again later.",
        );
      case 502:
        return ServerFailuer(
          errorMessage: "Bad gateway. The server is unavailable.",
        );
      case 503:
        return ServerFailuer(
          errorMessage: "Service unavailable. Please try again later.",
        );
      default:
        return ServerFailuer(
          errorMessage: "Unexpected server error (status code: $statusCode).",
        );
    }
  }
}
