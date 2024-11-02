import 'package:clean_architecture_posts_app/featutes/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:clean_architecture_posts_app/featutes/posts/presentation/widgets/post_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../widgets/message_display_widget.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionBtn(),
    );
  }

  AppBar _buildAppbar() => AppBar(title: const Text('Posts'));

  Widget _buildBody() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is LoadingPostsState) {
              return const LoadingWidget();
            } else if (state is LoadedPostsState) {
              return RefreshIndicator(
                onRefresh: () => _onRefresh(context) ,
                child: PostListWidget(
                  posts: state.posts,
                ),
              );
            } else if (state is ErrorPostsState) {
              return MessageDisplayWidget(message: state.message);
            }
            return const LoadingWidget();
          },
        ));
  }

  Future<void> _onRefresh(BuildContext context) async {

    BlocProvider.of<PostsBloc>(context).add(RefreshPostEvent());

  }

  Widget _buildFloatingActionBtn() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {},
    );
  }
}
