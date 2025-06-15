import 'package:equatable/equatable.dart';

 abstract class AuthState extends Equatable {
  final bool isPasswordVisible;

  const AuthState({this.isPasswordVisible = false});

  @override
  List<Object?> get props => [isPasswordVisible];
}

class AuthInitial extends AuthState {
  const AuthInitial({super.isPasswordVisible});
}

class AuthLoading extends AuthState {
  const AuthLoading({super.isPasswordVisible});
}

class AuthLoggedIn extends AuthState {
  final String userId;

  const AuthLoggedIn({
    required this.userId,
    super.isPasswordVisible,
  });

  @override
  List<Object?> get props => [userId, isPasswordVisible];
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message, {super.isPasswordVisible});

  @override
  List<Object?> get props => [message, isPasswordVisible];
}