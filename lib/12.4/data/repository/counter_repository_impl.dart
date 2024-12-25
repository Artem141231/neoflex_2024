import 'package:dartz/dartz.dart';
import '../../domain/failure.dart';
import '../../domain/counter_repository.dart';
import '../datasource/counter_local_datasource.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDatasource datasource;

  CounterRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, int>> getCounter() {
    return datasource.getCounter();
  }

  @override
  Future<Either<Failure, int>> setCounter(int newValue) {
    return datasource.setCounter(newValue);
  }
}
