import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectRecord extends FirestoreRecord {
  ProjectRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "project_type" field.
  DocumentReference? _projectType;
  DocumentReference? get projectType => _projectType;
  bool hasProjectType() => _projectType != null;

  // "methodology" field.
  DocumentReference? _methodology;
  DocumentReference? get methodology => _methodology;
  bool hasMethodology() => _methodology != null;

  // "status" field.
  DocumentReference? _status;
  DocumentReference? get status => _status;
  bool hasStatus() => _status != null;

  // "location" field.
  DocumentReference? _location;
  DocumentReference? get location => _location;
  bool hasLocation() => _location != null;

  // "region" field.
  DocumentReference? _region;
  DocumentReference? get region => _region;
  bool hasRegion() => _region != null;

  // "crediting_start" field.
  DateTime? _creditingStart;
  DateTime? get creditingStart => _creditingStart;
  bool hasCreditingStart() => _creditingStart != null;

  // "crediting_end" field.
  DateTime? _creditingEnd;
  DateTime? get creditingEnd => _creditingEnd;
  bool hasCreditingEnd() => _creditingEnd != null;

  // "credeting_periods" field.
  List<DocumentReference>? _credetingPeriods;
  List<DocumentReference> get credetingPeriods => _credetingPeriods ?? const [];
  bool hasCredetingPeriods() => _credetingPeriods != null;

  // "documents" field.
  List<DocumentReference>? _documents;
  List<DocumentReference> get documents => _documents ?? const [];
  bool hasDocuments() => _documents != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "issuedACU" field.
  int? _issuedACU;
  int get issuedACU => _issuedACU ?? 0;
  bool hasIssuedACU() => _issuedACU != null;

  // "retiredACU" field.
  int? _retiredACU;
  int get retiredACU => _retiredACU ?? 0;
  bool hasRetiredACU() => _retiredACU != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "assessor" field.
  DocumentReference? _assessor;
  DocumentReference? get assessor => _assessor;
  bool hasAssessor() => _assessor != null;

  // "allTimeEstimatedACU" field.
  int? _allTimeEstimatedACU;
  int get allTimeEstimatedACU => _allTimeEstimatedACU ?? 0;
  bool hasAllTimeEstimatedACU() => _allTimeEstimatedACU != null;

  // "premiumPublish" field.
  bool? _premiumPublish;
  bool get premiumPublish => _premiumPublish ?? false;
  bool hasPremiumPublish() => _premiumPublish != null;

  // "isVerified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  bool hasIsVerified() => _isVerified != null;

  // "VERRA_ID" field.
  String? _verraId;
  String get verraId => _verraId ?? '';
  bool hasVerraId() => _verraId != null;

  // "petra_address" field.
  String? _petraAddress;
  String get petraAddress => _petraAddress ?? '';
  bool hasPetraAddress() => _petraAddress != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _projectType = snapshotData['project_type'] as DocumentReference?;
    _methodology = snapshotData['methodology'] as DocumentReference?;
    _status = snapshotData['status'] as DocumentReference?;
    _location = snapshotData['location'] as DocumentReference?;
    _region = snapshotData['region'] as DocumentReference?;
    _creditingStart = snapshotData['crediting_start'] as DateTime?;
    _creditingEnd = snapshotData['crediting_end'] as DateTime?;
    _credetingPeriods = getDataList(snapshotData['credeting_periods']);
    _documents = getDataList(snapshotData['documents']);
    _description = snapshotData['description'] as String?;
    _issuedACU = castToType<int>(snapshotData['issuedACU']);
    _retiredACU = castToType<int>(snapshotData['retiredACU']);
    _price = castToType<double>(snapshotData['price']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _assessor = snapshotData['assessor'] as DocumentReference?;
    _allTimeEstimatedACU = castToType<int>(snapshotData['allTimeEstimatedACU']);
    _premiumPublish = snapshotData['premiumPublish'] as bool?;
    _isVerified = snapshotData['isVerified'] as bool?;
    _verraId = snapshotData['VERRA_ID'] as String?;
    _petraAddress = snapshotData['petra_address'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Project');

  static Stream<ProjectRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectRecord.fromSnapshot(s));

  static Future<ProjectRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectRecord.fromSnapshot(s));

  static ProjectRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectRecordData({
  String? name,
  DocumentReference? projectType,
  DocumentReference? methodology,
  DocumentReference? status,
  DocumentReference? location,
  DocumentReference? region,
  DateTime? creditingStart,
  DateTime? creditingEnd,
  String? description,
  int? issuedACU,
  int? retiredACU,
  double? price,
  DocumentReference? createdBy,
  DocumentReference? assessor,
  int? allTimeEstimatedACU,
  bool? premiumPublish,
  bool? isVerified,
  String? verraId,
  String? petraAddress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'project_type': projectType,
      'methodology': methodology,
      'status': status,
      'location': location,
      'region': region,
      'crediting_start': creditingStart,
      'crediting_end': creditingEnd,
      'description': description,
      'issuedACU': issuedACU,
      'retiredACU': retiredACU,
      'price': price,
      'createdBy': createdBy,
      'assessor': assessor,
      'allTimeEstimatedACU': allTimeEstimatedACU,
      'premiumPublish': premiumPublish,
      'isVerified': isVerified,
      'VERRA_ID': verraId,
      'petra_address': petraAddress,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectRecordDocumentEquality implements Equality<ProjectRecord> {
  const ProjectRecordDocumentEquality();

  @override
  bool equals(ProjectRecord? e1, ProjectRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.projectType == e2?.projectType &&
        e1?.methodology == e2?.methodology &&
        e1?.status == e2?.status &&
        e1?.location == e2?.location &&
        e1?.region == e2?.region &&
        e1?.creditingStart == e2?.creditingStart &&
        e1?.creditingEnd == e2?.creditingEnd &&
        listEquality.equals(e1?.credetingPeriods, e2?.credetingPeriods) &&
        listEquality.equals(e1?.documents, e2?.documents) &&
        e1?.description == e2?.description &&
        e1?.issuedACU == e2?.issuedACU &&
        e1?.retiredACU == e2?.retiredACU &&
        e1?.price == e2?.price &&
        e1?.createdBy == e2?.createdBy &&
        e1?.assessor == e2?.assessor &&
        e1?.allTimeEstimatedACU == e2?.allTimeEstimatedACU &&
        e1?.premiumPublish == e2?.premiumPublish &&
        e1?.isVerified == e2?.isVerified &&
        e1?.verraId == e2?.verraId &&
        e1?.petraAddress == e2?.petraAddress;
  }

  @override
  int hash(ProjectRecord? e) => const ListEquality().hash([
        e?.name,
        e?.projectType,
        e?.methodology,
        e?.status,
        e?.location,
        e?.region,
        e?.creditingStart,
        e?.creditingEnd,
        e?.credetingPeriods,
        e?.documents,
        e?.description,
        e?.issuedACU,
        e?.retiredACU,
        e?.price,
        e?.createdBy,
        e?.assessor,
        e?.allTimeEstimatedACU,
        e?.premiumPublish,
        e?.isVerified,
        e?.verraId,
        e?.petraAddress
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectRecord;
}
