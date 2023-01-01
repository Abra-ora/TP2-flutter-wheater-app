import 'package:flutter/material.dart';

Widget createTextField() {
    final TextEditingController _cityFieldController = TextEditingController();
    return Container(
      margin:
          const EdgeInsets.only(top: 35, left: 15.0, bottom: 15.0, right: 15.0),
      child: TextFormField(
        controller: _cityFieldController,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide:
                  BorderSide(color: Colors.black87, style: BorderStyle.solid)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide:
                  BorderSide(color: Colors.blueGrey, style: BorderStyle.solid)),
          hintText: "City Name",
          hintStyle: TextStyle(color: Colors.black38),
        ),
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }