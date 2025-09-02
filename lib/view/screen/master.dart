import 'package:flutter/material.dart';
import 'package:iqra/view/screen/screen.dart';

class Master extends StatelessWidget {
  const Master({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.maxWidth<600){
        return Mobile();
      }else if(constraints.maxWidth>600 && constraints.maxWidth<800){
        return Tablet();
      }else{
        return Desktop();
      }
    });
  }
}
