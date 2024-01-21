part of 'tab_cubit.dart';

@freezed
class TabState with _$TabState {
  const factory TabState({
    @Default(ProgressStatus.initial) ProgressStatus status,
    List<TagModel>? listTag,
  }) = _TabState;
}
