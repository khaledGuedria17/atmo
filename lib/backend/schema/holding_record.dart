import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HoldingRecord extends FirestoreRecord {
  HoldingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "project" field.
  DocumentReference? _project;
  DocumentReference? get project => _project;
  bool hasProject() => _project != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _project = snapshotData['project'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Holding');

  static Stream<HoldingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HoldingRecord.fromSnapshot(s));

  static Future<HoldingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HoldingRecord.fromSnapshot(s));

  static HoldingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HoldingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HoldingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HoldingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HoldingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HoldingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHoldingRecordData({
  DocumentReference? project,
  DocumentReference? user,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'project': project,
      'user': user,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class HoldingRecordDocumentEquality implements Equality<HoldingRecord> {
  const HoldingRecordDocumentEquality();

  @override
  bool equals(HoldingRecord? e1, HoldingRecord? e2) {
    return e1?.project == e2?.project &&
        e1?.user == e2?.user &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(HoldingRecord? e) =>
      const ListEquality().hash([e?.project, e?.user, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is HoldingRecord;
}
