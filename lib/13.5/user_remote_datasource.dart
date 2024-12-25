import 'package:dio/dio.dart';
import 'package:flutter_application_1/user.dart';
import 'package:retrofit/retrofit.dart';

part 'user_remote_datasource.g.dart';

@RestApi(baseUrl: 'https://gorest.co.in/public/v2')
abstract class UserRemoteDatasource {
  factory UserRemoteDatasource(Dio dio, {String baseUrl}) =
      _UserRemoteDatasource;

  @GET('/users')
  Future<List<User>> getUsers();

  @GET('/users/{id}')
  Future<User> getUser(@Path() int id);
}
