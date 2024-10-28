import 'package:dartz/dartz.dart';

import '../models/posts_model.dart';

abstract class PostRemoteDataSource {

  Future<List<PostModel>> getAllPosts();

  Future<Unit> addPost(PostModel postModel);

  Future<Unit> updatePost(PostModel postModel);

  Future<Unit> deletePost(int postId);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<Unit> addPost(PostModel postModel) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int postId) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(PostModel postModel) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
  
}
