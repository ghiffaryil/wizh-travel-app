import 'package:flutter/material.dart';
import 'package:wizhapp/constant/navbar/navigation_bottom_bar.dart';
import 'package:wizhapp/presentation/home/widgets/featured_destination.dart';
import 'package:wizhapp/presentation/home/widgets/list_destination.dart';
import 'package:wizhapp/presentation/home/widgets/private_trip.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Wizh Travel App',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.37,
              child: Container(
                padding: EdgeInsets.all(10),
                child: FeaturedDestination(),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ListDestinationView(),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.004),
            SizedBox(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height * 0.2,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 71, 49, 6),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text(
                            'Want to Private Trip?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Let\'s Register Now!! ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: PrivateTripSection(),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenu(selectedIndex: 1),
    );
  }
}
