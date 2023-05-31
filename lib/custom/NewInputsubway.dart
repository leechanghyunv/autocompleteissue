
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../model/Subwaymodel.dart';

class NewInputSubway extends StatefulWidget {

  final Function(SubwayModel) onSuggestionSelected;

  const NewInputSubway({Key? key, required this.onSuggestionSelected}) : super(key: key);

  @override
  State<NewInputSubway> createState() => _NewInputSubwayState();
}

class _NewInputSubwayState extends State<NewInputSubway> {

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: appHeight * 0.2791,
        height: appHeight * 0.07255,
        child: TypeAheadField<SubwayModel>(
          suggestionsCallback: (String query) {
            return Future.value(SubwayInfos.where((SubwayModel suggestion) =>
                suggestion.name.toLowerCase().startsWith(query.toLowerCase())).toList());
          },
          itemBuilder: (BuildContext context, SubwayModel suggestion) {
            return ListTile(
              title: Text(suggestion.name),
            );
          },
          onSuggestionSelected: (SubwayModel suggestion) => widget.onSuggestionSelected,
          textFieldConfiguration: TextFieldConfiguration(
            autofocus: true,
            decoration: InputDecoration(
              hintText: '입력 후 완료버튼을 누르세요',
              labelText: 'Enter Destination',
              hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              prefixIcon: Icon(
                Icons.subway,
                color: Colors.black,
              ),
              suffixIcon: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10.0),
                  onTap: () {
                    _controller.clear();
                  },
                  child: Icon(
                      Icons.clear,
                      color: Colors.black
                  ),
                ),
              ),
                ),
          ),
        ),
      ),
    );
  }
}
