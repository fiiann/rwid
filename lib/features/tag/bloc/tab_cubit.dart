import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/domain/service/supabase_service.dart';
import 'package:rwid/features/tag/model/tag_model.dart';

part 'tab_cubit.freezed.dart';
part 'tab_state.dart';

class TagCubit extends Cubit<TagState> {
  TagCubit({required SupabaseService supabaseService})
      : _service = supabaseService,
        super(const TagState());
  final SupabaseService _service;
  Future<void> getListTag() async {
    emit(state.copyWith(stateList: BaseResponse.loading()));
    final data = await _service.getTag();
    emit(state.copyWith(stateList: data));
  }

  void selectTag(TagModel clickedTag) {
    final List<TagModel?>? allTags = state.stateList?.data;

    if (allTags != null) {
      final List<TagModel> updatedTags = allTags.map((tag) {
        return tag!.copyWith(
            isSelected:
                tag.id == clickedTag.id ? !tag.isSelected : tag.isSelected);
      }).toList();

      emit(
        state.copyWith(
          stateList: state.stateList?.copyWith(
            data: updatedTags,
          ),
        ),
      );
    }
  }

  void insertTag(List<TagModel> tags) async {
    emit(state.copyWith(stateSubmit: BaseResponse.loading()));
    final response = await _service.insertTagUser(tags);
    emit(state.copyWith(stateSubmit: response));
  }
}
