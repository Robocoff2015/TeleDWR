import 'dart:convert';
import 'package:dwr0001/Models/basinInfoModel.dart';
import 'package:dwr0001/Models/data_Model.dart';
import 'package:http/http.dart' as http;
import 'package:dwr0001/Models/station_model.dart';

// ignore: missing_return
List<StationModel> parseStation(String responseBody, String tab) {
  var parsed = [];
  switch (tab) {
    case "1":
      parsed = json.decode(responseBody.toString());
      return parsed
          .map<StationModel>((json) => StationModel.fromJson(json))
          .toList();
      break;
    case "2":
      parsed = json.decode(responseBody.toString());
      var result = parsed.where((status) =>
          (status["CURR_STATUS"] == "1" || status["CURR_STATUS"] == "2"));
      return result
          .map<StationModel>((json) => StationModel.fromJson(json))
          .toList();
      break;
    default:
      print("ไม่ตรงเงื่อนไข");
      break;
  }
}

Future<List<StationModel>> getStationListTab(var basinId, var tab) async {
  try {
    //final response = await http.get('http://192.168.1.2:8000/products.json');
    final String url = basinId == 1
        ? "http://tele-maeklong.dwr.go.th/webservice/webservice_mk_json"
        : basinId == 2
            ? "http://tele-salawin.dwr.go.th/webservice/webservice_sl_json"
            : basinId == 3
                ? "http://tele-kokkhong.dwr.go.th/webservice/webservice_kk_json"
                : basinId == 4
                    ? "https://tele-songkramhuailuang.dwr.go.th/webservice/webservice_skh_Json"
                    : basinId == 5
                        ? "http://tele-bangpakong.dwr.go.th/webservice/webservice_bpk_Json"
                        : basinId == 6
                            ? "https://tele-bangsaphan.dwr.go.th/webservice/webservice_bsp_Json"
                            : basinId == 7
                                ? "http://tele-nakhonsri.dwr.go.th/webservice/webservice_nst_json"
                                : basinId == 8
                                    ? "https://tele-southwest.dwr.go.th/webservice/webservice_sw_Json"
                                    : "http://tele-maeklong.dwr.go.th/webservice/webservice_mk_json";
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return parseStation(response.body, tab);
    } else {
      return [];
      // throw Exception('Unable to fetch products from the REST API');
    }
  } catch (e) {
    print(e);
    return [];
  }
}

Future<StationModel> getStation(String stn_id, int basinId) async {
  try {
    String url;
    switch (basinId) {
      case 1:
        {
          url =
              "http://tele-maeklong.dwr.go.th/webservice/webservice_mk_json_id?stn_id=" +
                  stn_id;
        }
        break;

      case 2:
        {
          url =
              "http://tele-salawin.dwr.go.th/webservice/webservice_sl_json_id?stn_id=" +
                  stn_id;
        }
        break;
      case 3:
        {
          url =
              "http://tele-kokkhong.dwr.go.th/webservice/webservice_kk_json_id?stn_id=" +
                  stn_id;
        }
        break;
      case 4:
        {
          url =
              "https://tele-songkramhuailuang.dwr.go.th/webservice/webservice_skh_Json_id?stn_id=" +
                  stn_id;
        }
        break;
      case 5:
        {
          url =
              "http://tele-bangpakong.dwr.go.th/webservice/webservice_bpk_Json_id?stn_id=" +
                  stn_id;
        }
        break;
      case 6:
        {
          url =
              "https://tele-bangsaphan.dwr.go.th/webservice/webservice_bsp_Json_id?stn_id=" +
                  stn_id;
        }
        break;
      case 7:
        {
          url =
              "https://tele-nakhonsri.dwr.go.th/webservice/webservice_nst_json_id?stn_id=" +
                  stn_id;
        }
        break;
      case 8:
        {
          url =
              "https://tele-southwest.dwr.go.th/webservice/webservice_sw_Json_id?stn_id=" +
                  stn_id;
        }
        break;
    }
    //final String url = "http://tele-maeklong.dwr.go.th/webservice/webservice_mk_json";
    //https://localhost:44303/webservice/webservice_mk_json_id?stn_id=TC140805
    //final String url = "https://jsonplaceholder.typicode.com/todos/1";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final station = jsonDecode(response.body);
      return StationModel.fromJson(station);
    } else {
      throw Exception(
          'Failed load data with status code ${response.statusCode}');
    }
  } catch (e) {
    print(e);
  }
}

List<DataModelGet> parseData_(String responseBody) {
  final parsed = json.decode(responseBody);
  return parsed
      .map<DataModelGet>((json) => DataModelGet.fromJson(json))
      .toList();
}

Future<String> getCCTVStream(String stn_id) async {
  final String url =
      "https://tele-bangpakong.dwr.go.th/webservice/webservice_CCTV_Json_id?stn_id=${stn_id}";
  final response = await http.get(Uri.parse(url));
  // final parsed = json.decode(response.body);
  return response.body;
}

Future<List<DataModelGet>> getStationData24H(String stn_id) async {
  //final String url ="http://tele-maeklong.dwr.go.th/webservice/webservice_mk_json?stn_id=" + stn_id;
  final String url =
      "http://tele-kokkhong.dwr.go.th/webservice/getdata?station_ID=" + stn_id;
  //https://localhost:44303/webservice/webservice_mk_json_id?stn_id=TC140805
  //final String url = "https://jsonplaceholder.typicode.com/todos/1";
  final response = await http.get(Uri.parse(url));
  final parsed = json.decode(response.body);
  if (parsed.length == 0) {
    return [];
  }
  // print(parsed);
  // print(parsed.length);
  // if (parsed.length == 0) {
  //   final String url =
  //       // "https://tele-nakhonsri.dwr.go.th/webservice/getdata?station_id=TC140605";
  //       "https://tele-songkramhuailuang.dwr.go.th/webservice/getdata?station_id=TC140605";
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     final parsed = json.decode(response.body);
  //     return parsed
  //         .map<DataModelGet>((json) => DataModelGet.fromJson(json))
  //         .toList();
  //   } else {
  //     throw Exception();
  //   }
  // }
  if (response.statusCode == 200) {
    return parseData_(response.body);
  } else {
    throw Exception();
  }
}

Future<List<BasinsInfoModel>> basinInfoData() async {
  final String url =
      "https://tele-songkramhuailuang.dwr.go.th/webservice/basins_info";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse
        .map((data) => new BasinsInfoModel.fromJson(data))
        .toList();
    // return response.body
    //     .map<BasinsInfoModel>((json) => BasinsInfoModel.fromJson(json))
    //     .toList();
  } else {
    throw Exception();
  }
}

Future<List<StationModel>> getNotification() async {
  try {
    final String url =
        "https://tele-songkramhuailuang.dwr.go.th/webservice/webservice_skh_Json_notify";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => new StationModel.fromJson(data))
          .toList();
    } else {
      throw Exception();
    }
  } catch (e) {
    print(e);
  }
}
