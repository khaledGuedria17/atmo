import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nearest_location_item_model.dart';
export 'nearest_location_item_model.dart';

class NearestLocationItemWidget extends StatefulWidget {
  const NearestLocationItemWidget({super.key});

  @override
  State<NearestLocationItemWidget> createState() =>
      _NearestLocationItemWidgetState();
}

class _NearestLocationItemWidgetState extends State<NearestLocationItemWidget> {
  late NearestLocationItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NearestLocationItemModel());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).lightGrey,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.restaurant,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 20.0,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'msl8hzk9' /* Delaska RIsaka */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Plus Jakarta Sans',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 12.0,
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              '5kn33zd0' /* 4.8 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      Container(
                        width: 5.0,
                        height: 5.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '0lvbcm6x' /* Close 10.45 PM */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                ].divide(SizedBox(height: 4.0)),
              ),
            ),
            Theme(
              data: ThemeData(
                checkboxTheme: CheckboxThemeData(
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
                unselectedWidgetColor: FlutterFlowTheme.of(context).grey,
              ),
              child: Checkbox(
                value: _model.checkboxValue ??= false,
                onChanged: (newValue) async {
                  setState(() => _model.checkboxValue = newValue!);
                },
                side: BorderSide(
                  width: 2,
                  color: FlutterFlowTheme.of(context).grey,
                ),
                activeColor: FlutterFlowTheme.of(context).primary,
                checkColor: FlutterFlowTheme.of(context).info,
              ),
            ),
          ].divide(SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}
