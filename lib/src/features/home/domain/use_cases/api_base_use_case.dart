import 'package:dartz/dartz.dart';

abstract class ApiBaseUseCase<T> {
  Future<Either<String, T>> call();
}
