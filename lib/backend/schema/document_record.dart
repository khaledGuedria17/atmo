import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocumentRecord extends FirestoreRecord {
  DocumentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "uploadedBy" field.
  DocumentReference? _uploadedBy;
  DocumentReference? get uploadedBy => _uploadedBy;
  bool hasUploadedBy() => _uploadedBy != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _uploadedBy = snapshotData['uploadedBy'] as DocumentReference?;
    _link = snapshotData['link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Document');

  static Stream<DocumentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocumentRecord.fromSnapshot(s));

  static Future<DocumentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocumentRecord.fromSnapshot(s));

  static DocumentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DocumentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocumentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocumentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocumentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocumentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocumentRecordData({
  String? name,
  DateTime? createdAt,
  DocumentReference? uploadedBy,
  String? link,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'createdAt': createdAt,
      'uploadedBy': uploadedBy,
      'link': link,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocumentRecordDocumentEquality implements Equality<DocumentRecord> {
  const DocumentRecordDocumentEquality();

  @override
  bool equals(DocumentRecord? e1, DocumentRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.createdAt == e2?.createdAt &&
        e1?.uploadedBy == e2?.uploadedBy &&
        e1?.link == e2?.link;
  }

  @override
  int hash(DocumentRecord? e) => const ListEquality()
      .hash([e?.name, e?.createdAt, e?.uploadedBy, e?.link]);

  @override
  bool isValidKey(Object? o) => o is DocumentRecord;
}
