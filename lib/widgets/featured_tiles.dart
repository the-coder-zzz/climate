import 'package:flutter/material.dart';
import 'wind_energy_detail_page.dart';
import 'solar_power_detail_page.dart';
import 'green_building_detail_page.dart';
import 'biodegradable_packaging_detail_page.dart';
import 'led_lighting_detail_page.dart';
import 'electric_vehicles_detail_page.dart';
import 'forest_management_detail_page.dart';
import 'tree_planting_detail_page.dart';

class FeaturedTiles extends StatelessWidget {
  FeaturedTiles({
    Key? key,
    required this.screenSize,
    required this.selectedFeature,
    required void Function(String feature) onFeatureSelected,
  }) : super(key: key);

  final Size screenSize;
  final String selectedFeature;

  final Map<String, List<String>> featureAssets = {
    'Renewable Energy': ['images/windmill.png', 'images/solar_panel.png'],
    'Sustainable Practices': [
      'images/green_building.png',
      'images/packaging.png'
    ],
    'Energy Efficiency': [
      'images/led_lighting.png',
      'images/electric_vehicle.png'
    ],
    'Reforestation': ['images/reforestation.png', 'images/afforestation.png'],
  };

  final Map<String, List<String>> featureTitles = {
    'Renewable Energy': ['Wind Energy', 'Solar Power'],
    'Sustainable Practices': ['Green Building', 'Biodegradable Packaging'],
    'Energy Efficiency': ['LED Lighting', 'Electric Vehicles'],
    'Reforestation': ['Forest Management', 'Tree Planting'],
  };

  @override
  Widget build(BuildContext context) {
    final assets =
        featureAssets[selectedFeature] ?? ['assets/images/default.jpg'];
    final titles = featureTitles[selectedFeature] ?? ['Default Title'];

    return screenSize.width < 800
        ? Padding(
            padding: EdgeInsets.only(top: screenSize.height / 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: screenSize.width / 15,
                  ),
                  ...Iterable<int>.generate(assets.length)
                      .map((int pageIndex) => Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Widget detailPage;
                                      if (titles[pageIndex] == 'Wind Energy') {
                                        detailPage = WindEnergyDetailPage();
                                      } else if (titles[pageIndex] ==
                                          'Solar Power') {
                                        detailPage = SolarPowerDetailPage();
                                      } else if (titles[pageIndex] ==
                                          'Green Building') {
                                        detailPage = GreenBuildingDetailPage();
                                      } else if (titles[pageIndex] ==
                                          'Biodegradable Packaging') {
                                        detailPage =
                                            BiodegradablePackagingDetailPage();
                                      } else if (titles[pageIndex] ==
                                          'LED Lighting') {
                                        detailPage = LEDLightingDetailPage();
                                      } else if (titles[pageIndex] ==
                                          'Electric Vehicles') {
                                        detailPage =
                                            ElectricVehiclesDetailPage();
                                      } else if (titles[pageIndex] ==
                                          'Forest Management') {
                                        detailPage =
                                            ForestManagementDetailPage();
                                      } else if (titles[pageIndex] ==
                                          'Tree Planting') {
                                        detailPage = TreePlantingDetailPage();
                                      } else {
                                        detailPage =
                                            Placeholder(); // Default placeholder
                                      }

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => detailPage,
                                        ),
                                      );
                                    },
                                    child: SizedBox(
                                      height: screenSize.width / 2.5,
                                      width: screenSize.width / 1.5,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: Image.asset(
                                          assets[pageIndex],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screenSize.height / 70),
                                    child: Text(
                                      titles[pageIndex],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: screenSize.width / 15,
                              )
                            ],
                          ))
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.06,
              left: screenSize.width / 15,
              right: screenSize.width / 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...Iterable<int>.generate(assets.length).map(
                  (int pageIndex) => Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Widget detailPage;
                          if (titles[pageIndex] == 'Wind Energy') {
                            detailPage = WindEnergyDetailPage();
                          } else if (titles[pageIndex] == 'Solar Power') {
                            detailPage = SolarPowerDetailPage();
                          } else if (titles[pageIndex] == 'Green Building') {
                            detailPage = GreenBuildingDetailPage();
                          } else if (titles[pageIndex] ==
                              'Biodegradable Packaging') {
                            detailPage = BiodegradablePackagingDetailPage();
                          } else if (titles[pageIndex] == 'LED Lighting') {
                            detailPage = LEDLightingDetailPage();
                          } else if (titles[pageIndex] == 'Electric Vehicles') {
                            detailPage = ElectricVehiclesDetailPage();
                          } else if (titles[pageIndex] == 'Forest Management') {
                            detailPage = ForestManagementDetailPage();
                          } else if (titles[pageIndex] == 'Tree Planting') {
                            detailPage = TreePlantingDetailPage();
                          } else {
                            detailPage = Placeholder(); // Default placeholder
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => detailPage,
                            ),
                          );
                        },
                        child: SizedBox(
                          height: screenSize.width / 6,
                          width: screenSize.width / 3.8,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    assets[pageIndex],
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                    color: Colors.grey.withOpacity(0.3),
                                  )
                                ]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenSize.height / 70,
                        ),
                        child: Text(
                          titles[pageIndex],
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
