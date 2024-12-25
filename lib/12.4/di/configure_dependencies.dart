import 'package:get_it/get_it.dart';
import '../data/datasource/shared_pref_counter_local_datasource.dart';
import '../data/repository/counter_repository_impl.dart';
import '../domain/usecases/get_counter_usecase.dart';
import '../domain/usecases/increment_counter_usecase.dart';
import '../presentation/state/counter_cubit.dart';
import 'package:flutter_application_1/domain/counter_repository.dart';
import 'package:flutter_application_1/data/datasource/counter_local_datasource.dart';

void configureDependencies() {
  final getIt = GetIt.instance;

  // Регистрация зависимостей
  getIt.registerFactory<CounterLocalDatasource>(
      () => SharedPrefCounterLocalDatasource());
  getIt
      .registerFactory<CounterRepository>(() => CounterRepositoryImpl(getIt()));
  getIt.registerFactory(() => GetCounterUseCase(getIt()));
  getIt.registerFactory(() => IncrementCounterUseCase(getIt()));
  getIt.registerFactory(() => CounterCubit(getIt(), getIt()));
}
