import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LEDLightingDetailPage extends StatefulWidget {
  const LEDLightingDetailPage({Key? key}) : super(key: key);

  @override
  _LEDLightingDetailPageState createState() => _LEDLightingDetailPageState();
}

class _LEDLightingDetailPageState extends State<LEDLightingDetailPage> {
  int _current = 0;

  final List<String> images = [
    'assets/images/energy_led_light1.jpg',
    'assets/images/energy_led_light2.jpg',
    'assets/images/energy_led_light3.jpg',
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
        title: Text('LED Lighting'),
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
                      'LED lighting refers to light-emitting diode technology, which is highly energy-efficient and environmentally friendly. LEDs produce light by passing an electric current through a semiconductor material, resulting in minimal heat generation and maximum energy conversion into visible light. This technology has revolutionized lighting solutions across various sectors, offering numerous benefits over traditional incandescent and fluorescent lights.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Benefits of LED Lighting:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- Energy efficiency: LED bulbs consume significantly less energy than traditional lighting options, reducing electricity bills and carbon emissions.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Long lifespan: LEDs have a longer operational life, requiring less frequent replacement and reducing waste.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Durability: LED lights are resistant to shock, vibrations, and external impacts, making them ideal for various environments.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Instant illumination: LEDs reach full brightness instantly without flickering, providing immediate light output.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Importance of LED Lighting:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'LED lighting plays a crucial role in energy conservation efforts, promoting sustainable development, and reducing environmental impact. By adopting LED technology, businesses and households can contribute to global initiatives for energy efficiency and climate change mitigation. LED lighting also enhances safety, productivity, and well-being in indoor and outdoor spaces.',
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
