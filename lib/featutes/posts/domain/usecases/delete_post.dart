import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/posts_repository.dart';

class DeletePostUsecase {
  final PostsRepository repository;

  DeletePostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int id) {
    return repository.deletePost(id);
  }
}
