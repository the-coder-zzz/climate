import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ForestManagementDetailPage extends StatefulWidget {
  const ForestManagementDetailPage({Key? key}) : super(key: key);

  @override
  _ForestManagementDetailPageState createState() =>
      _ForestManagementDetailPageState();
}

class _ForestManagementDetailPageState
    extends State<ForestManagementDetailPage> {
  int _current = 0;

  final List<String> images = [
    'assets/images/reforestation_forest_management1.jpg',
    'assets/images/reforestation_forest_management3.jpg',
    'assets/images/reforestation_forest_management2.jpg',
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
        title: Text('Forest Management'),
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
                      'Forest management involves the sustainable management and conservation of forests to maintain their health, biodiversity, and productivity. It encompasses practices such as reforestation, forest protection, and ecosystem restoration.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Benefits of Forest Management:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- Conservation of biodiversity: Managed forests support diverse ecosystems and habitats for wildlife.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Carbon sequestration: Forests absorb and store carbon dioxide, helping mitigate climate change.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Sustainable resource utilization: Managed forests provide timber, fuelwood, and other forest products while ensuring their long-term availability.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Water resource management: Forests regulate water cycles, improve water quality, and reduce risks of floods and erosion.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Importance of Forest Management:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Effective forest management is crucial for biodiversity conservation, climate change adaptation, and sustainable development. It supports economic activities, provides ecosystem services, and enhances resilience to environmental challenges.',
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
