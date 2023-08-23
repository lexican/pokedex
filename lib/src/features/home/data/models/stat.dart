import 'package:hive_flutter/hive_flutter.dart';

part 'stat.g.dart';

@HiveType(typeId: 1)
class Stat {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final int value;

  const Stat({required this.title, required this.value});
}
