import 'package:cinema_hub/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T> {
  Future<Either<Failure, T>> call();
}