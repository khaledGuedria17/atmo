import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KycRecord extends FirestoreRecord {
  KycRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "isValidated" field.
  bool? _isValidated;
  bool get isValidated => _isValidated ?? false;
  bool hasIsValidated() => _isValidated != null;

  // "Fullname" field.
  String? _fullname;
  String get fullname => _fullname ?? '';
  bool hasFullname() => _fullname != null;

  // "DocumentNumber" field.
  int? _documentNumber;
  int get documentNumber => _documentNumber ?? 0;
  bool hasDocumentNumber() => _documentNumber != null;

  // "Companyname" field.
  String? _companyname;
  String get companyname => _companyname ?? '';
  bool hasCompanyname() => _companyname != null;

  // "LegalForm" field.
  int? _legalForm;
  int get legalForm => _legalForm ?? 0;
  bool hasLegalForm() => _legalForm != null;

  // "RegistrationNumber" field.
  int? _registrationNumber;
  int get registrationNumber => _registrationNumber ?? 0;
  bool hasRegistrationNumber() => _registrationNumber != null;

  // "IncorporationDate" field.
  int? _incorporationDate;
  int get incorporationDate => _incorporationDate ?? 0;
  bool hasIncorporationDate() => _incorporationDate != null;

  // "RegisteredAddress" field.
  String? _registeredAddress;
  String get registeredAddress => _registeredAddress ?? '';
  bool hasRegisteredAddress() => _registeredAddress != null;

  // "TaxIdentificationNumber" field.
  int? _taxIdentificationNumber;
  int get taxIdentificationNumber => _taxIdentificationNumber ?? 0;
  bool hasTaxIdentificationNumber() => _taxIdentificationNumber != null;

  // "CertificateofIncorporation" field.
  String? _certificateofIncorporation;
  String get certificateofIncorporation => _certificateofIncorporation ?? '';
  bool hasCertificateofIncorporation() => _certificateofIncorporation != null;

  // "PassportFront" field.
  String? _passportFront;
  String get passportFront => _passportFront ?? '';
  bool hasPassportFront() => _passportFront != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  void _initializeFields() {
    _isValidated = snapshotData['isValidated'] as bool?;
    _fullname = snapshotData['Fullname'] as String?;
    _documentNumber = castToType<int>(snapshotData['DocumentNumber']);
    _companyname = snapshotData['Companyname'] as String?;
    _legalForm = castToType<int>(snapshotData['LegalForm']);
    _registrationNumber = castToType<int>(snapshotData['RegistrationNumber']);
    _incorporationDate = castToType<int>(snapshotData['IncorporationDate']);
    _registeredAddress = snapshotData['RegisteredAddress'] as String?;
    _taxIdentificationNumber =
        castToType<int>(snapshotData['TaxIdentificationNumber']);
    _certificateofIncorporation =
        snapshotData['CertificateofIncorporation'] as String?;
    _passportFront = snapshotData['PassportFront'] as String?;
    _country = snapshotData['country'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('KYC');

  static Stream<KycRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KycRecord.fromSnapshot(s));

  static Future<KycRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KycRecord.fromSnapshot(s));

  static KycRecord fromSnapshot(DocumentSnapshot snapshot) => KycRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KycRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KycRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KycRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KycRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKycRecordData({
  bool? isValidated,
  String? fullname,
  int? documentNumber,
  String? companyname,
  int? legalForm,
  int? registrationNumber,
  int? incorporationDate,
  String? registeredAddress,
  int? taxIdentificationNumber,
  String? certificateofIncorporation,
  String? passportFront,
  String? country,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isValidated': isValidated,
      'Fullname': fullname,
      'DocumentNumber': documentNumber,
      'Companyname': companyname,
      'LegalForm': legalForm,
      'RegistrationNumber': registrationNumber,
      'IncorporationDate': incorporationDate,
      'RegisteredAddress': registeredAddress,
      'TaxIdentificationNumber': taxIdentificationNumber,
      'CertificateofIncorporation': certificateofIncorporation,
      'PassportFront': passportFront,
      'country': country,
    }.withoutNulls,
  );

  return firestoreData;
}

class KycRecordDocumentEquality implements Equality<KycRecord> {
  const KycRecordDocumentEquality();

  @override
  bool equals(KycRecord? e1, KycRecord? e2) {
    return e1?.isValidated == e2?.isValidated &&
        e1?.fullname == e2?.fullname &&
        e1?.documentNumber == e2?.documentNumber &&
        e1?.companyname == e2?.companyname &&
        e1?.legalForm == e2?.legalForm &&
        e1?.registrationNumber == e2?.registrationNumber &&
        e1?.incorporationDate == e2?.incorporationDate &&
        e1?.registeredAddress == e2?.registeredAddress &&
        e1?.taxIdentificationNumber == e2?.taxIdentificationNumber &&
        e1?.certificateofIncorporation == e2?.certificateofIncorporation &&
        e1?.passportFront == e2?.passportFront &&
        e1?.country == e2?.country;
  }

  @override
  int hash(KycRecord? e) => const ListEquality().hash([
        e?.isValidated,
        e?.fullname,
        e?.documentNumber,
        e?.companyname,
        e?.legalForm,
        e?.registrationNumber,
        e?.incorporationDate,
        e?.registeredAddress,
        e?.taxIdentificationNumber,
        e?.certificateofIncorporation,
        e?.passportFront,
        e?.country
      ]);

  @override
  bool isValidKey(Object? o) => o is KycRecord;
}
