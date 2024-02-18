import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/domain/service/supabase_service.dart';
import 'package:rwid/core/extention/throttle.dart';
import 'package:rwid/features/posts/models/models.dart';

part 'list_bookmark_bloc.freezed.dart';
part 'list_bookmark_event.dart';
part 'list_bookmark_state.dart';

class ListBookmarkBloc extends Bloc<ListBookmarkEvent, ListBookmarkState> {
  ListBookmarkBloc({required SupabaseService supabaseService})
      : _client = supabaseService,
        super(const ListBookmarkState()) {
    on<PostFetched>(
      _onPostFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<ToggleBookmarkChanged>(_onToogleBookmarkChanged);
    on<KeywordChanged>(_onKeywordChanged);
  }
  final SupabaseService _client;

  FutureOr<void> _onPostFetched(
      PostFetched event, Emitter<ListBookmarkState> emit) async {
    if (event.isRefresh) {
      emit(const ListBookmarkState());
      emit(ListBookmarkState(keyword: event.keyword));
    }
    if (state.hasReachMax) return;
    if (state.stateList.state == ResponseState.initial) {
      final response = await _client.getBookmark(keyword: state.keyword);
      emit(state.copyWith(stateList: response, hasReachMax: false));
    }
    final response2 = await _client.getBookmark(
        keyword: state.keyword, startIndex: state.listPosts.length);

    if (response2.data!.isEmpty) {
      return emit(state.copyWith(hasReachMax: true));
    } else {
      return emit(state.copyWith(
          hasReachMax: false,
          stateList: BaseResponse.ok(
              List.of(state.listPosts)..addAll(response2.data ?? []))));
    }
  }

  FutureOr<void> _onToogleBookmarkChanged(
      ToggleBookmarkChanged event, Emitter<ListBookmarkState> emit) async {
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
    emit(state.copyWith(stateList: BaseResponse.ok(newList)));

    await _client.toogleBookmark(event.idPost);
  }

  FutureOr<void> _onKeywordChanged(
      KeywordChanged event, Emitter<ListBookmarkState> emit) {
    emit(state.copyWith(keyword: event.keyword));
  }
}
