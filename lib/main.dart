import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(MaterialApp(
  theme: ThemeData(primarySwatch: Colors.teal)
  , home: const HomePage(),
));

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  late List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading Json Data"),
      ),
      body: Center(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('localjson/person.json'),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          //    Decoding JSON -
            var myData = json.decode(snapshot.data.toString());
            return ListView.builder(itemBuilder: (BuildContext context, int index){
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Name:  ${myData[index]['name']}"),
                    Text("Age: ${myData[index]['age']}"),  // This is analogous of myData[index]['age/height'].toString()
                    Text("Gender:  ${myData[index]['gender']}"),
                    Text("Height: ${myData[index]['height']}") // This is analogous of myData[index]['age/height'].toString()
                  ],
                ),
              );
            },
            itemCount: myData == null ? 0 : myData.length,
            );
          },
        ),
      ),
    );
  }

}