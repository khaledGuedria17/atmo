import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectTypeRecord extends FirestoreRecord {
  ProjectTypeRecord._(
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
      FirebaseFirestore.instance.collection('ProjectType');

  static Stream<ProjectTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectTypeRecord.fromSnapshot(s));

  static Future<ProjectTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectTypeRecord.fromSnapshot(s));

  static ProjectTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectTypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectTypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectTypeRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectTypeRecordDocumentEquality implements Equality<ProjectTypeRecord> {
  const ProjectTypeRecordDocumentEquality();

  @override
  bool equals(ProjectTypeRecord? e1, ProjectTypeRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(ProjectTypeRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is ProjectTypeRecord;
}
