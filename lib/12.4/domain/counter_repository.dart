import 'package:dartz/dartz.dart';
import 'failure.dart';

abstract class CounterRepository {
  Future<Either<Failure, int>> getCounter();
  Future<Either<Failure, int>> setCounter(int newValue);
}
