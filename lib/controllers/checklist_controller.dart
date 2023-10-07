import 'package:get/get.dart';
import 'package:myapp/models/checklist_model.dart';

class ChecklistController extends GetxController {
  late List<ChecklistModel> listChecklistModel;

  // todo
  addIntoList(ChecklistModel checklistModel) {
    //
    listChecklistModel.add(checklistModel);
  }

  // todo
  removeFromList(int id) {
    // Encontrar o item ID na lista e remover
  }

  setChecked(ChecklistModel checklistModel) {
    int index = 0;
    for (var element in listChecklistModel) {
      if (checklistModel.id == element.id) {
        listChecklistModel[index].checked = checklistModel.checked;
      }
      ++index;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listChecklistModel = [];
  }
}
