import 'dart:developer' as logger show log;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/domain/model/user_rwid.dart';
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
  Future<BaseResponse<List<PostModel>?>> getPosts(
      {String? keyword, int startIndex = 0}) async {
    try {
      late PostgrestList data;
      if (keyword != null && keyword.isNotEmpty) {
        data = await _client
            .from('posts')
            .select('*, bookmarks!left(post_id)')
            .ilike('title', '%$keyword%')
            .range(startIndex, startIndex + limitPage)
            .order('created_at', ascending: false);
      } else {
        data = await _client
            .from('posts')
            .select('*, bookmarks!left(post_id)')
            .range(startIndex, startIndex + limitPage)
            .order('created_at', ascending: false);
      }
      // logger.log(data.toString());
      return BaseResponse.ok(parsePostListFromJson(data));
    } catch (e) {
      if (kDebugMode) {
        print('error get posts : ${e.toString()}');
      }
      return BaseResponse.error(message: e.toString());
    }
  }

  ///BOOKMARK
  Future<BaseResponse<List<PostModel>?>> getBookmark(
      {String? keyword, int startIndex = 0}) async {
    try {
      final userId = _client.auth.currentUser?.id ?? '';
      late PostgrestList data;
      if (keyword != null && keyword.isNotEmpty) {
        data = await _client
            .from('posts')
            .select('*, bookmarks!inner(*)')
            .eq('bookmarks.user_id', userId)
            .ilike('title', '%$keyword%')
            .range(startIndex, startIndex + limitPage)
            .order('created_at', ascending: false);
      } else {
        data = await _client
            .from('posts')
            .select('*, bookmarks!inner(*)')
            .eq('bookmarks.user_id', userId)
            .range(startIndex, startIndex + limitPage)
            .order('created_at', ascending: false);
      }
      logger.log(data.toString());
      return BaseResponse.ok(parsePostListFromJson(data));
    } catch (e) {
      if (kDebugMode) {
        print('error get bookmark : ${e.toString()}');
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
        return BaseResponse.ok(PostModel.fromJson(data[0]));
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
      final idUser = _client.auth.currentUser?.id ?? '';
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
            .insert(parseBookmarkModelToJson(bookmark));
        return BaseResponse.ok(null);
      } else {
        final bookmark = BookmarkModel.fromJson(data[0]);
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

  //INSERT USER PROFILE
  Future<BaseResponse<void>> insertUser(UserRWID user) async {
    try {
      final userId = _client.auth.currentUser?.id ?? '';
      final dataUser =
          await _client.from('users').select().eq('user_id', userId);
      if (dataUser.isEmpty) {
        // USER NOT YET REGISTERED
        await _client.from('users').insert(user.toJson());
      }
      return BaseResponse.ok(null);
    } catch (e) {
      if (kDebugMode) {
        print('error insert users : ${e.toString()}');
      }
      return BaseResponse.error(message: e.toString());
    }
  }

  //INSERT USER PROFILE
  Future<BaseResponse<UserRWID>> updateUser(UserRWID user) async {
    try {
      final userId = _client.auth.currentUser?.id ?? '';
      final dataUser =
          await _client.from('users').select().eq('user_id', userId);
      if (dataUser.isEmpty) {
        // USER NOT FOUND
        return BaseResponse.error(message: 'User not found');
      } else {
        final List<Map<String, dynamic>> data = await _client
            .from('users')
            .update(user.toJson())
            .match({'user_id': userId}).select();
        return BaseResponse.ok(UserRWID.fromJson(data[0]));
      }
    } catch (e) {
      if (kDebugMode) {
        print('error update users : ${e.toString()}');
      }
      return BaseResponse.error(message: e.toString());
    }
  }

  //GET USER PROFILE
  Future<BaseResponse<UserRWID>> getUser() async {
    try {
      final userId = _client.auth.currentUser?.id ?? '';
      final dataUser =
          await _client.from('users').select().eq('user_id', userId);
      if (dataUser.isEmpty) {
        // USER NOT FOUND
        return BaseResponse.error(message: 'User not found');
      } else {
        final data = await _client
            .from('users')
            .select()
            .eq('user_id', userId)
            .limit(1)
            .single();
        return BaseResponse.ok(UserRWID.fromJson(data));
      }
    } catch (e) {
      if (kDebugMode) {
        print('error update users : ${e.toString()}');
      }
      return BaseResponse.error(message: e.toString());
    }
  }
}
