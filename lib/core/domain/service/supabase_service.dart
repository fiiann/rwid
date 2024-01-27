import 'dart:developer' as logger show log;

import 'package:flutter/foundation.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/features/list_posts/models/post_model.dart';
import 'package:rwid/features/tag/model/tag_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../features/auth/model/user_tag_model.dart';

class SupabaseService {
  final SupabaseClient _client;

  SupabaseService({required SupabaseClient client}) : _client = client;

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

  Future<BaseResponse<List<TagModel>?>?> getTag() async {
    try {
      final data = await _client.from('tag').select();
      logger.log(data.toString());
      return BaseResponse.ok(parseTagModelsListFromMap(data));
    } catch (e) {
      if (kDebugMode) {
        print('error get list tag : ${e.toString()}');
      }
      return BaseResponse.error(message: e.toString());
    }
  }

  Future<BaseResponse<void>> insertTagUser(List<TagModel> tags) async {
    try {
      final userId = _client.auth.currentUser?.id ?? '';
      await _client
          .from('user_tags')
          .upsert(parseTagModelListToUserTagsList(tags, userId));
      return BaseResponse.ok(null);
    } catch (e) {
      if (kDebugMode) {
        print('error insert tag : ${e.toString()}');
      }
      return BaseResponse.error(message: e.toString());
    }
  }

  Future<BaseResponse<List<UserTag>?>?> getUserTag() async {
    try {
      final data = await _client.from('user_tags').select();
      logger.log(data.toString());
      return BaseResponse.ok(parseUserTagListFromMap(data));
    } catch (e) {
      if (kDebugMode) {
        print('error get user tag : ${e.toString()}');
      }
      return BaseResponse.error(message: e.toString());
    }
  }

  ///POST
  Future<BaseResponse<List<PostModel>?>?> getPosts({String? keyword}) async {
    try {
      late var data;
      if (keyword != null) {
        data = await _client.from('posts').select().like('title', '%$keyword%');
      } else {
        data = await _client.from('posts').select();
      }
      logger.log(data.toString());
      return BaseResponse.ok(parsePostListFromMap(data));
    } catch (e) {
      if (kDebugMode) {
        print('error get posts : ${e.toString()}');
      }
      return BaseResponse.error(message: e.toString());
    }
  }
}
