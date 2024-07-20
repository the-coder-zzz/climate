import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SolarPowerDetailPage extends StatefulWidget {
  const SolarPowerDetailPage({Key? key}) : super(key: key);

  @override
  _SolarPowerDetailPageState createState() => _SolarPowerDetailPageState();
}

class _SolarPowerDetailPageState extends State<SolarPowerDetailPage> {
  int _current = 0;

  final List<String> images = [
    'images/solar_power_panel3.jpg',
    'images/solar_power_panel1.jpg',
    'images/solar_power_panel2.jpg',
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
        title: Text('Solar Power'),
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
                      'Solar power is a renewable energy source that harnesses energy from the sun using photovoltaic cells to convert sunlight into electricity. It is a clean and sustainable alternative to fossil fuels, contributing to reduced greenhouse gas emissions and environmental impact. Solar power systems can be deployed at various scales, from individual households to large-scale power plants, promoting energy independence and resilience.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Benefits of Solar Power:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- Reduces carbon footprint and air pollution',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Lowers energy costs over the long term',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Promotes energy independence and security',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Creates jobs in manufacturing, installation, and maintenance of solar technologies',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Importance of Solar Power:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Solar power plays a crucial role in the transition to sustainable energy systems globally. By harnessing abundant sunlight, solar power contributes to mitigating climate change, enhancing energy security, and fostering economic growth. It supports the development of clean energy infrastructure and empowers communities to adopt environmentally friendly practices.',
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
