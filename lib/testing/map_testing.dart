import 'package:flutter/material.dart';
import 'package:picktask/utils/extra_widget.dart';

class MapTesting extends StatefulWidget {
  const MapTesting({super.key});

  @override
  State<MapTesting> createState() => _MapTestingState();
}

class _MapTestingState extends State<MapTesting> {
  var name = TextEditingController();
  var email = TextEditingController();
  Map<String, dynamic> myMap = {};
  List<Model> myList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Testing Map"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: name,
          ),
          space(0.2),
          TextFormField(
            controller: email,
          ),
          space(0.2),
          TextButton(
              onPressed: () {
                Model model = Model();

                model.name = name.text;
                model.email = email.text;

                myList.add(model);

                print("myList: ${myList}");
              },
              child: const Text("Press here!"))
        ],
      ),
    );
  }
}

class Model {
  String name = "";
  String email = "";
}
