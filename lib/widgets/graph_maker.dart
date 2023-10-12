import 'package:flutter/material.dart';

import 'graph_container.dart';

class GraphMaker extends StatelessWidget {
  final List currentList;
  const GraphMaker({super.key, required this.currentList});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: ListView.builder(
            itemCount: currentList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              double currentTemp = currentList[index];
              double? nextTemp = index == currentList.length - 1
                  ? null
                  : currentList[index + 1];

              String sufix = index < 12 ? 'AM' : 'PM';
              String current = index % 12 != 0 ? (index % 12).toString() : '12';

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      GraphContainer(
                          index: index,
                          currentTemp: currentTemp,
                          nextTemp: nextTemp),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 90 -
                                (currentTemp + (nextTemp ?? currentTemp) / 2)),
                        child: Text(
                          '$currentTemp \u00B0C',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Text("$current : 00 $sufix"),
                ],
              );
            }));
  }
}
