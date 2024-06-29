part of 'authentication_cubit.dart';

sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationSuccess extends AuthenticationState {}

final class ValidationErrorChange extends AuthenticationState {}

final class AuthenticationError extends AuthenticationState {
  final String message;
  AuthenticationError(this.message);
}
