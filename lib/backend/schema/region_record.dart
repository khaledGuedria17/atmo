import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegionRecord extends FirestoreRecord {
  RegionRecord._(
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
      FirebaseFirestore.instance.collection('Region');

  static Stream<RegionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegionRecord.fromSnapshot(s));

  static Future<RegionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RegionRecord.fromSnapshot(s));

  static RegionRecord fromSnapshot(DocumentSnapshot snapshot) => RegionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegionRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegionRecordDocumentEquality implements Equality<RegionRecord> {
  const RegionRecordDocumentEquality();

  @override
  bool equals(RegionRecord? e1, RegionRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(RegionRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is RegionRecord;
}
