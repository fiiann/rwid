part of 'tab_cubit.dart';

@Freezed(makeCollectionsUnmodifiable: true)
class TagState with _$TagState {
  const TagState._();
  const factory TagState(
      {BaseResponse<List<TagModel>?>? stateList,
      BaseResponse<void>? stateSubmit}) = _TagState;

  List<TagModel> get choosedTag {
    if (stateList != null &&
        stateList?.data != null &&
        stateList!.data!.isNotEmpty) {
      return stateList!.data!.where((element) => element.isSelected).toList();
    } else {
      return [];
    }
  }
}
