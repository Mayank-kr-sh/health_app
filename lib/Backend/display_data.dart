import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DisplayData extends StatefulWidget {
  const DisplayData({super.key});

  @override
  _DisplayDataState createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  Map<String, dynamic> data = {};

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://cijtoday.com/apitest.php?name=Tonny&class=sonny&section=Ramu&rollnumber=Tonny&school=Tonny&hobbie=Tonny&phone=Tonny'));
    print(response.body);
    if (response.statusCode == 200) {
      try {
        setState(() {
          // data = jsonDecode(response.body) as List<dynamic>;
          data = jsonDecode(response.body);
        });
      } catch (e) {
        print('JSON Decoding Error: $e'); // Print the error for debugging
        setState(() {
          data = {'name': 'Error decoding JSON'};
        });
      }
    } else {
      setState(() {
        data = {'name': 'Error fetching data'};
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Data in Dart'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            if (data.isNotEmpty) {
              return ListTile(
                title: Text(data['name']),
                subtitle: Text(data['class']),
              );
            } else {
              return const CircularProgressIndicator(); // Or an error message widget
            }
          },
        ),
      ),
    );
  }
}
