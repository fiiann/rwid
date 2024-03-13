part of 'list_post_bloc.dart';

@freezed
class ListPostState with _$ListPostState {
  const ListPostState._();
  const factory ListPostState({
    @Default(BaseResponse()) BaseResponse<List<PostModel>?> stateList,
    @Default(false) bool hasReachMax,
    String? keyword,
    @Default(BaseResponse()) BaseResponse<void> stateBookmark,
    @Default(BaseResponse()) BaseResponse<List<UserTag>?> stateTag,
    UserTag? selectedTag,
  }) = _ListPostState;

  List<PostModel> get listPosts {
    if (stateList.data != null && stateList.data!.isNotEmpty) {
      return stateList.data!;
    } else {
      return [];
    }
  }

  List<UserTag> get listUserTags {
    if (stateTag.data != null && stateTag.data!.isNotEmpty) {
      return stateTag.data!;
    } else {
      return [];
    }
  }
}
