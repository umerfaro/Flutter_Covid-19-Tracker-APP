import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Model/WorldStatesModel.dart';
import '../Services/states_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_covid_19_tracking_app/View/Countries.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              FutureBuilder(
                  future: StatesServices.fetchworldStatesData(),
                  builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50.0,
                          controller: _animationController,
                        ),
                      );
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            PieChart(
                              dataMap: {
                                'Confirmed': double.parse(
                                    snapshot.data!.cases!.toString()),
                                'Recovered': double.parse(
                                    snapshot.data!.recovered!.toString()),
                                'Deaths': double.parse(
                                    snapshot.data!.deaths!.toString()),
                              },
                              chartRadius:
                                  MediaQuery.of(context).size.width / 3.2,
                              legendOptions: const LegendOptions(
                                showLegendsInRow: false,
                                legendPosition: LegendPosition.left,
                                showLegends: true,
                                legendTextStyle: TextStyle(
                                  // fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              animationDuration:
                                  const Duration(milliseconds: 1200),
                              chartType: ChartType.ring,
                              ringStrokeWidth: 20,
                              colorList: colorList,
                              chartValuesOptions: ChartValuesOptions(
                                showChartValuesInPercentage: true,
                                showChartValues: true,
                                showChartValuesOutside: false,
                                decimalPlaces: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.sizeOf(context).height * 0.06),
                              child: Card(
                                  child: Column(children: [
                                ReuseableRow(
                                    name: "Confirmed",
                                    value: snapshot.data!.cases!.toString()),
                                ReuseableRow(
                                    name: "Recovered",
                                    value: snapshot.data!.recovered!.toString()),
                                ReuseableRow(
                                    name: "Deaths",
                                    value: snapshot.data!.deaths!.toString()),
                                ReuseableRow(
                                    name: "Active",
                                    value: snapshot.data!.active!.toString()),
                                ReuseableRow(
                                    name: "Critical",
                                    value: snapshot.data!.critical!.toString()),
                                ReuseableRow(
                                    name: "Today Deaths",
                                    value:
                                        snapshot.data!.todayDeaths!.toString()),
                                ReuseableRow(
                                    name: "Today Recovered",
                                    value: snapshot.data!.todayRecovered!
                                        .toString()),
                              ])),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Countries()));
                              },
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.05,
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff1aa260),
                                ),
                                child: Center(
                                    child: Text(
                                  "Track Countries",
                                  style: TextStyle(fontSize: 20),
                                )),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {

  String name, value;
  ReuseableRow({super.key, this.name = "", required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(name),
            Text(value),
          ]),
          SizedBox(
            height: 5,
          ),
          Divider(),
        ],
      ),
    );
  }
}
