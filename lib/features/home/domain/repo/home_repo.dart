import 'package:cinema_hub/core/errors/failure.dart';
import 'package:cinema_hub/features/home/domain/entities/home_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<HomeEntity>>> getHomeList();
}
