import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/domain/model/user_rwid.dart';
import 'package:rwid/core/enum/enum.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required SupabaseClient supabase})
      : _supabase = supabase,
        super(const AuthState());

  final SupabaseClient _supabase;
  void loginGoogle() async {
    emit(state.copyWith(statusLogin: ProgressStatus.loading));
    try {
      final googleSignIn = GoogleSignIn(
        clientId: androidClientId,
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final accessToken = googleAuth.accessToken;
        final idToken = googleAuth.idToken;
        if (accessToken == null) {
          emit(state.copyWith(
              statusLogin: ProgressStatus.failed,
              errorMessage: 'No Access Token Found'));
        }
        if (idToken == null) {
          emit(state.copyWith(
              statusLogin: ProgressStatus.failed,
              errorMessage: 'No ID Token Found'));
        }

        final response = await _supabase.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          accessToken: accessToken,
          idToken: idToken!,
        );

        if (response.user != null) {
          emit(state.copyWith(
              statusLogin: ProgressStatus.success,
              authenticationStatus: AuthenticationStatus.login,
              authResponse: response));
        } else {
          emit(state.copyWith(statusLogin: ProgressStatus.failed));
        }
      }
      emit(state.copyWith(
          statusLogin: ProgressStatus.failed, errorMessage: 'User Canceled'));
    } catch (e) {
      if (kDebugMode) {
        print('error google sign in : $e');
      }
      emit(state.copyWith(
          statusLogin: ProgressStatus.failed,
          errorMessage: 'Error, Please Try Again'));
    }
  }

  void logout() async {
    emit(state.copyWith(statusLogout: ProgressStatus.loading));
    try {
      await _supabase.auth.signOut();
      emit(state.copyWith(
          statusLogout: ProgressStatus.success,
          authenticationStatus: AuthenticationStatus.logout,
          authResponse: null));
    } catch (e) {
      if (kDebugMode) {
        print('error logout : $e');
      }
      emit(state.copyWith(
          statusLogout: ProgressStatus.failed, errorMessage: 'Failed Logout'));
    }
  }
}
