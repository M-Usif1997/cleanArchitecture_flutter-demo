import 'package:clean_architecture_posts_app/core/error/failures.dart';

import 'package:clean_architecture_posts_app/featutes/posts/domain/entities/post.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/posts_repository.dart';
import '../datasources/post_local_data_source.dart';
import '../datasources/post_remote_data_source.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;

  PostsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Unit>> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    await remoteDataSource.getAllPosts();
    await localDataSource.getCachedPosts();
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }
}
