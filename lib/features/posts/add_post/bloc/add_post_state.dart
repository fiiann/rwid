part of 'add_post_cubit.dart';

@freezed
class AddPostState with _$AddPostState {
  const AddPostState._();
  const factory AddPostState({
    BaseResponse<List<TagModel>?>? stateListTag,
    BaseResponse<void>? stateSubmit,
  }) = _AddPostState;

  List<TagModel> get choosedTag {
    if (stateListTag != null &&
        stateListTag?.data != null &&
        stateListTag!.data!.isNotEmpty) {
      return stateListTag!.data!
          .where((element) => element.isSelected)
          .toList();
    } else {
      return [];
    }
  }
}
