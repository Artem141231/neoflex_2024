import 'package:dartz/dartz.dart';
import '../counter_repository.dart';
import '../failure.dart';

abstract class UseCaseNoParams<Type> {
  Future<Either<Failure, Type>> call();
}

class GetCounterUseCase extends UseCaseNoParams<int> {
  final CounterRepository repository;

  GetCounterUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call() {
    return repository.getCounter();
  }
}
