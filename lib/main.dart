import 'package:clean_architecture_posts_app/app/routes/router.dart';
import 'package:clean_architecture_posts_app/featutes/posts/presentation/pages/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_theme.dart';

import 'featutes/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'featutes/posts/presentation/bloc/posts/posts_bloc.dart';
import 'app/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
        BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: goRouter(),
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'Posts App',
      ),
    );
  }
}
