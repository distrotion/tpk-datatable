import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:set_table_data/style/style.dart';
import 'package:set_table_data/tabletap1/tablestruc1.dart';

import 'bloc/BlocPageRebuild.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BlocPageRebuild>(
            create: (BuildContext context) =>
                BlocPageRebuild(), //For rebuild only page inside without app bar/left menu
          ),
        ],
        child: BlocBuilder<BlocPageRebuild, bool>(builder: (_, e) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MainStructure(),
          );
        }));
  }
}

class MainStructure extends StatelessWidget {
  const MainStructure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      // width: double.infinity,
      decoration: BoxDecoration(
        color: CustomTheme.colorGreyBg,
        borderRadius: BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
              color: CustomTheme.colorShadowBgStrong,
              offset: Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 0)
        ],
      ),
      child: TableTap1Struc(),
    )));
  }
}
