import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _selected = false;
  bool get selected => _selected;
  set selected(bool value) {
    _selected = value;
  }

  List<DocumentReference> _projectList = [];
  List<DocumentReference> get projectList => _projectList;
  set projectList(List<DocumentReference> value) {
    _projectList = value;
  }

  void addToProjectList(DocumentReference value) {
    projectList.add(value);
  }

  void removeFromProjectList(DocumentReference value) {
    projectList.remove(value);
  }

  void removeAtIndexFromProjectList(int index) {
    projectList.removeAt(index);
  }

  void updateProjectListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    projectList[index] = updateFn(_projectList[index]);
  }

  void insertAtIndexInProjectList(int index, DocumentReference value) {
    projectList.insert(index, value);
  }
}
