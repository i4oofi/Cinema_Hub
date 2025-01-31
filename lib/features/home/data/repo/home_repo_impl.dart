import 'package:cinema_hub/core/errors/failure.dart';
import 'package:cinema_hub/features/home/data/data_source/home_remote_data_source.dart';
import 'package:cinema_hub/features/home/domain/entities/home_entity.dart';
import 'package:cinema_hub/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<HomeEntity>>> getHomeList() async {
    try {
      final movies = await remoteDataSource.getPopularMovies();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
