import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const kTextField = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(30)),
  borderSide: BorderSide(color: Colors.white),
);

const kHintText = TextStyle(
  color: Colors.grey,
  letterSpacing: 1,
  fontWeight: FontWeight.w600,
  fontSize: 16,
);

const kInputTextDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.black26,
  border: kTextField,
  enabledBorder: kTextField,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(width: 1.5, color: Colors.white),
  ),
  hintText: 'Search city by name',
  hintStyle: kHintText,
);

const kTextStyle = TextStyle(
  fontSize: 20,
);
