import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/domain/service/supabase_service.dart';
import 'package:rwid/features/auth/model/user_tag_model.dart';
import 'package:rwid/features/posts/models/models.dart';

import '../../../../core/extention/throttle.dart';

part 'list_post_bloc.freezed.dart';
part 'list_post_event.dart';
part 'list_post_state.dart';

class ListPostBloc extends Bloc<ListPostEvent, ListPostState> {
  ListPostBloc({required SupabaseService supabaseService})
      : _client = supabaseService,
        super(const ListPostState()) {
    on<PostFetched>(
      _onPostFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<ToggleBookmarkPostChanged>(_onToogleBookmarkChanged);
    on<KeywordChanged>(_onKeywordChanged);
    on<TagChanged>(_onTagChanged);
    on<TopicFetched>(_onTopicFetched);
  }
  final SupabaseService _client;
  FutureOr<void> _onPostFetched(
      PostFetched event, Emitter<ListPostState> emit) async {
    if (event.isRefresh) {
      emit(state.copyWith(
          stateList: const BaseResponse(),
          keyword: event.keyword,
          hasReachMax: false));
    }
    if (state.hasReachMax) return;
    if (state.stateList.state == ResponseState.initial) {
      final response = await _client.getPosts(
          keyword: state.keyword, tagId: state.selectedTag?.tagId);
      emit(state.copyWith(stateList: response, hasReachMax: false));
    }
    final response2 = await _client.getPosts(
        keyword: state.keyword,
        startIndex: state.listPosts.length,
        tagId: state.selectedTag?.tagId);

    if (response2.data?.isEmpty ?? false) {
      return emit(state.copyWith(hasReachMax: true));
    } else {
      return emit(state.copyWith(
          hasReachMax: false,
          stateList: BaseResponse.ok(
              List.of(state.listPosts)..addAll(response2.data ?? []))));
    }
  }

  FutureOr<void> _onToogleBookmarkChanged(
      ToggleBookmarkPostChanged event, Emitter<ListPostState> emit) async {
    var oldList = [...state.listPosts];
    //CREATE NEW LIST
    var newList = [...state.listPosts];
    //GET POST THAT WANT TO BOOKMARK
    PostModel newPost =
        state.listPosts.firstWhere((element) => element.id == event.idPost);
    //GET ISBOOKMARK NEW POST
    final bookmarked = newPost.isBookmark;
    //TOOGLE BOOKMARK
    newPost = newPost.copyWith(isBookmark: !bookmarked);
    //EDIT POST IN NEWLIST WITH NEWPOST
    //YOUR CODE HERE
    final index = newList.indexWhere((element) => element.id == event.idPost);
    if (index != -1) {
      newList[index] = newPost;
    }
    // EMIT NEW STATE WITH UPDATED LIST
    emit(state.copyWith(
        stateList: BaseResponse.ok(newList),
        stateBookmark: BaseResponse.loading()));
    final bookmark = await _client.toogleBookmark(event.idPost);
    if (bookmark.state == ResponseState.error) {
      emit(state.copyWith(stateList: BaseResponse.ok(oldList)));
    }
    emit(state.copyWith(stateBookmark: bookmark));
  }

  FutureOr<void> _onKeywordChanged(
      KeywordChanged event, Emitter<ListPostState> emit) {
    emit(state.copyWith(keyword: event.keyword));
  }

  FutureOr<void> _onTopicFetched(
      TopicFetched event, Emitter<ListPostState> emit) async {
    emit(state.copyWith(stateTag: BaseResponse.loading()));
    final responseTag = await _client.getUserTag();
    emit(state.copyWith(stateTag: responseTag));
    if (responseTag.state == ResponseState.ok &&
        responseTag.data != null &&
        responseTag.data!.isNotEmpty) {
      emit(state.copyWith(selectedTag: responseTag.data!.first));
    }
  }

  FutureOr<void> _onTagChanged(TagChanged event, Emitter<ListPostState> emit) {
    add(const PostFetched(isRefresh: true));
    emit(state.copyWith(selectedTag: event.tag));
  }
}
