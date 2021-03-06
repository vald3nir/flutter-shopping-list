import 'package:mobx/mobx.dart';

part 'shopping_list_controller.g.dart';

class ShoppingListController = ShoppingListControllerBase
    with _$ShoppingListController;

abstract class ShoppingListControllerBase with Store {
  @observable
  ObservableList<String> shoppingList = ObservableList.of([
    "Sabão",
    "Café",
    "Leite",
  ]);

  @action
  void addItem(String item) {
    shoppingList.add(item);
  }

  int getSize() {
    return shoppingList.toList().length;
  }

  String getItem(int position) {
    return shoppingList.toList()[position];
  }

  @action
  void editItem(String item, int position) {
    shoppingList[position] = item;
  }

  @action
  void deleteItem(int position) {
    shoppingList.removeAt(position);
  }
}
