// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom widgets
// Imports custom functions

import 'package:country_picker/country_picker.dart';

class CustomCountryPicker extends StatefulWidget {
  const CustomCountryPicker({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CustomCountryPicker> createState() => _CustomCountryPickerState();
}

class _CustomCountryPickerState extends State<CustomCountryPicker> {
  Country? selectedCountry;
  String _selectedCountry = 'Select Country';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(text: _selectedCountry),
      style: TextStyle(
        color: Colors.black,
      ),
      readOnly: true,
      onTap: () {
        showCountryPicker(
          showSearch: true,
          context: context,
          showWorldWide: false,
          moveAlongWithKeyboard: false,
          showPhoneCode: false,
          countryListTheme: CountryListThemeData(
            flagSize: 27,
            backgroundColor: Colors.white,
            textStyle: TextStyle(color: Colors.black),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            inputDecoration: InputDecoration(
              fillColor: Colors.white,
              labelText: 'Search by Country Name',
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              hintText: 'Start typing to search',
              helperStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            searchTextStyle: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
          onSelect: (Country country) {
            setState(() {
              _selectedCountry = country.name;
            });
            selectedCountry() {
              return _selectedCountry;
            }
          },
        );
      },
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
          size: 18,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white24),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white24),
        ),
        hintText: "Select Country",
        hintStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
