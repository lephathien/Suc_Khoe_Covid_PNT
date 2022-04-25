import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter_covid_dashboard_ui/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/config/palette.dart';
import 'package:flutter_covid_dashboard_ui/config/styles.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_covid_dashboard_ui/widgets/stats_grid.dart';
import 'package:pie_chart/pie_chart.dart';

class ThongKeScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<ThongKeScreen> {
  final database = FirebaseDatabase.instance.reference();
  // final lists = [];

  final colorList = <Color>[
    Color(0xfffdcb6e),
    Color(0xff0984e3),
    Color(0xfffd79a8),
    Color(0xffe17055),
    Color(0xff6c5ce7),
  ];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: database.once(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            lists.clear();
            var tempList = [];
            tempList = snapshot.data.value;
            tempList.forEach((element) {
              print(element);
              if (element != null) {
                lists.add(element);
              }
            });
            Map<String, double> dataMap = {
              "Bến Tre": double.parse(lists[8]),
              "Hà Nội": double.parse(lists[9]),
              "TP Hồ Chí Minh": double.parse(lists[10]),
              'Các tỉnh khác': double.parse(lists[11]),
            };
            return Scaffold(
                backgroundColor: Palette.primaryColor,
                //appBar: AppBar(),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/bacsi3.png'),
                            Text(
                              '  Thống kê Covid Bến Tre',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: DefaultTabController(
                          length: 2,
                          child: Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: TabBar(
                              indicator: BubbleTabIndicator(
                                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                                indicatorHeight: 40.0,
                                indicatorColor: Colors.white,
                              ),
                              labelStyle: Styles.tabTextStyle,
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.white,
                              tabs: <Widget>[
                                Text('Việt Nam'),
                                Text('Bến Tre'),
                              ],
                              onTap: (index) {
                                database.set({
                                  '0': '10231641', //VN ca mắc - tổng
                                  '1': '42904', //VN tử vong - tổng
                                  '2': '95360', //Bến Tre ca mắc - tổng
                                  '3': '483', //Bến Tre tử vong - tổng
                                  '4': '23014',
                                  '5': '23',
                                  '6': '216',
                                  '7': '1',
                                  '8': '1529821', // Hà Nội
                                  '9': '95360', //Bến Tre
                                  '10': '604820', //TPHCM
                                  '11': '8001640', //các tỉnh khác
                                });
                                setState(() {
                                  if (index == 0) {
                                    vietnamchon = true;
                                  } else
                                    vietnamchon = false;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: DefaultTabController(
                          length: 2,
                          child: TabBar(
                            indicatorColor: Colors.transparent,
                            labelStyle: Styles.tabTextStyle,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.white60,
                            tabs: <Widget>[
                              Text('Tổng cộng'),
                              //  Text('Hôm nay'),
                              Text('Hôm qua'),
                            ],
                            onTap: (index) {
                              setState(() {
                                if (index == 0) {
                                  tongcongchon = true;
                                } else
                                  tongcongchon = false;
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: StatsGrid(),
                      ),
                      Container(
                        height: 550.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Thống kê ca nhiễm Covid theo tỉnh',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            PieChart(
                              dataMap: dataMap,
                              animationDuration: Duration(milliseconds: 800),
                              chartLegendSpacing: 32,
                              chartRadius:
                                  MediaQuery.of(context).size.width / 1.4,
                              colorList: colorList,
                              initialAngleInDegree: 0,
                              chartType: ChartType.disc,
                              ringStrokeWidth: 32,
                              //centerText: "HYBRID",
                              legendOptions: LegendOptions(
                                showLegendsInRow: false,
                                legendPosition: LegendPosition.bottom,
                                showLegends: true,
                                legendShape: BoxShape.circle,
                                legendTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              chartValuesOptions: ChartValuesOptions(
                                showChartValueBackground: true,
                                showChartValues: true,
                                showChartValuesInPercentage: true,
                                showChartValuesOutside: true,
                                decimalPlaces: 1,
                              ),
                              // gradientList: ---To add gradient colors---
                              // emptyColorGradient: ---Empty Color gradient---
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
