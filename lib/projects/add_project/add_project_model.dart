import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_project_widget.dart' show AddProjectWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:styled_divider/styled_divider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddProjectModel extends FlutterFlowModel<AddProjectWidget> {
  ///  Local state fields for this page.

  bool isPremiumPublish = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode1;
  TextEditingController? userNameTextFieldTextController1;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextController1Validator;
  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode2;
  TextEditingController? userNameTextFieldTextController2;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextController2Validator;
  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode3;
  TextEditingController? userNameTextFieldTextController3;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextController3Validator;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay1;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay2;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for DropDown widget.
  String? dropDownValue4;
  FormFieldController<String>? dropDownValueController4;
  // State field(s) for DropDown widget.
  String? dropDownValue5;
  FormFieldController<String>? dropDownValueController5;
  // State field(s) for estimatedTextField widget.
  FocusNode? estimatedTextFieldFocusNode;
  TextEditingController? estimatedTextFieldTextController;
  String? Function(BuildContext, String?)?
      estimatedTextFieldTextControllerValidator;
  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode4;
  TextEditingController? userNameTextFieldTextController4;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextController4Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue6;
  FormFieldController<String>? dropDownValueController6;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DocumentRecord? uploadDocument1;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DocumentRecord? uploadDocument2;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DocumentRecord? uploadDocument3;
  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DocumentRecord? uploadDocument4;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay1 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarSelectedDay2 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userNameTextFieldFocusNode1?.dispose();
    userNameTextFieldTextController1?.dispose();

    userNameTextFieldFocusNode2?.dispose();
    userNameTextFieldTextController2?.dispose();

    userNameTextFieldFocusNode3?.dispose();
    userNameTextFieldTextController3?.dispose();

    estimatedTextFieldFocusNode?.dispose();
    estimatedTextFieldTextController?.dispose();

    userNameTextFieldFocusNode4?.dispose();
    userNameTextFieldTextController4?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();
  }
}
