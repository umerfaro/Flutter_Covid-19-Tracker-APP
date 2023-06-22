import 'package:flutter/material.dart';

import 'World_states.dart';

class CountriesDetails extends StatefulWidget {
  String name;
  String image;
  int totalcases,
      totaldeaths,
      totalrecovered,
      active,
      critical,
      todayRecovered,
      test;
  CountriesDetails({
    required this.name,
    required this.image,
    required this.totalcases,
    required this.totaldeaths,
    required this.todayRecovered,
    required this.critical,
    required this.active,
    required this.test,
    required this.totalrecovered,
  });

  @override
  State<CountriesDetails> createState() => _CountriesDetailsState();
}

class _CountriesDetailsState extends State<CountriesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).height * 0.067),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.06,
                        ),
                        ReuseableRow(
                            name: "Total Cases",
                            value: widget.totalcases.toString()),
                        ReuseableRow(
                            name: "Total Deaths",
                            value: widget.totaldeaths.toString()),
                        ReuseableRow(
                            name: "Total Recovered",
                            value: widget.totalrecovered.toString()),
                        ReuseableRow(
                            name: "Active Cases",
                            value: widget.active.toString()),
                        ReuseableRow(
                            name: "Critical Cases",
                            value: widget.critical.toString()),
                        ReuseableRow(
                            name: "Today Recovered",
                            value: widget.todayRecovered.toString()),
                        ReuseableRow(
                            name: "Total Tests", value: widget.test.toString()),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
