import 'package:flutter/material.dart';
import 'package:wisata_codelab/info_data.dart';

class InfoPage extends StatelessWidget {
  final InfoData place;
  InfoPage({@required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 800) {
        return MobileInfoPage(place: place);
      } else {
        return WebInfoPage(place: place);
      }
    });
  }
}

class MobileInfoPage extends StatelessWidget {
  final InfoData place;
  MobileInfoPage({@required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image and Buttons
            Stack(
              children: <Widget>[
                Image.asset('assets/images/${place.primaryImage}'),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          child: FavoriteButton(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Judul
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),

            // Infos with Icons
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(height: 8.0),
                      Text(
                        place.day,
                        style: TextStyle(fontFamily: 'Oxygen'),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      SizedBox(height: 8.0),
                      Text(
                        place.openHours,
                        style: TextStyle(fontFamily: 'Oxygen'),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(height: 8.0),
                      Text(
                        place.price,
                        style: TextStyle(fontFamily: 'Oxygen'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Deskripsi
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                place.desc,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontFamily: 'Oxygen'),
              ),
            ),

            // Images
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(4.0),
                itemCount: place.imageURLs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(place.imageURLs[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WebInfoPage extends StatefulWidget {
  final InfoData place;

  WebInfoPage({@required this.place});

  @override
  _WebInfoPageState createState() => _WebInfoPageState();
}

class _WebInfoPageState extends State<WebInfoPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
        child: Center(
          child: Container(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Judul
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'WISATA BANDUNG',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontFamily: 'Staatliches',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, right: 20.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          // Cover Image and List of Images
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                                'assets/images/${widget.place.primaryImage}'),
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            height: 150,
                            child: Scrollbar(
                              isAlwaysShown: true,
                              controller: _scrollController,
                              child: ListView.builder(
                                controller: _scrollController,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.only(bottom: 16.0),
                                itemCount: widget.place.imageURLs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                          widget.place.imageURLs[index]),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              // Infos with Icons
                              Text(
                                widget.place.name,
                                style: TextStyle(
                                  fontSize: 32.0,
                                  fontFamily: 'Staatliches',
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.calendar_today),
                                      SizedBox(width: 8.0),
                                      Text(
                                        widget.place.day,
                                        style: TextStyle(fontFamily: 'Oxygen'),
                                      ),
                                    ],
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: FavoriteButton(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.access_time),
                                  SizedBox(width: 8.0),
                                  Text(
                                    widget.place.openHours,
                                    style: TextStyle(fontFamily: 'Oxygen'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.monetization_on),
                                  SizedBox(width: 8.0),
                                  Text(
                                    widget.place.price,
                                    style: TextStyle(fontFamily: 'Oxygen'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),

                              // Deskripsi
                              Text(
                                widget.place.desc,
                                style: TextStyle(
                                    fontSize: 16.0, fontFamily: 'Oxygen'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isLiked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isLiked ? Icons.favorite : Icons.favorite_border,
        color: Colors.white,
      ),
      onPressed: () => setState(() => _isLiked = !_isLiked),
    );
  }
}
