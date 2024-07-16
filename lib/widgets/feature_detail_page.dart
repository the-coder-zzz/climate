import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FeatureDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final List<String> images;

  const FeatureDetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.images,
  }) : super(key: key);

  @override
  _FeatureDetailPageState createState() => _FeatureDetailPageState();
}

class _FeatureDetailPageState extends State<FeatureDetailPage> {
  int _current = 0;

  List<Widget> generateImageTiles() {
    return widget.images
        .map((element) => ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                element,
                fit: BoxFit.cover,
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 20),
              child: Stack(
                children: [
                  CarouselSlider(
                    items: generateImageTiles(),
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.images.map((url) {
                        int index = widget.images.indexOf(url);
                        return Container(
                          color: Colors.white,
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.description,
                style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
