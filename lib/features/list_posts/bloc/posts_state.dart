part of 'posts_cubit.dart';

@freezed
class PostsState with _$PostsState {
  const PostsState._();
  const factory PostsState({
    BaseResponse<List<PostModel>?>? stateList,
  }) = _PostsState;

  List<PostModel> get listPosts {
    if (stateList != null &&
        stateList!.data != null &&
        stateList!.data!.isNotEmpty) {
      return stateList!.data!;
    } else {
      return [];
    }
  }
}
