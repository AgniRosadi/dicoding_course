import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _DetailContent(),
    );
  }
}

class _DetailContent extends StatefulWidget {
  const _DetailContent({Key? key}) : super(key: key);

  @override
  State<_DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<_DetailContent> {
  List<dynamic> details = [];
  List<dynamic> foods = [];
  List<dynamic> drinks = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var args = ModalRoute.of(context)!.settings.arguments;
      args as Map<String, dynamic>;
      if (args.isNotEmpty) {
        var menu = args['menus'];
        menu as Map<String, dynamic>;
        if (menu.isNotEmpty) {
          var i = await menu['foods'];
          var e = await menu['drinks'];
          setState(() {
            getData(args, i, e);
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var item in details)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    item['pictureId'],
                    fit: BoxFit.cover,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: Text(
                      "Restaurant 1",
                      style: TextStyle(fontSize: 18),
                      textScaleFactor: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on, size: 15),
                        Text(
                          item['city'],
                          style: TextStyle(fontSize: 12),
                          textScaleFactor: 1,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Description",
                      style: TextStyle(fontSize: 15),
                      textScaleFactor: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Text(
                      item['description'],
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.start,
                      textScaleFactor: 1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Menus",
                      style: TextStyle(fontSize: 15),
                      textScaleFactor: 1,
                    ),
                  ),
                ],
              ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Foods",
                style: TextStyle(fontSize: 12),
                textScaleFactor: 1,
              ),
            ),
            SizedBox(
              height: 200,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 3),
                children: [
                  for (var rows in foods)
                    Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              rows['name'],
                              style: TextStyle(fontSize: 12),
                              textScaleFactor: 1,
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Drinks",
                style: TextStyle(fontSize: 12),
                textScaleFactor: 1,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height /2 ,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 3),
                children: [
                  for (var rows in drinks)
                    Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              rows['name'],
                              style: TextStyle(fontSize: 12),
                              textScaleFactor: 1,
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getData(dynamic detail, dynamic i, dynamic e) async {
    details.add(detail);
    foods = i;
    drinks = e;
  }
}
