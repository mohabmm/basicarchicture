import 'package:basicarchicture/core/services/scaffold_service.dart';
import 'package:flutter/material.dart';

import '../../service_locator.dart';

showSnackBar(String value) {
  ScaffoldService scaffoldService = locator<ScaffoldService>();
  FocusScope.of(scaffoldService.context).requestFocus(new FocusNode());
  scaffoldService.removeCurrentSnackBar();
  scaffoldService.showSnackBar(
    new Text(
      value,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontFamily: "WorkSansSemiBold",
      ),
    ),
  );
}
