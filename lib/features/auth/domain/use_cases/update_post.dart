import '../../../../core/error/failures.dart';
import '../entities/post.dart';
import '../repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class UpdatePostUsecase {
  final PostsRepository repository;

  UpdatePostUsecase(this.repository);
  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.updatePost(post);
  }
}
