part of 'tab_cubit.dart';

@freezed
class TagState with _$TagState {
  const factory TagState({
    BaseResponse<List<TagModel?>?>? data,
  }) = _TagState;
}
