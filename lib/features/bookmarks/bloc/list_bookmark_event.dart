part of 'list_bookmark_bloc.dart';

sealed class ListBookmarkEvent extends Equatable {
  const ListBookmarkEvent();
}

final class PostFetched extends ListBookmarkEvent {
  final String? keyword;
  final bool isRefresh;
  const PostFetched({this.keyword, this.isRefresh = false});
  @override
  List<Object?> get props => [keyword, isRefresh];
}

final class ToggleBookmarkChanged extends ListBookmarkEvent {
  final int idPost;
  const ToggleBookmarkChanged({required this.idPost});
  @override
  List<Object?> get props => [idPost];
}

final class KeywordChanged extends ListBookmarkEvent {
  final String? keyword;

  const KeywordChanged(this.keyword);

  @override
  List<Object?> get props => [keyword];
}
