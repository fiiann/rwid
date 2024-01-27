import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/domain/service/supabase_service.dart';
import 'package:rwid/features/posts/models/post_model.dart';
import 'package:rwid/features/tag/model/tag_model.dart';

part 'add_post_cubit.freezed.dart';
part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit({required SupabaseService supabaseService})
      : _supabaseService = supabaseService,
        super(const AddPostState());

  final SupabaseService _supabaseService;
  Future<void> getListTag() async {
    emit(state.copyWith(stateListTag: BaseResponse.loading()));
    final data = await _supabaseService.getTag();
    emit(state.copyWith(stateListTag: data));
  }

  Future<void> submitPost(PostModel postModel) async {
    emit(state.copyWith(stateSubmit: BaseResponse.loading()));
    final data = await _supabaseService.insertPost(postModel);
    emit(state.copyWith(stateSubmit: data));
  }
}
