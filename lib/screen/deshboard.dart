import 'package:arkroot_technologies_apod_app/model/api_data.dart';
import 'package:arkroot_technologies_apod_app/provider/date_provider.dart';
import 'package:arkroot_technologies_apod_app/services/http_services.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  ApiData apidata;
  String selectndata = DateTime.now().toString().split(' ')[0];
  bool _isloading = false;

  HttpServices http = HttpServices();
  Future getApiData() async {
    Response response;
    try {
      _isloading = true;
      response = await http.getRequest(
          "https://api.nasa.gov/planetary/apod?api_key=aWPhODExHc5j48m59viPzCysv1jkoaN7ID2dchPw&date=$selectndata");
      await Future.delayed(Duration(seconds: 2));
      _isloading = false;
      if (response.statusCode == 200) {
        setState(() {
          print(response.data);
          apidata = ApiData.fromJson(response.data);
        });
      } else {
        _isloading = false;

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
    this.selectndata = _dateprovider.selectdata;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: MediaQuery.of(context).size.width > 400
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FittedBox(child: Text("Selected Date : ")),
                        Text(
                          "$selectndata".split(' ')[0],
                          style: MediaQuery.of(context).size.width < 500
                              ? TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)
                              : TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RaisedButton(
                          onPressed: () => _dateprovider.selectDate(context),
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
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FittedBox(child: Text("Selected Date : ")),
                        Text(
                          "$selectndata".split(' ')[0],
                          style: MediaQuery.of(context).size.width < 500
                              ? TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)
                              : TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RaisedButton(
                          onPressed: () => _dateprovider.selectDate(context),
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
            ),
            _isloading
                ? Center(child: CircularProgressIndicator())
                : apidata == null
                    ? Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: Container(
                          child: ListView(
                            padding: const EdgeInsets.all(20),
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${apidata.title}",
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: MediaQuery.of(context).size.width <
                                              500
                                          ? TextStyle(fontSize: 18)
                                          : TextStyle(fontSize: 25),
                                    ),
                                  ),
                                  Text(" ( ${apidata.date} )",
                                      style: TextStyle(fontSize: 20)),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      apidata.url == null ? "" : apidata.url,
                                      height: 200,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(apidata.explanation)
                            ],
                          ),
                        ),
                      ),
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
