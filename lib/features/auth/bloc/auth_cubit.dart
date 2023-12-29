import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rwid/core/constant/constant.dart';
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
    emit(state.copyWith(status: ProgressStatus.loading));
    try {
      final googleSignIn = GoogleSignIn(
        clientId: AppConstant.androidClientId,
        serverClientId: AppConstant.webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final accessToken = googleAuth.accessToken;
        final idToken = googleAuth.idToken;
        if (accessToken != null && idToken != null) {
          final response = await _supabase.auth.signInWithIdToken(
            provider: OAuthProvider.google,
            accessToken: accessToken,
            idToken: idToken,
          );
          emit(state.copyWith(
              status: response.user != null
                  ? ProgressStatus.success
                  : ProgressStatus.failed));
          return;
        }
      }
      emit(state.copyWith(status: ProgressStatus.failed));
    } catch (e) {
      if (kDebugMode) {
        print('error google sign in : $e');
      }
      emit(state.copyWith(status: ProgressStatus.failed));
    }
  }
}
