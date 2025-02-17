import 'dart:convert';
import 'package:dwr0001/Models/map_Model.dart';
import 'package:dwr0001/Models/station_model.dart';
import 'package:http/http.dart' as http;

Future<List<StationModel>> get_dataMap(int basinId) async {
  String url = "";
  switch (basinId) {
    case 1:
      {
        url = "";
      }
      break;

    case 2:
      {
        url = "";
      }
      break;
    case 3:
      {
        url = "";
      }
      break;
    case 4:
      {
        url =
            "https://tele-songkramhuailuang.dwr.go.th/webservice/webservice_skh_Json";
      }
      break;
    case 5:
      {
        url =
            "https://tele-bangpakong.dwr.go.th/webservice/webservice_bpk_Json";
      }
      break;
    case 6:
      {
        url =
            "https://tele-bangsaphan.dwr.go.th/webservice/webservice_bsp_Json";
      }
      break;
    case 7:
      {
        url = "https://tele-nakhonsri.dwr.go.th/webservice/webservice_nst_json";
      }
      break;
    case 8:
      {
        url = "https://tele-southwest.dwr.go.th/webservice/webservice_sw_Json";
      }
      break;
  }
  // ส่ง Basin พร้อมกับข้อมูล
  // "https://tele-nakhonsri.dwr.go.th/webservice/webservice_nst_json";
  if (url != "") {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => new StationModel.fromJson(data))
          .toList();
    } else {
      // throw Exception('Unable to fetch products from the REST API');
      return [];
    }
  }
}

Future<MapModel> get_polygon() async {
  final String url =
      "https://tele-songkramhuailuang.dwr.go.th/webservice/webservice_skh_get_geoData";

  // "http://tele-nakhonsri.dwr.go.th/webservice/webservice_nst_get_geodata";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return MapModel.fromJson(jsonDecode(response?.body));
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
