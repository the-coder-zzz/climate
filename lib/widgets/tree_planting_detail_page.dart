import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TreePlantingDetailPage extends StatefulWidget {
  const TreePlantingDetailPage({Key? key}) : super(key: key);

  @override
  _TreePlantingDetailPageState createState() => _TreePlantingDetailPageState();
}

class _TreePlantingDetailPageState extends State<TreePlantingDetailPage> {
  int _current = 0;

  final List<String> images = [
    'assets/images/reforestation_tree_planting1.jpg',
    'assets/images/reforestation_tree_planting2.jpg',
    'assets/images/reforestation_tree_planting3.jpg',
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
        title: Text('Tree Planting'),
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
                      'Tree planting is the process of transplanting tree seedlings, generally for forestry, land reclamation, or landscaping purposes. It involves planting young trees in prepared holes or pits, often accompanied by soil amendments and proper care to ensure their survival and growth.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Benefits of Tree Planting:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- Carbon sequestration: Trees absorb carbon dioxide and release oxygen, helping mitigate climate change.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Biodiversity conservation: Forests and tree plantings provide habitats for wildlife and promote biodiversity.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Soil and water conservation: Tree roots stabilize soil, prevent erosion, and improve water quality.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Economic benefits: Tree plantings can provide sustainable timber and non-timber forest products, supporting local economies.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Importance of Tree Planting:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Tree planting is essential for combating deforestation, enhancing landscape aesthetics, improving air quality, and fostering community engagement in environmental stewardship.',
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
