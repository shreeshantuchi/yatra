import 'package:flutter/material.dart';

class LocationModel {
  final String _country;
  final String _locality;

  LocationModel(this._country, this._locality);

  String get locality => _locality;
  String get country => _country;
}
