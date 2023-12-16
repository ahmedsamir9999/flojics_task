import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, prov, child) {
          return prov.screens[prov.currentIndex];
        },
      ),
      bottomNavigationBar: Consumer<HomeProvider>(
        builder: (context, prov, child) {
          return BottomNavigationBar(
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: prov.currentIndex,
            onTap: (index) {
              prov.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.live_tv_outlined), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.airplane_ticket), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
            ],
          );
        },
      ),
    );
  }
}
