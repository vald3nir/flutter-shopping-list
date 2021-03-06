// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShoppingListController on ShoppingListControllerBase, Store {
  final _$shoppingListAtom =
      Atom(name: 'ShoppingListControllerBase.shoppingList');

  @override
  ObservableList<String> get shoppingList {
    _$shoppingListAtom.reportRead();
    return super.shoppingList;
  }

  @override
  set shoppingList(ObservableList<String> value) {
    _$shoppingListAtom.reportWrite(value, super.shoppingList, () {
      super.shoppingList = value;
    });
  }

  final _$ShoppingListControllerBaseActionController =
      ActionController(name: 'ShoppingListControllerBase');

  @override
  void addItem(String item) {
    final _$actionInfo = _$ShoppingListControllerBaseActionController
        .startAction(name: 'ShoppingListControllerBase.addItem');
    try {
      return super.addItem(item);
    } finally {
      _$ShoppingListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editItem(String item, int position) {
    final _$actionInfo = _$ShoppingListControllerBaseActionController
        .startAction(name: 'ShoppingListControllerBase.editItem');
    try {
      return super.editItem(item, position);
    } finally {
      _$ShoppingListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteItem(int position) {
    final _$actionInfo = _$ShoppingListControllerBaseActionController
        .startAction(name: 'ShoppingListControllerBase.deleteItem');
    try {
      return super.deleteItem(position);
    } finally {
      _$ShoppingListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
shoppingList: ${shoppingList}
    ''';
  }
}
