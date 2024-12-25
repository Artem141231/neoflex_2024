import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_counter_usecase.dart';
import '../../domain/usecases/increment_counter_usecase.dart';

class CounterCubit extends Cubit<int> {
  final GetCounterUseCase getCounterUseCase;
  final IncrementCounterUseCase incrementCounterUseCase;

  CounterCubit(this.getCounterUseCase, this.incrementCounterUseCase)
      : super(0) {
    _init();
  }

  void _init() async {
    final result = await getCounterUseCase();
    result.fold((failure) {}, (counter) => emit(counter));
  }

  void increment() async {
    final result = await incrementCounterUseCase.call();
    result.fold((failure) {}, (counter) => emit(counter));
  }
}
