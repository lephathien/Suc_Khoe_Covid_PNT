import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/data/data.dart';

class StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.125,
      child: Column(
        children: <Widget>[
          Flexible(
            child: tongcongchon
                ? Row(
                    children: <Widget>[
                      vietnamchon
                          ? _buildStatCard(
                              'Nhiễm bệnh', lists[0].toString(), Colors.orange)
                          : _buildStatCard(
                              'Nhiễm bệnh', lists[2].toString(), Colors.orange),
                      vietnamchon
                          ? _buildStatCard(
                              'Tử vong', lists[1].toString(), Colors.red)
                          : _buildStatCard(
                              'Tử vong', lists[3].toString(), Colors.red),
                    ],
                  )
                : Row(
                    children: <Widget>[
                      vietnamchon
                          ? _buildStatCard(
                              'Nhiễm bệnh', lists[4].toString(), Colors.orange)
                          : _buildStatCard(
                              'Nhiễm bệnh', lists[6].toString(), Colors.orange),
                      vietnamchon
                          ? _buildStatCard(
                              'Tử vong', lists[5].toString(), Colors.red)
                          : _buildStatCard(
                              'Tử vong', lists[7].toString(), Colors.red),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
