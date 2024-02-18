part of 'list_bookmark_bloc.dart';

sealed class ListBookmarkEvent extends Equatable {
  const ListBookmarkEvent();
}

final class BookmarkPostFetched extends ListBookmarkEvent {
  final String? keyword;
  final bool isRefresh;
  const BookmarkPostFetched({this.keyword, this.isRefresh = false});
  @override
  List<Object?> get props => [keyword, isRefresh];
}

final class ToggleBookmarkChanged extends ListBookmarkEvent {
  final int idPost;
  const ToggleBookmarkChanged({required this.idPost});
  @override
  List<Object?> get props => [idPost];
}

final class BookmarkKeywordChanged extends ListBookmarkEvent {
  final String? keyword;

  const BookmarkKeywordChanged(this.keyword);

  @override
  List<Object?> get props => [keyword];
}
