import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/extention/string_ext.dart';
import 'package:rwid/core/widget/custom_text.dart';
import 'package:rwid/core/widget/custom_text_field.dart';
import 'package:rwid/core/widget/error_widget.dart';
import 'package:rwid/core/widget/no_data_widget.dart';
import 'package:rwid/features/auth/bloc/auth_cubit.dart';
import 'package:rwid/features/auth/model/user_tag_model.dart';
import 'package:rwid/features/auth/page/login_page.dart';
import 'package:rwid/features/bookmarks/bloc/list_bookmark_bloc.dart';
import 'package:rwid/features/posts/add_post/presentation/add_post_page.dart';
import 'package:rwid/features/posts/list_posts/bloc/list_post_bloc.dart';
import 'package:rwid/features/posts/list_posts/presentation/components/post_list.dart';
import 'package:rwid/features/posts/list_posts/presentation/components/post_loading_card.dart';

class PostsPage extends StatefulWidget {
  static const String route = '/list_post_page';

  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ListPostBloc>().add(const TopicFetched());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box(authBoxName);
    final user = box.get('user');
    return Scaffold(
      appBar: _buildAppBar(user, context),
      floatingActionButton: _buildFloatingActionButton(context),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: RefreshIndicator(
        onRefresh: () async {
          return context
              .read<ListPostBloc>()
              .add(const PostFetched(isRefresh: true));
        },
        child: MultiBlocListener(
          listeners: [
            BlocListener<ListPostBloc, ListPostState>(
              listenWhen: (previous, current) =>
                  previous.selectedTag != current.selectedTag,
              listener: (context, state) {
                context
                    .read<ListPostBloc>()
                    .add(const PostFetched(isRefresh: true));
              },
              child: Container(),
            ),
            BlocListener<ListPostBloc, ListPostState>(
              listenWhen: (previous, current) =>
                  previous.stateBookmark.state != current.stateBookmark.state,
              listener: (context, state) {
                if (state.stateBookmark.state == ResponseState.error) {
                  'Error bookmark, try again'.failedBar(context);
                } else if (state.stateBookmark.state == ResponseState.ok) {
                  context
                      .read<ListBookmarkBloc>()
                      .add(const BookmarkPostFetched(isRefresh: true));
                }
              },
            )
          ],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const ButtonChooseTopic(),
                _searchForm(context),
                Expanded(
                  child: BlocBuilder<ListPostBloc, ListPostState>(
                    buildWhen: (previous, current) =>
                        previous.stateList.state != current.stateList.state,
                    builder: (context, state) {
                      switch (state.stateList.state) {
                        case ResponseState.error:
                          return const ErrorListWidget(errorMessage: 'Error');
                        case ResponseState.ok:
                          if (state.listPosts.isEmpty) {
                            return const NoDataListWidget();
                          }
                          return const PostList();
                        default:
                          return const PostLoadingList();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final addSuccess = await context.push(AddPostPage.routeName);
        if (addSuccess != null) {
          if (context.mounted) {
            context.read<ListPostBloc>().add(const PostFetched());
          }
        }
      },
      child: const Icon(Icons.add),
    );
  }

  CustomTextFormField _searchForm(BuildContext context) {
    return CustomTextFormField(
      prefixIcon: const Icon(
        Icons.search,
        color: Colors.grey,
      ),
      labelText: 'Search',
      name: 'search',
      onChange: (val) {
        context.read<ListPostBloc>().add(KeywordChanged(val));
      },
      onSubmitted: (val) {
        context
            .read<ListPostBloc>()
            .add(PostFetched(isRefresh: true, keyword: val));
      },
    );
  }

  AppBar _buildAppBar(user, BuildContext context) {
    return AppBar(
      title: Text(
        'Welcome, ${user.name} !',
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<AuthCubit, AuthState>(
            listenWhen: (previous, current) =>
                previous.statusLogout?.state != current.statusLogout?.state,
            listener: (_, state) {
              if (state.statusLogout?.state == ResponseState.ok) {
                context.go(LoginPage.route);
              } else if (state.statusLogout?.state == ResponseState.error) {
                (state.statusLogout?.message ?? 'Error').failedBar(context);
              }
            },
            buildWhen: (previous, current) =>
                previous.statusLogout != current.statusLogout,
            builder: (context, state) {
              return GestureDetector(
                onDoubleTap: () => context.read<AuthCubit>().logout(),
                child: state.statusLogout?.state == ResponseState.loading
                    ? const SizedBox.square(
                        dimension: 16,
                        child: CircularProgressIndicator(),
                      )
                    : CircleAvatar(
                        foregroundImage: NetworkImage(user.photo),
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ButtonChooseTopic extends StatelessWidget {
  const ButtonChooseTopic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListPostBloc, ListPostState>(
      buildWhen: (previous, current) => previous.stateTag != current.stateTag,
      builder: (context, state) {
        if (state.stateTag.state == ResponseState.loading) {
          return const PostLoadingCard();
        } else if (state.stateTag.state == ResponseState.error) {
          return CustomText('Error : ${state.stateTag.message}');
        } else if (state.stateTag.state == ResponseState.ok) {
          return SizedBox(
            height: 50,
            child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 10),
                scrollDirection: Axis.horizontal,
                itemCount: state.stateTag.data?.length,
                itemBuilder: (_, index) {
                  UserTag? tag = state.stateTag.data?[index];
                  return BlocBuilder<ListPostBloc, ListPostState>(
                    buildWhen: (previous, current) =>
                        previous.selectedTag != current.selectedTag,
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<ListPostBloc>().add(TagChanged(tag));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  state.selectedTag?.tagId == tag?.tagId
                                      ? Colors.blueAccent
                                      : null,
                              foregroundColor:
                                  state.selectedTag?.tagId == tag?.tagId
                                      ? Colors.white
                                      : null),
                          child: CustomText(tag?.tagModel?.name ?? '-'),
                        ),
                      );
                    },
                  );
                }),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
