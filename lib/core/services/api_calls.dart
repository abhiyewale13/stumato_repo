import "dart:convert";

import "package:http/http.dart" as http;

class CustomHttpRequest {
  static List<Map<String,dynamic>>? alldata;
  static Map? singledata;

  // to get all data
  static void getalldata(String urilink) async {
    Uri url = Uri.parse(urilink);
    http.Response response = await http.get(url);
    alldata = jsonDecode(response.body);
  }
 // to get  single data
   static void getSingledata(String urilink) async {
    Uri url = Uri.parse(urilink);
    http.Response response = await http.get(url);
    singledata = jsonDecode(response.body);
  }

// to insert the data
  static void insertdata(String urilink, Map data) async {
    Uri url = Uri.parse(urilink);

    await http.post(url,
        body: jsonEncode(data), headers: {"content-type": "application/json"});
  }
}
