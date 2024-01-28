import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/domain/service/supabase_service.dart';
import 'package:rwid/features/posts/models/post_model.dart';

part 'detail_post_cubit.freezed.dart';
part 'detail_post_state.dart';

class DetailPostCubit extends Cubit<DetailPostState> {
  DetailPostCubit({required SupabaseService supabaseService})
      : _supabaseService = supabaseService,
        super(const DetailPostState());

  final SupabaseService _supabaseService;
  void getPost(int id) async {
    emit(state.copyWith(state: BaseResponse.loading()));
    final data = await _supabaseService.getDetailPost(id);
    emit(state.copyWith(state: data));
  }
}
