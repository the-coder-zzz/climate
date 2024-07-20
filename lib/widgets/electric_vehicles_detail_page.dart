import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ElectricVehiclesDetailPage extends StatefulWidget {
  const ElectricVehiclesDetailPage({Key? key}) : super(key: key);

  @override
  _ElectricVehiclesDetailPageState createState() =>
      _ElectricVehiclesDetailPageState();
}

class _ElectricVehiclesDetailPageState
    extends State<ElectricVehiclesDetailPage> {
  int _current = 0;

  final List<String> images = [
    'assets/images/energy_electric_vehicle1.jpg',
    'assets/images/energy_electric_vehicle2.jpg',
    'assets/images/energy_electric_vehicle3.jpg',
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
        title: Text('Electric Vehicles'),
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
                      'Electric vehicles (EVs) are automobiles powered by electric motors using energy stored in rechargeable batteries. Unlike conventional vehicles that rely on internal combustion engines burning fossil fuels, EVs produce zero tailpipe emissions. This technology represents a significant advancement in transportation, offering numerous environmental, economic, and social benefits.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Benefits of Electric Vehicles:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- Environmental sustainability: EVs reduce greenhouse gas emissions and air pollution, improving air quality and public health.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Energy efficiency: EVs are more efficient than internal combustion engine vehicles, converting a higher percentage of energy from the grid to power the vehicle.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Cost savings: EVs have lower fuel and maintenance costs over their lifetime, offering potential savings for consumers and businesses.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '- Energy independence: EVs reduce dependence on imported oil and promote the use of renewable energy sources.',
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Importance of Electric Vehicles:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Electric vehicles play a critical role in sustainable transportation solutions, supporting global efforts to combat climate change and achieve carbon neutrality. By transitioning to EVs, societies can reduce reliance on fossil fuels, enhance energy security, and foster innovation in clean technologies. EV adoption also stimulates economic growth, creates jobs in manufacturing and infrastructure development, and promotes a cleaner, healthier future for generations to come.',
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
