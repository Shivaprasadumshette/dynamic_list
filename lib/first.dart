import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  List<DynamicWidget> listDynamic = [];
  List<String> data = [];
  Icon floatingIcon = Icon(Icons.add);

  addDynamic() {
    if (data.length != 0) {
      floatingIcon = Icon(Icons.add);

      data = [];
      listDynamic = [];
      print('if');
    }
    setState(() {});

    listDynamic.add(DynamicWidget());
  }
  submitData() {
    floatingIcon = Icon(Icons.arrow_back);
    data = [];
    listDynamic.forEach((widget) => data.add(widget.controller.text));
    setState(() {});
    print(data.length);
  }

  @override
  Widget build(BuildContext context) {

    Widget submitButton = Container(
      child: ElevatedButton(
        onPressed: submitData,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Submit Data'),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynaminc app"),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
                    itemCount: listDynamic.length,
                    itemBuilder: (_, index) => listDynamic[index])),
            Container(
                child: InkWell(
              onTap: null,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // adding color will hide the splash effect
                  color: Colors.blueGrey.shade200,
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addDynamic,
        child: Icon(Icons.add),
      ),
    );
  }
}

class DynamicWidget extends StatelessWidget {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.blueAccent)
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Enter data'),
      ),
    );
  }
}
