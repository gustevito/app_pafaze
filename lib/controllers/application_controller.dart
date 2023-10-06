import 'package:get/get.dart';

class ApplicationController extends GetxController {
  late PageOptions selectedPage;

  setPageSelected(PageOptions selectedPageItem) {
    selectedPage = selectedPageItem;
  }

  getPageSelected() {
    return selectedPage;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

enum PageOptions {
  pgNotes,
  pgQuickNotes,
  pgChecklist,
}
