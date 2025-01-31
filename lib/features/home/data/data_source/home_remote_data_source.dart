import 'package:cinema_hub/core/utils/api.dart';
import 'package:cinema_hub/features/home/data/model/movie_model.dart';
import 'package:cinema_hub/features/home/domain/entities/home_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeEntity>> getPopularMovies();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Api _api;

  HomeRemoteDataSourceImpl(this._api);

  @override
  Future<List<HomeEntity>> getPopularMovies() async {
    final response = await _api.get('movie/popular');
    final List<dynamic> moviesJson = response.data['results'];
    return moviesJson
        .map((json) => MovieModel.fromJson(json).toEntity())
        .toList();
  }
}
