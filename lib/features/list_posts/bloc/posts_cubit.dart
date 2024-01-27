import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/domain/service/supabase_service.dart';
import 'package:rwid/features/list_posts/models/post_model.dart';

part 'posts_cubit.freezed.dart';
part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({required SupabaseService supabaseService})
      : _client = supabaseService,
        super(const PostsState());

  final SupabaseService _client;

  void fetchPosts({String? keyword}) async {
    emit(state.copyWith(stateList: BaseResponse.loading()));
    final response = await _client.getPosts(keyword: keyword);
    emit(state.copyWith(stateList: response));
  }
}
