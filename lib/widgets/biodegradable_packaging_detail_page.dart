import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BiodegradablePackagingDetailPage extends StatefulWidget {
  const BiodegradablePackagingDetailPage({Key? key}) : super(key: key);

  @override
  _BiodegradablePackagingDetailPageState createState() =>
      _BiodegradablePackagingDetailPageState();
}

class _BiodegradablePackagingDetailPageState
    extends State<BiodegradablePackagingDetailPage> {
  int _current = 0;

  final List<String> images = [
    'images/sustainable_biodegradable_packaging1.jpg',
    'images/sustainable_biodegradable_packaging2.jpg',
    'images/sustainable_biodegradable_packaging3.jpg',
  ];

  List<Widget> generateImageTiles() {
    return images
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
        title: Text('Biodegradable Packaging'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white, // Set white background
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: CarouselSlider(
                  items: generateImageTiles(),
                  options: CarouselOptions(
                    // height: 200,
                    aspectRatio: 16 / 4, // Adjust the aspect ratio as needed
                    viewportFraction: 0.5,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Biodegradable packaging refers to materials that can break down naturally in the environment. These materials are designed to decompose through biological processes, such as the action of microorganisms, into natural substances like water, carbon dioxide, and biomass. Unlike traditional plastic packaging, biodegradable packaging offers a more sustainable alternative by reducing waste and minimizing environmental impact.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Benefits of Biodegradable Packaging:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- Reduces plastic pollution in landfills and oceans',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Minimizes environmental footprint and carbon emissions',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Supports a circular economy and sustainable waste management',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Importance of Biodegradable Packaging:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Biodegradable packaging plays a crucial role in reducing the environmental impact of packaging waste. By promoting materials that can naturally degrade over time, it helps preserve ecosystems, conserve resources, and mitigate climate change. Embracing biodegradable packaging supports sustainable consumption and production patterns, aligning with global efforts to achieve a more environmentally friendly future.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    // Add more specific benefits or information as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
