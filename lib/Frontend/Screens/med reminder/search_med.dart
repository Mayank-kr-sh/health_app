import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_app/Frontend/Screens/profile/profile_menu.dart';

import '../../Constant/Constant.dart';
import '../../Constant/data/med_data.dart';
import 'add_reminders.dart';

class SearchMed extends StatefulWidget {
  const SearchMed({super.key});

  @override
  _SearchMedState createState() => _SearchMedState();
}

class _SearchMedState extends State<SearchMed> {
  List<String> dummyData = dummyMed;

  List<String> filteredData = [];

  @override
  void initState() {
    filteredData;
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> searchResults = [];
    searchResults.addAll(dummyData);

    if (query.isNotEmpty) {
      searchResults = searchResults
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      searchResults = [];
    }

    setState(() {
      filteredData = searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes the shadow
        title: const Text(
          'Set Medication Reminder',
          style: TextStyle(color: Colors.black87),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: kPrimaryColor,
              onChanged: (value) {
                filterSearchResults(value);
              },
              // keyboardType: TextInputType,
              decoration: InputDecoration(
                labelText: 'Search Medicines',
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 16.0,
                ),
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kSecondaryColor),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kSecondaryColor),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon:
                    const Icon(Icons.search_outlined, color: kSecondaryColor),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        // color: Colors.white,
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.add_circle,
                                color: kSecondaryColor),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              color: Colors.white,
                              child: Text(
                                filteredData[index],
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            // SvgPicture.asset(
                            //   "assets/icons/drugs.svg",
                            //   color: Colors.black,
                            //   width: 15,
                            // ),
                            // const Divider(
                            //   color: kPrimaryColor,
                            //   height: 0,
                            //   thickness: 1,
                            //   // indent: 10,
                            //   // endIndent: 10,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      print('Tapped item: ${filteredData[index]}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddReminder(
                            text: filteredData[index],
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
