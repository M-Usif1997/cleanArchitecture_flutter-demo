import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

import '../entities/post.dart';
import '../repositories/posts_repository.dart';

class AddPostUsecase {
  final PostsRepository repository;

  AddPostUsecase(this.repository);

//Callable Class
//use call function => allows instances of a class to be used like functions,
// without explicitly referencing a method name {AddPostUsecase only calls addPost}
// This aligns well with the core principle that each use case should handle only one action {SRP}

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.addPost(post);
  }
}
