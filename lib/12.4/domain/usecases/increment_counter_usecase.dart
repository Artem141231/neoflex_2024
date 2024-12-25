import 'package:dartz/dartz.dart';
import '../failure.dart';
import '../use_case.dart';
import '../counter_repository.dart';

class IncrementCounterUseCase extends UseCaseNoParams<int> {
  final CounterRepository repository;

  IncrementCounterUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call() async {
    final result = await repository.getCounter();
    return result.fold(
      (failure) => Left(failure),
      (currentValue) => repository.setCounter(currentValue + 1),
    );
  }
}
