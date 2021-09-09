import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:set_table_data/widget/ComBtnImage.dart';
import 'package:set_table_data/widget/ComYNPopup.dart';

import 'fackdata/fackdata.dart';
import 'modelintable.dart';

class DataListTable extends StatefulWidget {
  const DataListTable({Key? key}) : super(key: key);

  @override
  _DataListTableState createState() => _DataListTableState();
}

class _DataListTableState extends State<DataListTable> {
  int nCurrentSortIndex = 0; //index from Header DataColumn
  bool isSortAscending = true;

  @override
  Widget build(BuildContext context) {
    //DemoFunction.genDemoDataForTest(); //only one time
    //BlocPatientList blocPatientList = BlocProvider.of<BlocPatientList>(context);
    //List<PatientTableModel> patientListdata_Clone = blocPatientList.state.patientTableData;

    List<MainStrucTable> Listdata_Clone = State_DataList.rListData;

    double nDataColumnWidth = 100;
    double nDataColumnWidthIcon = 100;
    double nDataWidthIcon = 50;
    double nMarginToMakeIconSmaller = 8;

    void tapSort(int nIndex, int columnIndex, bool ascending) {
      if (ascending) {
        print(nIndex);
        switch (nIndex) {
          case 1:
            Listdata_Clone.sort(
                (item1, item2) => item1.field01.compareTo(item2.field01));
            break;
          case 2:
            Listdata_Clone.sort(
                (item1, item2) => item1.field02.compareTo(item2.field02));
            break;
          case 3:
            Listdata_Clone.sort(
                (item1, item2) => item1.field03.compareTo(item2.field03));
            break;
          case 4:
            Listdata_Clone.sort(
                (item1, item2) => item1.field04.compareTo(item2.field04));
            break;
        }
      } else {
        switch (nIndex) {
          case 1:
            Listdata_Clone.sort(
                (item1, item2) => item2.field01.compareTo(item1.field01));
            break;
          case 2:
            Listdata_Clone.sort(
                (item1, item2) => item2.field02.compareTo(item1.field02));
            break;
          case 3:
            Listdata_Clone.sort(
                (item1, item2) => item2.field03.compareTo(item1.field03));
            break;
          case 4:
            Listdata_Clone.sort(
                (item1, item2) => item2.field04.compareTo(item1.field04));
            break;
        }
      }
      //BlocPatientList.sort();
      setState(() {
        nCurrentSortIndex = columnIndex;
        isSortAscending = ascending;
      });
    }

    //------------------------------------------------------------------------------------------------

    void tapView(String s) {}

    void CallYNPopup(
        String sTxtHead,
        String sTxtBody,
        String sTxtBtnYes,
        String sTxtBtnNo,
        Function funcYes,
        Function funcNo,
        String sFuncData,
        bool isSwitchYNBtnPos) {
      showDialog<String>(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => ComYNPopup(
          sTxtHead: sTxtHead,
          sTxtBody: sTxtBody,
          sTxtBtnYes: sTxtBtnYes,
          sTxtBtnNo: sTxtBtnNo,
          funcYes: funcYes,
          funcNo: funcNo,
          sFuncData: sFuncData,
          isSwitchYNBtnPos: isSwitchYNBtnPos,
        ),
      );
    }

    void CloseYNPopup() {
      Navigator.pop(context, '');
    }

    // void GoToTele(String s) {
    //   CloseYNPopup();
    //   BlocProvider.of<BlocChangePage>(context).changePage(enumPageList.Tele);
    // }
    void Edit(String s) {
      CloseYNPopup();
      //do something
    }

    void Delete(String s) {
      CloseYNPopup();
      //do something
    }

    // void tapTele(String s) {
    //   CallYNPopup('Teletherapy', 'Do you want to start Teletherapy now?', 'Yes',
    //       'No', GoToTele, CloseYNPopup, s, false);
    // }
    void tapEdit(String s) {
      print(s);
      CallYNPopup('Edit ${s}', 'Do you want to Edit ${s} now?', 'Yes', 'No',
          Edit, CloseYNPopup, s, false);
    }

    void tapDelete(String s) {
      CallYNPopup('Delete ${s}', 'Are you sure you want to delete ${s}?',
          'Delete', 'Cancel', Delete, CloseYNPopup, s, true);
    }

    //all cells data for this page.
    List<DataRow> RowDataInput = getDataRowList(
      Listdata_Clone,
      nDataColumnWidth,
      nDataColumnWidthIcon,
      nDataWidthIcon,
      nMarginToMakeIconSmaller,
      tapView,
      tapEdit,
      tapDelete,
      State_DataList.nPage, //data
    );

    //fixed error when sort the hide column on mobile
    // nCurrentSortIndex = 0;

    return DataTable(
      sortColumnIndex: nCurrentSortIndex,
      sortAscending: isSortAscending,
      showCheckboxColumn:
          false, //Hide checkbox that come from tap row 'onselectchanged'
      columnSpacing: 10,
      dataRowHeight: 56,
      // Header Column -----------------------------------------------------------
      columns: [
        getDataColumn(1, "Field 1", 'Sort Field 1', nDataColumnWidth, tapSort),
        getDataColumn(2, "Field 2", 'Sort Field 2', nDataColumnWidth, tapSort),
        getDataColumn(3, "Field 3", 'Sort Field 3', nDataColumnWidth, tapSort),
        getDataColumn(4, "Field 4", 'Sort Field 4', nDataColumnWidth, tapSort),
        getDataColumn(5, "Field 5", 'Sort Field 5', nDataColumnWidth, tapSort),
        getBlankDataColumn(nDataColumnWidthIcon),
      ],
      // Cell Row  -----------------------------------------------------------
      rows: [
        for (DataRow dataRow in RowDataInput) dataRow,
      ],
    );
  }
}
// Header Column --------------------------------------------------------------

DataColumn getDataColumn(int nIndex, String sLabel, String sTooltip,
    double nDataColumnWidth, Function func) {
  return DataColumn(
    label: Container(
      width: nDataColumnWidth,
      child: Text(sLabel),
      //color: Colors.red,
    ),
    numeric: false,
    tooltip: sTooltip,
    onSort: (int columnIndex, bool ascending) {
      func(nIndex, columnIndex, ascending);
    },
  );
}

// blank for call icon
DataColumn getBlankDataColumn(double nDataColumnWidthIcon) {
  return DataColumn(
    label: Expanded(
      child: Container(
          // color: Colors.red,
          ),
    ),
  );
}

// Cell Row -------------------------------------------------------------------
List<DataRow> getDataRowList(
  List<MainStrucTable> Listdata_Clone,
  double nDataColumnWidth,
  double nDataColumnWidthIcon,
  double nDataWidthIcon,
  double nMarginToMakeIconSmaller,
  // enumScreenResponsiveList screenResponsive,
  Function funcView,
  Function funcEdit,
  Function funcDelete,
  int currentPage,
) {
  int nStartCell = (currentPage - 1) * nTableCellPerEachPage;

  List<DataRow> dataRowList = [];
  for (int n = nStartCell; n < (nStartCell + nTableCellPerEachPage); n++) {
    if (n < Listdata_Clone.length) {
      dataRowList.add(getDataRow(
        Listdata_Clone[n].number,
        Listdata_Clone[n].field01,
        Listdata_Clone[n].field02,
        Listdata_Clone[n].field03,
        Listdata_Clone[n].field04,
        Listdata_Clone[n].field05,
        nDataColumnWidth,
        nDataColumnWidthIcon,
        nDataWidthIcon,
        nMarginToMakeIconSmaller,
        // screenResponsive,
        funcView,
        funcEdit,
        funcDelete,
      ));
    }
  }
  return dataRowList;
}

DataRow getDataRow(
    String number,
    String field01,
    String field02,
    String field03,
    String field04,
    String field05,
    double nDataColumnWidth,
    double nDataColumnWidthIcon,
    double nDataWidthIcon,
    double nMarginToMakeIconSmaller,
    // enumScreenResponsiveList screenResponsive,
    Function funcView,
    Function funcEdit,
    Function funcDelete) {
  //cells num must be match header column num

  return DataRow(
      cells: [
        getDataCell_Label(field01, nDataColumnWidth),
        getDataCell_Label(field02, nDataColumnWidth),
        getDataCell_Label(field03, nDataColumnWidth),
        getDataCell_Label(field04, nDataColumnWidth),
        getDataCell_Label(field05, nDataColumnWidth),
        getDataCell_Icon(number, funcEdit, funcDelete, nDataColumnWidthIcon,
            nDataWidthIcon, nMarginToMakeIconSmaller),
      ],
      onSelectChanged: (value) {
        funcView(number);
      });
}

DataCell getDataCell_ImgName(
    String sName, double nDataColumnWidth, int nGender) {
  return DataCell(InkWell(
      child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              // ComProfileImg(
              //   profileImg: enumProfileImgList.Patient_Default,
              //   nGender: nGender,
              //   nWidthHeight: 40,
              // ),

              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Text(sName,
                      overflow: TextOverflow.fade, softWrap: false)),
            ],
          ))));
}

// each cell inside 1 row
DataCell getDataCell_Label(String sLabel, double nDataColumnWidth) {
  return DataCell(InkWell(
      child: Container(
    //color: Colors.red,
    width: nDataColumnWidth,
    child: Text(sLabel, overflow: TextOverflow.fade, softWrap: false),
  )));
}

DataCell getDataCell_Icon(
  String sId,
  Function funcEdit,
  Function funcDelete,
  double nDataColumnWidthIcon,
  double nDataWidthIcon,
  double nMarginToMakeIconSmaller,
) {
  void _tapEdit() {
    funcEdit(sId);
  }

  void _tapDelete() {
    funcDelete(sId);
  }

  return DataCell(
    Container(
      width: nDataColumnWidthIcon,
      // color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: nDataWidthIcon,
            height: 100,
            child: ComBtnImage(
              sImgPath: Icons.edit,
              func: _tapEdit,
              nMarginToMakeIconSmaller: nMarginToMakeIconSmaller,
            ),
          ),
          Container(
            width: nDataWidthIcon,
            height: 100,
            child: ComBtnImage(
              sImgPath: Icons.delete,
              func: _tapDelete,
              nMarginToMakeIconSmaller: nMarginToMakeIconSmaller,
            ),
          ),
        ],
      ),
    ),
  );
}
