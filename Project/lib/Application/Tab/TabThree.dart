import 'package:dwr0001/Application/providers/river_provider.dart';
import 'package:dwr0001/Models/data_Model.dart';
import 'package:dwr0001/Services/main_Service.dart';
import 'package:dwr0001/components/AreaChart.dart';
import 'package:dwr0001/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: must_be_immutable
class TabThree extends StatelessWidget {
  TabThree(this.stnId, this.title, this.wl, this.rf);
  String title;
  String wl;
  String rf;
  List<DataModelGet> resultOffline = [];
  bool check = false;
  var stnId;
  @override
  Widget build(BuildContext context) {
    List<DataModelGet> data = [];
    return Consumer<RiverProviderTabTwo>(
      builder: (context, Data, _) => FutureBuilder<List<DataModelGet>>(
        future: getStationData24H(stnId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            data = snapshot.data;
            // return AreaAndLineChart.withSampleData(data);
            if (data.length != 0) {
              return AreaChart(
                data: data,
                stnid: stnId,
                title: title,
                wl: wl,
                rf: rf,
              );
            } else {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.0),
                    color: Colors.lightBlue[700],
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Flexible(
                          child: Text(
                            "สถานี : " + stnId + " " + title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize:
                                  ResponsiveFlutter.of(context).fontSize(2),
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Kanit',
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "ไม่พบข้อมูล",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Kanit',
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            color: Colors.black45),
                      ),
                    ),
                  ),
                ],
              );
            }
          } else if (snapshot.hasError) {
            for (var i in Data.dataRiver) {
              if (i.stnId == stnId) {
                data = i.data;
                // return AreaAndLineChart.withSampleData(data);
                return AreaChart(
                  data: data,
                  stnid: stnId,
                  title: title,
                  wl: wl,
                  rf: rf,
                );
              }
            }
            if (snapshot.data == null) {
              return LoadingSquareCircle();
            }
          }
          return LoadingSquareCircle();
        },
      ),
    );
  }
}
