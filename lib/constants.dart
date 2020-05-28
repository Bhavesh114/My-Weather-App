import 'package:flutter/material.dart';

const TextStyle kmaintext = TextStyle(
    color: Color(0xFFA3A5A8),
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat-Medium');

const InputDecoration ktextfeildinput = InputDecoration(
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City name',
  border: InputBorder.none,
  hintStyle: TextStyle(
    color: Colors.white,
    fontSize: 22.0,
    fontWeight: FontWeight.w100,
  ),
);
