import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'kyc2_widget.dart' show Kyc2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Kyc2Model extends FlutterFlowModel<Kyc2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode;
  TextEditingController? userNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextControllerValidator;
  // State field(s) for LegalForm widget.
  FocusNode? legalFormFocusNode;
  TextEditingController? legalFormTextController;
  String? Function(BuildContext, String?)? legalFormTextControllerValidator;
  // State field(s) for RegistrationNumber widget.
  FocusNode? registrationNumberFocusNode;
  TextEditingController? registrationNumberTextController;
  String? Function(BuildContext, String?)?
      registrationNumberTextControllerValidator;
  // State field(s) for IncorporationDate widget.
  FocusNode? incorporationDateFocusNode;
  TextEditingController? incorporationDateTextController;
  String? Function(BuildContext, String?)?
      incorporationDateTextControllerValidator;
  // State field(s) for RegisteredAddress widget.
  FocusNode? registeredAddressFocusNode;
  TextEditingController? registeredAddressTextController;
  String? Function(BuildContext, String?)?
      registeredAddressTextControllerValidator;
  // State field(s) for TaxIdentificationNumber widget.
  FocusNode? taxIdentificationNumberFocusNode;
  TextEditingController? taxIdentificationNumberTextController;
  String? Function(BuildContext, String?)?
      taxIdentificationNumberTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  KycRecord? createdKYC;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    userNameTextFieldFocusNode?.dispose();
    userNameTextFieldTextController?.dispose();

    legalFormFocusNode?.dispose();
    legalFormTextController?.dispose();

    registrationNumberFocusNode?.dispose();
    registrationNumberTextController?.dispose();

    incorporationDateFocusNode?.dispose();
    incorporationDateTextController?.dispose();

    registeredAddressFocusNode?.dispose();
    registeredAddressTextController?.dispose();

    taxIdentificationNumberFocusNode?.dispose();
    taxIdentificationNumberTextController?.dispose();
  }
}
