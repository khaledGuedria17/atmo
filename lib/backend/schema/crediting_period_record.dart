import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreditingPeriodRecord extends FirestoreRecord {
  CreditingPeriodRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "crediting_start" field.
  DateTime? _creditingStart;
  DateTime? get creditingStart => _creditingStart;
  bool hasCreditingStart() => _creditingStart != null;

  // "crediting_end" field.
  DateTime? _creditingEnd;
  DateTime? get creditingEnd => _creditingEnd;
  bool hasCreditingEnd() => _creditingEnd != null;

  // "ACU" field.
  int? _acu;
  int get acu => _acu ?? 0;
  bool hasAcu() => _acu != null;

  void _initializeFields() {
    _creditingStart = snapshotData['crediting_start'] as DateTime?;
    _creditingEnd = snapshotData['crediting_end'] as DateTime?;
    _acu = castToType<int>(snapshotData['ACU']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CreditingPeriod');

  static Stream<CreditingPeriodRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CreditingPeriodRecord.fromSnapshot(s));

  static Future<CreditingPeriodRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CreditingPeriodRecord.fromSnapshot(s));

  static CreditingPeriodRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CreditingPeriodRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CreditingPeriodRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CreditingPeriodRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CreditingPeriodRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CreditingPeriodRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCreditingPeriodRecordData({
  DateTime? creditingStart,
  DateTime? creditingEnd,
  int? acu,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'crediting_start': creditingStart,
      'crediting_end': creditingEnd,
      'ACU': acu,
    }.withoutNulls,
  );

  return firestoreData;
}

class CreditingPeriodRecordDocumentEquality
    implements Equality<CreditingPeriodRecord> {
  const CreditingPeriodRecordDocumentEquality();

  @override
  bool equals(CreditingPeriodRecord? e1, CreditingPeriodRecord? e2) {
    return e1?.creditingStart == e2?.creditingStart &&
        e1?.creditingEnd == e2?.creditingEnd &&
        e1?.acu == e2?.acu;
  }

  @override
  int hash(CreditingPeriodRecord? e) =>
      const ListEquality().hash([e?.creditingStart, e?.creditingEnd, e?.acu]);

  @override
  bool isValidKey(Object? o) => o is CreditingPeriodRecord;
}
