import 'package:autocomplete_test/custom/TextFrame.dart';
import 'package:autocomplete_test/model/Subwaymodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import '../custom/Inputsubway.dart';
import '../custom/NewInputsubway.dart';

final box = GetStorage();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String subwayA ='';
String subwayB ='';

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TextFrame(comment: '왜 오토 택스트필드값이 저장이 되지 않을까요???'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFrame(comment: 'autocomplete_textfield: ^2.0.1'),
            InputSubway(
              itemSubmitted: (SubwayModel value) {
                setState(() {
                  subwayA = value.name;
                  print(subwayA);
                });
                box.write('box',subwayA);
              },
            ),
            SizedBox(height: 35,),
            TextFrame(comment: 'flutter_typeahead: ^4.6.0'),
            NewInputSubway(
              onSuggestionSelected: (SubwayModel value) {
                setState(() {
                  subwayB = value.name;
                  print(subwayB);
                });
                box.write('box',subwayB);
              },),
            SizedBox(height: 35,),
            TextFrame(comment: box.read('box') ?? ''),
            Row(
              children: [
                TextFrame(comment: subwayA),
                TextFrame(comment: subwayB),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
