import 'package:hive/hive.dart';

part 'movieinfo.g.dart';

@HiveType(typeId: 0)
class MovieInfo extends HiveObject{

  MovieInfo({this.movnam, this.dictnam, this.movimg});


  @HiveField(0)
  String movnam;

  @HiveField(1)
  String dictnam;

  @HiveField(2)
  String movimg;


}