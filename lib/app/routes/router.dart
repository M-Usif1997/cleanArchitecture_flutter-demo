import 'package:clean_architecture_posts_app/featutes/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../featutes/posts/presentation/pages/post_add_update_page.dart';
import '../../../../featutes/posts/presentation/pages/post_detail_page.dart';
import '../../../../featutes/posts/presentation/pages/posts_page.dart';
import '../../featutes/posts/domain/entities/post.dart';
import '../../featutes/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import '../../../app/di/injection_container.dart' as di;

enum AppRoute { postsPage, postsAddUpdatePage, postDetailPage }

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/posts_page',
    routes:[
      GoRoute(
        path: '/posts_page',
        name: AppRoute.postsPage.name,
        builder: (context, state) => const PostsPage(),
      ),
      GoRoute(
        path: '/post-add-update',
        name: AppRoute.postsAddUpdatePage.name,
        pageBuilder: (context, state) => MaterialPage(
            child: BlocProvider(
                create: (context) => di.sl<PostsBloc>(),
                child: const PostAddUpdatePage(
                  isUpdatePost: false,
                ))),
      ),
      GoRoute(
          path: '/post-detail',
          name: AppRoute.postDetailPage.name,
          pageBuilder: (context, state) {
            Post post = state.extra as Post;

            return MaterialPage(
                child: BlocProvider(
                    create: (context) => di.sl<PostsBloc>(),
                    child: PostDetailPage(
                      post: post,
                    )));
          }),
    ],
  );
}
