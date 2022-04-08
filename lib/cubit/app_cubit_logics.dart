import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubit/app_cubit_states.dart';
import 'package:my_app/cubit/app_cubits.dart';
import 'package:my_app/pages/detail_page.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pj_price/pages/home_price_page.dart';
import 'package:my_app/pages/welcome_page.dart';
import 'package:my_app/pj_sleep/pages/home_sleep_page.dart';

import '../pages/navpages/main_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            // return WelcomePage();
            // return HomePricePage();
            return HomeSleepPage();
          }
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedState) {
            return MainPage();
          }
          if (state is DetailState) {
            return DetailPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
