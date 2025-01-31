import 'package:cinema_hub/core/errors/failure.dart';
import 'package:cinema_hub/core/use_case/no_param_use_case.dart';

import 'package:cinema_hub/features/home/domain/entities/home_entity.dart';
import 'package:cinema_hub/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class GetHomeListUseCase extends UseCase<List<HomeEntity>> {
  final HomeRepo repository;

  GetHomeListUseCase(this.repository);

  @override
  Future<Either<Failure, List<HomeEntity>>> call() async {
    return await repository.getHomeList();
  }
}
