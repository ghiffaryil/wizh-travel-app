import 'package:flutter/material.dart';
import 'package:wizhapp/constant/component/navbar/navigation_bottom_bar.dart';
import 'package:wizhapp/presentation/home/widgets/featured/featured_destination.dart';
import 'package:wizhapp/presentation/home/widgets/main_list/list_destination.dart';
import 'package:wizhapp/presentation/home/widgets/private_trip/private_trip.dart';

class HomePage extends StatefulWidget {
  final int index;
  const HomePage({super.key, required this.index});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          'Wizh Travel App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.notifications_none_outlined, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.chat_bubble_outline, color: Colors.white),
          SizedBox(width: 10),
        ],
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FeaturedDestinationSection(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ListDestinationSection(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.004),
            PrivateTripSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenu(selectedIndex: selectedIndex),
    );
  }
}
