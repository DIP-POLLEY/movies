import 'dart:io';
import 'package:hive/hive.dart';

// part 'movie.info.g.dart';

@HiveType(typeId: 1)
class MovieInfo{

  MovieInfo({this.movnam, this.dictnam, this.movimg});

  @HiveField(0)
  String movnam;

  @HiveField(1)
  String dictnam;

  @HiveField(2)
  File movimg;


}