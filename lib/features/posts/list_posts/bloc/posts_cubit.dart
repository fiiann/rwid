import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/domain/service/supabase_service.dart';
import 'package:rwid/features/posts/models/post_model.dart';

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

  void toogleBookmark({required int idPost}) async {
    print('toogle');
    //CREATE NEW LIST
    var newList = [...state.listPosts];
    //GET POST THAT WANT TO BOOKMARK
    PostModel newPost =
        state.listPosts.firstWhere((element) => element.id == idPost);
    //GET ISBOOKMARK NEW POST
    final bookmarked = newPost.isBookmark;
    //TOOGLE BOOKMARK
    newPost = newPost.copyWith(isBookmark: !bookmarked);
    //EDIT POST IN NEWLIST WITH NEWPOST
    //YOUR CODE HERE
    final index = newList.indexWhere((element) => element.id == idPost);
    if (index != -1) {
      newList[index] = newPost;
    }
    // EMIT NEW STATE WITH UPDATED LIST
    emit(state.copyWith(stateList: BaseResponse.ok(newList)));

    await _client.toogleBookmark(idPost);
  }
}
