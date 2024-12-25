import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/failure.dart';
import 'package:flutter_application_1/data/datasource/counter_local_datasource.dart';

class SharedPrefCounterLocalDatasource implements CounterLocalDatasource {
  @override
  Future<Either<Failure, int>> getCounter() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return Right(prefs.getInt('counter') ?? 0);
    } catch (e) {
      return Left(Failure(code: 1, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> setCounter(int newValue) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.setInt('counter', newValue);
      return Right(prefs.getInt('counter') ?? 0);
    } catch (e) {
      return Left(Failure(code: 1, message: e.toString()));
    }
  }
}
