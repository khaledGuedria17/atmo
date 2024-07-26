import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

DocumentReference? getProjectTypeReference(String? ref) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String documentPath = "/ProjectType/" + "$ref";
  DocumentReference documentReference = firestore.doc(documentPath);
  return documentReference;
}

DocumentReference? getMethodologyReference(String? ref) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String documentPath = "/Methodology/" + "$ref";
  DocumentReference documentReference = firestore.doc(documentPath);
  return documentReference;
}

DocumentReference? getStatusReference(String? ref) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String documentPath = "/Status/" + "$ref";
  DocumentReference documentReference = firestore.doc(documentPath);
  return documentReference;
}

DocumentReference? getLocationReference(String? ref) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String documentPath = "/Location/" + "$ref";
  DocumentReference documentReference = firestore.doc(documentPath);
  return documentReference;
}

DocumentReference? getRegionReference(String? ref) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String documentPath = "/Region/" + "$ref";
  DocumentReference documentReference = firestore.doc(documentPath);
  return documentReference;
}

int? getAvailableACU(
  int? issued,
  int? retired,
) {
  return issued! - retired!;
}

double? getTotalFunction(
  double? cost,
  double? fees,
) {
  return cost! + fees!;
}

double? getCostFunction(
  double? amount,
  double? price,
) {
  return amount! * price!;
}

DocumentReference? getUserReference(String? ref) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String documentPath = "/User/" + "$ref";
  DocumentReference documentReference = firestore.doc(documentPath);
  return documentReference;
}

double? getFeesFunction(double? amount) {
  return amount! * 0.1;
}

List<DocumentReference> setDocumentsFunction(
  DocumentReference? doc1,
  DocumentReference? doc2,
  DocumentReference? doc3,
  DocumentReference? doc4,
) {
  return [doc1!, doc2!, doc3!, doc4!];
}
