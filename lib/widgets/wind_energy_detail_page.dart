import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WindEnergyDetailPage extends StatefulWidget {
  const WindEnergyDetailPage({Key? key}) : super(key: key);

  @override
  _WindEnergyDetailPageState createState() => _WindEnergyDetailPageState();
}

class _WindEnergyDetailPageState extends State<WindEnergyDetailPage> {
  int _current = 0;

  final List<String> images = [
    'images/wind_energy_windmill1.jpg',
    'images/wind_energy_windmill2.jpg',
    'images/wind_energy_windmill3.jpg',
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
        title: Text('Wind Energy'),
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
                    height: 300,
                    // aspectRatio: 16 / 4, // Adjust the aspect ratio as needed
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
                      'Wind energy is a renewable energy source derived from wind turbines. These turbines convert the kinetic energy of wind into mechanical power, which can then be converted into electricity through a generator. Wind energy is clean, sustainable, and emits no greenhouse gases or air pollutants during operation. It plays a crucial role in reducing reliance on fossil fuels and mitigating climate change.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Benefits of Wind Energy:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- Reduces greenhouse gas emissions',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Supports energy independence',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Creates jobs in manufacturing, installation, and maintenance',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Provides a sustainable source of electricity',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Importance of Wind Energy:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Wind energy contributes significantly to global efforts to combat climate change by providing a renewable alternative to fossil fuels. It helps diversify the energy mix, enhances energy security, and supports sustainable development goals. Additionally, wind farms often bring economic benefits to local communities through job creation and investments in infrastructure.',
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
