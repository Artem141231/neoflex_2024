import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/user.dart';
import 'package:flutter_application_1/user_remote_datasource.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserRemoteDatasource datasource;
  late Future<List<User>> result;

  @override
  void initState() {
    super.initState();
    datasource = UserRemoteDatasource(Dio());
    result = datasource.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users List')),
      body: SingleChildScrollView(
        child: FutureBuilder<List<User>>(
          future: result,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  children: [
                    const Text('Data fetch error'),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          result = datasource.getUsers();
                        });
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData) {
              final users = snapshot.data ?? [];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: users
                    .map((user) => Card(
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ID: ${user.id}'),
                                Text('Email: ${user.email}'),
                                Text('Name: ${user.name}'),
                                Text('Gender: ${user.gender}'),
                                Text('Status: ${user.status}'),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              );
            }

            return const Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }
}
