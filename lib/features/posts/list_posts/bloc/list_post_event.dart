part of 'list_post_bloc.dart';

sealed class ListPostEvent extends Equatable {
  const ListPostEvent();
}

final class PostFetched extends ListPostEvent {
  final String? keyword;
  final bool isRefresh;
  const PostFetched({this.keyword, this.isRefresh = false});
  @override
  List<Object?> get props => [keyword, isRefresh];
}

final class ToggleBookmarkPostChanged extends ListPostEvent {
  final int idPost;
  const ToggleBookmarkPostChanged({required this.idPost});
  @override
  List<Object?> get props => [idPost];
}

final class KeywordChanged extends ListPostEvent {
  final String? keyword;

  const KeywordChanged(this.keyword);

  @override
  List<Object?> get props => [keyword];
}