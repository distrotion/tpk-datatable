import 'package:flutter/material.dart';
import 'package:set_table_data/style/style.dart';

class ComBtnBlackBorder extends StatelessWidget {
  const ComBtnBlackBorder(
      {Key? key,
      this.func,
      this.sLabel,
      this.nWidth = 342,
      this.nHeight = 36,
      this.nFontSize = 14,
      this.cBg = Colors.white})
      : super(key: key);
  final String? sLabel;
  final double nWidth;
  final double nHeight;
  final double nFontSize;
  final Color cBg;
  final Function? func;
  //? disable btn by set func to null

  @override
  Widget build(BuildContext context) {
    bool _isEnable = true;
    Color c;
    if (func == null) {
      _isEnable = false;
      c = CustomTheme.colorGreyDisable;
    } else {
      c = CustomTheme.colorDark;
    }
    void tapFunc() {
      return func!();
    }

    return Container(
      width: nWidth,
      height: nHeight,
      child: ElevatedButton(
        onPressed: !_isEnable ? null : tapFunc,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shape: StadiumBorder(),
          shadowColor: Colors.transparent,
        ),
        child: Text(
          sLabel.toString(),
          style: TxtStyle(fontSize: nFontSize, color: c),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: c,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
