part of 'list_bookmark_bloc.dart';

@freezed
class ListBookmarkState with _$ListBookmarkState {
  const ListBookmarkState._();
  const factory ListBookmarkState({
    @Default(BaseResponse()) BaseResponse<List<PostModel>?> stateList,
    @Default(false) bool hasReachMax,
    String? keyword,
  }) = _ListBookmarkState;
  List<PostModel> get listPosts {
    if (stateList.data != null && stateList.data!.isNotEmpty) {
      return stateList.data!;
    } else {
      return [];
    }
  }
}
