import 'package:arkroot_technologies_apod_app/provider/date_provider.dart';
import 'package:arkroot_technologies_apod_app/services/http_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardDemo extends StatefulWidget {
  @override
  DashboardDemoState createState() => DashboardDemoState();
}

class DashboardDemoState extends State<DashboardDemo> {
  DateTime selectedDate = DateTime.now();

  var apidata;

  String selectdata = DateTime.now().toString().split(' ')[0];

  selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        selectdata = "${selectedDate.toLocal()}".split(' ')[0];
        print(selectdata);
      });
    }
  }

  HttpServices http = HttpServices();
  Future getApiData() async {
    Response response;
    try {
      response = await http.getRequest(
          "https://api.nasa.gov/planetary/apod?api_key=aWPhODExHc5j48m59viPzCysv1jkoaN7ID2dchPw&date=$selectdata");
      if (response.statusCode == 200) {
        setState(() {
          print(response.data);
          apidata = response.data;
        });
      } else {
        print("something is wrong");
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    getApiData();
  }

  @override
  Widget build(BuildContext context) {
    DateProvider _dateprovider = Provider.of<DateProvider>(context);
    print("sanket data provider is data $selectdata");
    //  DateProvider _dateprovider = Provider.of<DateProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(""),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "$selectdata".split(' ')[0],
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      onPressed: () => selectDate(context),
                      child: Text(
                        'Select date',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.greenAccent,
                    ),
                  ],
                ),
              ],
            ),
            Text("$apidata")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: getApiData,
        child: Icon(
          Icons.search,
        ),
      ),
    );
  }
}
