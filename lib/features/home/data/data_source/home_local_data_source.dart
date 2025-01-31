import 'package:cinema_hub/features/home/domain/entities/home_entity.dart';

abstract class HomeLocalDataSource {
  HomeEntity getHomeList();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  HomeEntity getHomeList() {
    throw UnimplementedError();
  }
}
