// import 'package:flutter/foundation.dart';

// class StationModel {
//   final String STN_ID;
//   final String STN_Name;
//   final String CURR_Acc_Rain_15_M;
//   final String CURR_Acc_Rain_30_M;
//   final String CURR_Acc_Rain_60_M;
//   final String CURR_Acc_Rain_1_D;
//   final String CURR_Acc_Rain_12_H;
//   final String CURR_Water_D_Level_MSL;
//   final String CURR_Water_U_Level_MSL;
//   final String CURR_FLOW;
//   final String RF;
//   final String WL;
//   final String WF;
//   final String CURR_CCTV;
//   final String CURR_STATUS;
//   final String LAST_UPDATE;
//   final int BASINID;

//   StationModel({
//     this.STN_ID,
//     this.STN_Name,
//     this.CURR_Acc_Rain_15_M,
//     this.CURR_Acc_Rain_30_M,
//     this.CURR_Acc_Rain_60_M,
//     this.CURR_Acc_Rain_1_D,
//     this.CURR_Acc_Rain_12_H,
//     this.CURR_Water_D_Level_MSL,
//     this.CURR_Water_U_Level_MSL,
//     this.CURR_FLOW,
//     this.RF,
//     this.WL,
//     this.WF,
//     this.CURR_CCTV,
//     this.CURR_STATUS,
//     this.LAST_UPDATE,
//     this.BASINID,
//   });

//   factory StationModel.fromJson(final json) {
//     return StationModel(
//         STN_ID: json['STN_ID'],
//         STN_Name: json['STN_Name'],
//         CURR_Acc_Rain_15_M: json['CURR_Acc_Rain_15_M'],
//         CURR_Acc_Rain_30_M: json['CURR_Acc_Rain_30_M'],
//         CURR_Acc_Rain_60_M: json['CURR_Acc_Rain_60_M'],
//         CURR_Acc_Rain_1_D: json['CURR_Acc_Rain_1_D'],
//         CURR_Acc_Rain_12_H: json['CURR_Acc_Rain_12_H'],
//         CURR_Water_D_Level_MSL: json['CURR_Water_D_Level_MSL'],
//         CURR_Water_U_Level_MSL: json['CURR_Water_U_Level_MSL'],
//         CURR_FLOW: json['CURR_FLOW'],
//         RF: json['RF'],
//         WL: json['WL'],
//         WF: json['WF'],
//         CURR_CCTV: json['CURR_CCTV'],
//         CURR_STATUS: json['CURR_STATUS'],
//         LAST_UPDATE: json['LAST_UPDATE'],
//         BASINID: json['BASIONID']);
//   }
// }

import 'dart:convert';

List<StationModel> stationModelFromJson(String str) => List<StationModel>.from(
    json.decode(str).map((x) => StationModel.fromJson(x)));

String stationModelToJson(List<StationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StationModel {
  StationModel({
    this.STN_ID,
    this.STN_Name,
    this.CURR_Acc_Rain_15_M,
    this.CURR_Acc_Rain_30_M,
    this.CURR_Acc_Rain_60_M,
    this.CURR_Acc_Rain_1_D,
    this.CURR_Acc_Rain_12_H,
    this.CURR_Water_D_Level_MSL,
    this.CURR_Water_U_Level_MSL,
    this.CURR_FLOW,
    this.RF,
    this.WL,
    this.WF,
    this.CURR_CCTV,
    this.CURR_STATUS,
    this.CURR_STATUS_WL,
    this.LAST_UPDATE,
    this.BASINID,
    this.LAT,
    this.LON,
  });

  final String STN_ID;
  final String STN_Name;
  final String CURR_Acc_Rain_15_M;
  final String CURR_Acc_Rain_30_M;
  final String CURR_Acc_Rain_60_M;
  final String CURR_Acc_Rain_1_D;
  final String CURR_Acc_Rain_12_H;
  final String CURR_Water_D_Level_MSL;
  final String CURR_Water_U_Level_MSL;
  final String CURR_FLOW;
  final String RF;
  final String WL;
  final String WF;
  final String CURR_CCTV;
  final String CURR_STATUS;
  final String CURR_STATUS_WL;
  final String LAST_UPDATE;
  int BASINID;
  final String LAT;
  final String LON;

  factory StationModel.fromJson(Map<String, dynamic> json) => StationModel(
        STN_ID: json["STN_ID"],
        STN_Name: json["STN_Name"],
        CURR_Acc_Rain_15_M: json["CURR_Acc_Rain_15_M"],
        CURR_Acc_Rain_30_M: json["CURR_Acc_Rain_30_M"],
        CURR_Acc_Rain_60_M: json["CURR_Acc_Rain_60_M"],
        CURR_Acc_Rain_1_D: json["CURR_Acc_Rain_1_D"],
        CURR_Acc_Rain_12_H: json["CURR_Acc_Rain_12_H"],
        CURR_Water_D_Level_MSL: json["CURR_Water_D_Level_MSL"],
        CURR_Water_U_Level_MSL: json["CURR_Water_U_Level_MSL"],
        CURR_FLOW: json["CURR_FLOW"],
        RF: json["RF"],
        WL: json["WL"],
        WF: json["WF"],
        CURR_CCTV: json["CURR_CCTV"],
        CURR_STATUS: json["CURR_STATUS"],
        CURR_STATUS_WL: json["CURR_STATUS_WL"],
        LAST_UPDATE: json["LAST_UPDATE"],
        BASINID: json["BASINID"],
        LAT: json["LAT"],
        LON: json["LON"],
      );

  Map<String, dynamic> toJson() => {
        "STN_ID": STN_ID,
        "STN_Name": STN_Name,
        "CURR_Acc_Rain_15_M": CURR_Acc_Rain_15_M,
        "CURR_Acc_Rain_30_M": CURR_Acc_Rain_30_M,
        "CURR_Acc_Rain_60_M": CURR_Acc_Rain_60_M,
        "CURR_Acc_Rain_1_D": CURR_Acc_Rain_1_D,
        "CURR_Acc_Rain_12_H": CURR_Acc_Rain_12_H,
        "CURR_Water_D_Level_MSL": CURR_Water_D_Level_MSL,
        "CURR_Water_U_Level_MSL": CURR_Water_U_Level_MSL,
        "CURR_FLOW": CURR_FLOW,
        "RF": RF,
        "WL": WL,
        "WF": WF,
        "CURR_CCTV": CURR_CCTV,
        "CURR_STATUS": CURR_STATUS,
        "CURR_STATUS_WL": CURR_STATUS_WL,
        "LAST_UPDATE": LAST_UPDATE,
        "BASINID": BASINID,
        "LAT": LAT,
        "LON": LON,
      };
}
