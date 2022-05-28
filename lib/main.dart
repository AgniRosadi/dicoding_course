import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/router/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: AppRoute.rMain,
      theme: ThemeData(
          primaryTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black,
            displayColor: Colors.black,
          )),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<dynamic> listData = [];

  @override
  void initState() {
    getDataJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const Text(
                  "Restaurants",
                  style: TextStyle(fontSize: 18),
                  textScaleFactor: 1,
                ),
              const Text(
                "Recommendation restaurant for you!",
                style: TextStyle(fontSize: 12),
                textScaleFactor: 1,
              ),
              for (var item in listData)
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.rDetail, arguments: item);
                },
                child: Card(
                  child: ListTile(
                    leading: SizedBox(
                        width: 100,
                        child: Image.network(item['pictureId'])),
                    title: Text(item['name']),
                    subtitle:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.location_on, size: 15),
                                Text(item['city']),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.star, size: 15),
                                Text(item['rating'].toString()),
                              ],
                            ),
                          ],
                        ),
                    isThreeLine: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> getDataJson() async {
    final String response =
    await rootBundle.loadString('assets/restaurants.json');
    final data = await json.decode(response);
    listData.addAll(data['restaurants']);
    print(listData);
  }
}
