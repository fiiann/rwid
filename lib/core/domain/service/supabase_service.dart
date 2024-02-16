import 'dart:developer' as logger show log;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/features/bookmarks/models/bookmark_model.dart';
import 'package:rwid/features/posts/models/post_model.dart';
import 'package:rwid/features/tag/model/tag_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../features/auth/model/user_tag_model.dart';

class SupabaseService {
  final SupabaseClient _client;
  final Box _box;
  SupabaseService({required SupabaseClient client, required Box box})
      : _box = box,
        _client = client;

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
      late PostgrestList data;
      if (keyword != null) {
        data = await _client
            .from('posts')
            .select()
            .ilike('title', '%$keyword%')
            .order('created_at', ascending: false);
      } else {
        data = await _client
            .from('posts')
            .select()
            .order('created_at', ascending: false);
      }
      // logger.log(data.toString());
      return BaseResponse.ok(parsePostListFromMap(data));
    } catch (e) {
      if (kDebugMode) {
        print('error get posts : ${e.toString()}');
      }
      return BaseResponse.error(message: e.toString());
    }
  }

  Future<BaseResponse<void>> insertPost(
      PostModel postModel, File imageFile) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      await _client.storage
          .from('image_post') // Replace with your bucket name
          .upload(fileName, imageFile,
              fileOptions: const FileOptions(
                contentType: 'image/jpeg',
              ));

      final String publicUrl =
          _client.storage.from('image_post').getPublicUrl(fileName);
      final idUser = _getUser(_box);
      postModel = postModel.copyWith(image: publicUrl, userId: idUser);
      await _client.from('posts').insert(postModel.toJson());
      return BaseResponse.ok(null);
    } catch (e) {
      if (kDebugMode) {
        print('error insert post : ${e.toString()}');
      }
      return BaseResponse.error(message: e.toString());
    }
  }

  //DETAIL POST
  Future<BaseResponse<PostModel?>> getDetailPost(int id) async {
    try {
      final data = await _client.from('posts').select().eq('id', id);
      if (data.isEmpty) {
        return BaseResponse.error(message: 'ID $id not found');
      } else {
        return BaseResponse.ok(PostModel.fromMap(data[0]));
      }
    } catch (e) {
      if (kDebugMode) {
        print('error get detail post : ${e.toString()}');
      }
      return BaseResponse.error(message: e.toString());
    }
  }

  //USING THIS FUNCTION RATHER THAN GET ID FROM GET FROM DIRECT SUPABASE,
  // THIS IS SHOULD BE DONE WITH RLS, BUT I DON'T KNOW TO DO WITH THAT :)
  String _getUser(Box<dynamic> box) {
    final user = _box.get('user');
    final idUser = user.id;
    return idUser;
  }

  Future<BaseResponse<void>> toogleBookmark(int idPost) async {
    try {
      final idUser = _getUser(_box);
      final data = await _client
          .from('bookmarks')
          .select('id')
          .eq('user_id', idUser)
          .eq('post_id', idPost);
      if (data.isEmpty) {
        //INSERT BOOKMARK
        final bookmark = BookmarkModel(userId: idUser, postId: idPost);
        await _client
            .from('bookmarks')
            .insert(parseBookmarkModelToMap(bookmark));
        return BaseResponse.ok(null);
      } else {
        final bookmark = BookmarkModel.fromMap(data[0]);
        //REMOVE BOOKMARK
        await _client
            .from('bookmarks')
            .delete()
            .match({'id': bookmark.id ?? 0});
        return BaseResponse.ok(null);
      }
    } catch (e) {
      if (kDebugMode) {
        print('error toogle bookmark post : ${e.toString()}');
      }
      return BaseResponse.error(message: e.toString());
    }
  }
}
