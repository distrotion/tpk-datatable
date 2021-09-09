import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:set_table_data/bloc/BlocPageRebuild.dart';
import 'package:set_table_data/style/style.dart';
import 'package:set_table_data/widget/ComPageNumBtnGroup.dart';
import 'fackdata/fackdata.dart';
import 'tablebodytap1.dart';

class TableTap1Struc extends StatelessWidget {
  const TableTap1Struc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TableStrucBuffer();
  }
}

class _TableStrucBuffer extends StatelessWidget {
  const _TableStrucBuffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TableStrucMain();
  }
}

class _TableStrucMain extends StatefulWidget {
  const _TableStrucMain({Key? key}) : super(key: key);

  @override
  __TableStrucMainState createState() => __TableStrucMainState();
}

class __TableStrucMainState extends State<_TableStrucMain> {
  @override
  Widget build(BuildContext context) {
    void tapChangeTablePage(int n) {
      setState(() {
        print(n);
        TableTap1nPage = n;
      });
    }

    return SingleChildScrollView(
        child: Column(
      children: [DataListTable(), BottomPageNum(func: tapChangeTablePage)],
    ));
  }
}

//------------------------------------------------------------------------------------------------

class BottomPageNum extends StatelessWidget {
  const BottomPageNum({Key? key, required this.func}) : super(key: key);
  final Function func;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment;

    //print("build BottomPageNum " + BlocPatientList.state.patientTableData.length.toString());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 50),
        Text(
          "Pages",
          style: TxtStyle(fontSize: 12),
        ),
        ComPageNumBtnGroup(
          nItemNum: rListDataTableTap1.length,
          nPageSelects: TableTap1nPage,
          func: func,
        )
      ],
    );
  }
}
