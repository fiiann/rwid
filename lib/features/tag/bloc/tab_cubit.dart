import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/core/config/supabase_service.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/features/tag/model/tag_model.dart';

part 'tab_cubit.freezed.dart';
part 'tab_state.dart';

class TagCubit extends Cubit<TagState> {
  TagCubit({required SupabaseService supabaseService})
      : _service = supabaseService,
        super(const TagState());
  final SupabaseService _service;
  Future<void> getListTag() async {
    emit(state.copyWith(data: BaseResponse.loading()));
    final data = await _service.getTag();
    emit(state.copyWith(data: data));
  }
}
