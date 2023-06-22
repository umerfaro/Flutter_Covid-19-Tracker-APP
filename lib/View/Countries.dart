import 'package:flutter/material.dart';

import '../Services/states_services.dart';
import 'package:shimmer/shimmer.dart';

import 'Details.dart';

class Countries extends StatefulWidget {
  const Countries({super.key});

  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(children: [
        TextFormField(
          onChanged: (value) {
            setState(() {});
          },
          controller: searchController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            labelText: 'Search',
            hintText: 'Search with country name',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: StatesServices.fetchCountriesStatesData(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (!snapshot.hasData) {
                return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        highlightColor: Colors.grey.shade100,
                        baseColor: Colors.grey.shade700,
                        child: Column(
                          children: [
                            ListTile(
                              title: Container(
                                height: 10,
                                width: 89,
                                color: Colors.white,
                              ),
                              subtitle: Container(
                                height: 10,
                                width: 89,
                                color: Colors.white,
                              ),
                              leading: Container(
                                height: 50,
                                width: 50,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      );
                    });
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String name = snapshot.data![index]['country'];

                      if (searchController.text.isEmpty) {
                        return Column(children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CountriesDetails(
                                            name: snapshot.data![index]
                                                ['country'],
                                            image: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                            totalcases: snapshot.data![index]
                                                ['cases'],
                                            totaldeaths: snapshot.data![index]
                                                ['deaths'],
                                            todayRecovered: snapshot
                                                .data![index]['todayRecovered'],
                                            critical: snapshot.data![index]
                                                ['critical'],
                                            active: snapshot.data![index]
                                                ['active'],
                                            test: snapshot.data![index]
                                                ['tests'],
                                            totalrecovered: snapshot
                                                .data![index]['recovered'],
                                          )));
                            },
                            child: ListTile(
                              title: Text(snapshot.data![index]['country']),
                              subtitle: Text(
                                  'Confirmed: ${snapshot.data![index]['cases']}'),
                              leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(snapshot.data![index]
                                      ['countryInfo']['flag'])),
                            ),
                          )
                        ]);
                      } else if (name
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase())) {
                        return Column(children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CountriesDetails(
                                            name: snapshot.data![index]
                                                ['country'],
                                            image: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                            totalcases: snapshot.data![index]
                                                ['cases'],
                                            totaldeaths: snapshot.data![index]
                                                ['deaths'],
                                            todayRecovered: snapshot
                                                .data![index]['todayRecovered'],
                                            critical: snapshot.data![index]
                                                ['critical'],
                                            active: snapshot.data![index]
                                                ['active'],
                                            test: snapshot.data![index]
                                                ['tests'],
                                            totalrecovered: snapshot
                                                .data![index]['recovered'],
                                          )));
                            },
                            child: ListTile(
                              title: Text(snapshot.data![index]['country']),
                              subtitle: Text(
                                  'Confirmed: ${snapshot.data![index]['cases']}'),
                              leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(snapshot.data![index]
                                      ['countryInfo']['flag'])),
                            ),
                          )
                        ]);
                      } else {
                        return Container();
                      }
                    });
              }
            },
          ),
        )
      ])),
    );
  }
}
