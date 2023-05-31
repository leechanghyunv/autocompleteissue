import 'package:autocomplete_test/custom/TextFrame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import '../custom/Inputsubway.dart';

final box = GetStorage();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String subway ='';

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('왜 오토 택스트필드값이 저장이 되지 않을까요'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputSubway(
              itemSubmitted: (String value) {
                setState(() {
                  subway = value;
                  print(value);
                  print(subway);
                  Get.snackbar('','');
                });
                box.write('box',subway);
              },

            ),
            SizedBox(height: 35,),
            TextFrame(comment: box.read('box') ?? ''),
            TextFrame(comment: subway),
          ],
        ),
      ),
    );
  }
}
