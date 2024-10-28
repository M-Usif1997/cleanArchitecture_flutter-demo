import 'package:dartz/dartz.dart';

import '../../domain/entities/post.dart';
import '../models/posts_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModel);
}


class PostLocalDataSourceImpl implements PostLocalDataSource {

  @override
  Future<Unit> cachePosts(List<Post> posts) {
    // TODO: implement cachePosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    // TODO: implement getCachedPosts
    throw UnimplementedError();
  }
}


