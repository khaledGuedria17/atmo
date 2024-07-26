import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_extra_item_model.dart';
export 'add_extra_item_model.dart';

class AddExtraItemWidget extends StatefulWidget {
  const AddExtraItemWidget({super.key});

  @override
  State<AddExtraItemWidget> createState() => _AddExtraItemWidgetState();
}

class _AddExtraItemWidgetState extends State<AddExtraItemWidget> {
  late AddExtraItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddExtraItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).grey3,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/car_1.png',
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '4wms16ni' /* Beef */,
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'ejo6z1g1' /* 1 Slice */,
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'Plus Jakarta Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
          Container(
            width: 120.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).grey3,
              borderRadius: BorderRadius.circular(30.0),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: FlutterFlowTheme.of(context).grey3,
                width: 2.0,
              ),
            ),
            child: FlutterFlowCountController(
              decrementIconBuilder: (enabled) => Icon(
                FFIcons.kminus,
                color: enabled
                    ? FlutterFlowTheme.of(context).primaryText
                    : FlutterFlowTheme.of(context).lightGrey,
                size: 20.0,
              ),
              incrementIconBuilder: (enabled) => Icon(
                Icons.add,
                color: enabled
                    ? FlutterFlowTheme.of(context).primaryText
                    : FlutterFlowTheme.of(context).lightGrey,
                size: 20.0,
              ),
              countBuilder: (count) => Text(
                count.toString(),
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Plus Jakarta Sans',
                      letterSpacing: 0.0,
                    ),
              ),
              count: _model.countControllerValue ??= 0,
              updateCount: (count) =>
                  setState(() => _model.countControllerValue = count),
              stepSize: 1,
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            ),
          ),
        ].divide(SizedBox(width: 12.0)),
      ),
    );
  }
}
