import 'package:flutter/cupertino.dart';

import '../screens/movie_screen.dart';
import '../screens/save_screen.dart';
import '../screens/take_screen.dart';

class HomeProvider extends ChangeNotifier {
  int currentIndex = 0;
  final pageController = PageController();

  List<Widget> screens = [
    const MovieScreen(),
    const TakeScreen(),
    const SaveScreen(),
  ];

  changeIndex(index) {
    currentIndex = index;
    notifyListeners();
  }

  changePage(page) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }
}
