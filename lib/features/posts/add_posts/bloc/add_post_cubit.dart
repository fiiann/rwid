import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/domain/service/supabase_service.dart';
import 'package:rwid/features/tag/model/tag_model.dart';

part 'add_post_cubit.freezed.dart';
part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit({required SupabaseService supabaseService})
      : _supabaseService = supabaseService,
        super(const AddPostState()) {
    getListTag();
  }

  final SupabaseService _supabaseService;
  Future<void> getListTag() async {
    print("get tag");
    emit(state.copyWith(stateListTag: BaseResponse.loading()));
    final data = await _supabaseService.getTag();
    emit(state.copyWith(stateListTag: data));
  }
}
