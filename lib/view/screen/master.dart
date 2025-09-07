import 'package:flutter/material.dart';
import 'package:iqra/utils/device_type_helper.dart';
import 'package:iqra/view/screen/screen.dart';

class Master extends StatelessWidget {
  const Master({super.key});

  @override
  Widget build(BuildContext context) {
    if(DeviceTypeHelper.isDesktop(context)){
      return Desktop();
    }
    else if(DeviceTypeHelper.isTablet(context)){
      return Tablet();
    }else{
      return Mobile();
    }
  }
}