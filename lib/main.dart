import 'package:flutter/material.dart';
import 'package:wisata_codelab/info.dart';
import 'package:wisata_codelab/info_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Wisata Bandung'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: (context, constrains) {
          if (constrains.maxWidth <= 600) {
            return InfoList();
          } else if (constrains.maxWidth <= 1200) {
            return InfoGrid(gridCount: 4);
          } else {
            return InfoGrid(gridCount: 6);
          }
        },
      ),
    );
  }
}

class InfoGrid extends StatelessWidget {
  final int gridCount;
  InfoGrid({@required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          crossAxisCount: gridCount,
          childAspectRatio: 1,
        ),
        itemCount: infoDataList.length,
        itemBuilder: (context, index) {
          final InfoData place = infoDataList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return InfoPage(place: place);
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      'assets/images/${place.primaryImage}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Text(
                      place.name,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 8),
                    child: Text(place.location),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class InfoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: infoDataList.length,
      itemBuilder: (context, index) {
        final InfoData place = infoDataList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return InfoPage(place: place);
            }));
          },
          child: Card(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset('assets/images/${place.primaryImage}'),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          place.name,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(place.location),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
