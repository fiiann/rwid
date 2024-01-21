import 'package:flutter/foundation.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Service {
  final SupabaseClient _client;

  Service({required SupabaseClient client}) : _client = client;

  Future<BaseResponse<AuthResponse>> signInWithIdToken(
      {required String? accessToken, required String idToken}) async {
    try {
      final response = await _client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        accessToken: accessToken,
        idToken: idToken,
      );
      return BaseResponse.ok(response);
    } catch (e) {
      if (kDebugMode) {
        print('error login with google : ${e.toString()}');
      }
      return BaseResponse.error(message: e.toString());
    }
  }

  Future<BaseResponse<AuthResponse>> registerWithEmail(
      {required String email, required String? password}) async {
    try {
      final res =
          await _client.auth.signUp(email: email, password: password ?? '');
      return BaseResponse.ok(res);
    } catch (e) {
      if (kDebugMode) {
        print('error login with google : ${e.toString()}');
      }
      return BaseResponse.error(message: e.toString());
    }
  }

  Future<BaseResponse<void>> signOut() async {
    try {
      await _client.auth.signOut();
      return BaseResponse.ok(null);
    } catch (e) {
      if (kDebugMode) {
        print('error logout : ${e.toString()}');
      }
      return BaseResponse.error(message: e.toString());
    }
  }
}
