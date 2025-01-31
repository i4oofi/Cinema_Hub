import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'home_entity.g.dart';

@HiveType(typeId: 0)
class HomeEntity extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  @HiveField(3)
  final double voteAverage;

  const HomeEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
  });

  @override
  List<Object> get props => [id, title, posterPath, voteAverage];
}
