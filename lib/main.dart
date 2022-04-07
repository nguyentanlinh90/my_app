import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubit/app_cubit_logics.dart';
import 'package:my_app/cubit/app_cubits.dart';
import 'package:my_app/services/data_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<AppCubits>(
      create: (context) => AppCubits(
        data: DataServices()
      ),
          child: AppCubitLogics(),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.red),
        onPressed: () {
          final snackBar = SnackBar(content: Text('Khong truy cap'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Show snackber'),
      )),
    );
  }
}
