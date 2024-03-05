part of 'list_post_bloc.dart';

@freezed
class ListPostState with _$ListPostState {
  const ListPostState._();
  const factory ListPostState({
    @Default(BaseResponse()) BaseResponse<List<PostModel>?> stateList,
    @Default(false) bool hasReachMax,
    String? keyword,
    @Default(BaseResponse()) BaseResponse<void> stateBookmark,
  }) = _ListPostState;

  List<PostModel> get listPosts {
    if (stateList.data != null && stateList.data!.isNotEmpty) {
      return stateList.data!;
    } else {
      return [];
    }
  }
}