import '../modelintable.dart';

class State_DataList {
  static int nPage = 1;
  static List<MainStrucTable> rListData = [
    MainStrucTable(
        number: "001",
        field01: "01",
        field02: "01",
        field03: "f3",
        field04: "f4",
        field05: "f5",
        field06: "f6",
        field07: "f7",
        field08: "f8",
        field09: "f9",
        field10: "f10"),
    MainStrucTable(
        number: "002",
        field01: "02",
        field02: "02",
        field03: "f31",
        field04: "f41",
        field05: "f51",
        field06: "f6",
        field07: "f7",
        field08: "f8",
        field09: "f9",
        field10: "f10"),
    MainStrucTable(
        number: "003",
        field01: "02",
        field02: "02",
        field03: "f31",
        field04: "f41",
        field05: "f51",
        field06: "f6",
        field07: "f7",
        field08: "f8",
        field09: "f9",
        field10: "f10"),
  ];
}

final int nTableCellPerEachPage = 10;
final int nNumToShowArrowAtPage = 5; //show < > when more than 5 page
