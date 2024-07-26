import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MethodologyRecord extends FirestoreRecord {
  MethodologyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Methodology');

  static Stream<MethodologyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MethodologyRecord.fromSnapshot(s));

  static Future<MethodologyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MethodologyRecord.fromSnapshot(s));

  static MethodologyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MethodologyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MethodologyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MethodologyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MethodologyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MethodologyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMethodologyRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class MethodologyRecordDocumentEquality implements Equality<MethodologyRecord> {
  const MethodologyRecordDocumentEquality();

  @override
  bool equals(MethodologyRecord? e1, MethodologyRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(MethodologyRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is MethodologyRecord;
}
