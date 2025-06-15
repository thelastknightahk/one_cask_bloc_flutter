import 'package:clevit_flutter_bloc/presentation/bloc/auth/auth_event.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading(isPasswordVisible: state.isPasswordVisible));

    try {
      // Simulate login delay
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Replace with real auth check
      if (event.email == "test@example.com" && event.password == "1234") {
        emit(
          AuthLoggedIn(
            userId: "user-123",
            isPasswordVisible: state.isPasswordVisible,
          ),
        );
      } else {
        emit(
          AuthError(
            "Invalid credentials",
            isPasswordVisible: state.isPasswordVisible,
          ),
        );
      }
    } catch (e) {
      emit(
        AuthError("Login failed", isPasswordVisible: state.isPasswordVisible),
      );
    }
  }

  void _onTogglePasswordVisibility(
    TogglePasswordVisibility event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state is AuthInitial
          ? AuthInitial(isPasswordVisible: !state.isPasswordVisible)
          : state is AuthLoading
          ? AuthLoading(isPasswordVisible: !state.isPasswordVisible)
          : state is AuthLoggedIn
          ? AuthLoggedIn(
            userId: (state as AuthLoggedIn).userId,
            isPasswordVisible: !state.isPasswordVisible,
          )
          : state is AuthError
          ? AuthError(
            (state as AuthError).message,
            isPasswordVisible: !state.isPasswordVisible,
          )
          : AuthInitial(isPasswordVisible: !state.isPasswordVisible),
    );
  }
}
