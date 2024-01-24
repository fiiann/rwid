part of 'posts_cubit.dart';

@freezed
class PostsState with _$PostsState {
  const factory PostsState({
    BaseResponse<List<PostModel>?>? stateList,
  }) = _PostsState;
}
