import 'package:flutter/material.dart';
import 'package:wizhapp/presentation/home/home.dart';

class BottomMenu extends StatefulWidget {
  final int selectedIndex;

  const BottomMenu({super.key, this.selectedIndex = 0});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  late int currentIndex;

  final List<Widget> pages = [const HomePage(), const HomePage()];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex;
  }

  void onTabTapped(int index) {
    if (currentIndex == index) return;
    setState(() {
      currentIndex = index;
    });
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => pages[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 9),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 2,
        items: [
          _buildBottomNavigationBarItem(
            icon: const Icon(size: 25, Icons.map_outlined, color: Colors.blue),
            label: 'My Trip',
            isSelected: currentIndex == 0,
          ),

          _buildBottomNavigationBarItem(
            icon: const Icon(size: 25, Icons.home_outlined, color: Colors.blue),
            label: 'Home',
            isSelected: currentIndex == 1,
          ),

          _buildBottomNavigationBarItem(
            icon: const Icon(
              size: 25,
              Icons.account_circle_outlined,
              color: Colors.blue,
            ),
            label: 'Account',
            isSelected: currentIndex == 2,
          ),
        ],
        onTap: onTabTapped,
        currentIndex: currentIndex,

        selectedLabelStyle: TextStyle(fontSize: 0),
        unselectedLabelStyle: TextStyle(fontSize: 0),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required Widget icon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            icon,
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.blue,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      label: '',
    );
  }
}
