import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SideDrawerProvider extends ChangeNotifier {
  bool isExpanded = false;
  int selectedIndex = 1;

  bool get _isExpanded => isExpanded;

  int get _selectedIndex => selectedIndex;
  GlobalKey homeKey = GlobalKey();
  GlobalKey skillKey = GlobalKey();
  GlobalKey projectKey = GlobalKey();
  GlobalKey aiKey = GlobalKey();
  GlobalKey feedbackKey = GlobalKey();
  ScrollController scrollController = ScrollController();

  ScrollController get _scrollController => scrollController;

  void onIconPress(int index) {
    selectedIndex = index;
    notifyListeners();
    switch (index) {
      case 1:
        scrollTo(homeKey);
        break;
      case 2:
        scrollTo(projectKey);
        break;
      case 3:
        scrollTo(skillKey);
        break;
      case 4:
        scrollTo(feedbackKey);
        break;

    }
  }

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
        key.currentContext!, duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }

  void onToggleIcon() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}
