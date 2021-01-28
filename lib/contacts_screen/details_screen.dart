import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/contacts_screen/bloc/contact_bloc.dart';
import 'package:sample/contacts_screen/model/contact_model.dart';
import 'package:sample/gradient_appbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailsScreen extends StatefulWidget {
  final Contact contact;
  DetailsScreen({Key key, this.contact}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final CameraPosition _location = CameraPosition(
        target: LatLng(widget.contact.lat, widget.contact.lng), zoom: 20);

    final TextEditingController _emailController =
        TextEditingController(text: widget.contact.email);
    final TextEditingController _phoneController =
        TextEditingController(text: widget.contact.phone);
    final TextEditingController _websiteController =
        TextEditingController(text: widget.contact.website);
    final TextEditingController _companyController =
        TextEditingController(text: widget.contact.companyName);
    final TextEditingController _addressController = TextEditingController(
        text: widget.contact.addressStreet + " " + widget.contact.addressSuite);

    return BlocProvider(
      create: (_) => ContactBloc()..add(GetContacts()),
      child: Scaffold(
        backgroundColor: Color(0xff0F0B21),
        body: Column(
          children: [
            GradientAppBar(title: widget.contact.name),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: max(30, 30),
                  backgroundColor: Colors.grey,
                ),
                SizedBox(
                  child: Text(
                    widget.contact.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: 16),
                  ),
                ),
                Text(
                  widget.contact.email,
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ),
                SizedBox(height: 10),
                TextField(
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(3)),
                      contentPadding: EdgeInsets.all(16),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white)),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: _emailController,
                ),
                SizedBox(height: 20),
                TextField(
                  enabled: false,
                  readOnly: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(4)),
                      contentPadding: EdgeInsets.all(16),
                      labelText: 'Phone number',
                      labelStyle: TextStyle(color: Colors.white)),
                  controller: _phoneController,
                ),
                SizedBox(height: 20),
                TextField(
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(4)),
                      contentPadding: EdgeInsets.all(16),
                      labelText: 'Website',
                      labelStyle: TextStyle(color: Colors.white)),
                  style: TextStyle(color: Colors.white),
                  controller: _websiteController,
                ),
                SizedBox(height: 20),
                TextField(
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(4)),
                      contentPadding: EdgeInsets.all(16),
                      labelText: 'Company',
                      labelStyle: TextStyle(color: Colors.white)),
                  style: TextStyle(color: Colors.white),
                  controller: _companyController,
                ),
                SizedBox(height: 20),
                TextField(
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(4)),
                      contentPadding: EdgeInsets.all(16),
                      labelText: 'Address',
                      labelStyle: TextStyle(color: Colors.white)),
                  style: TextStyle(color: Colors.white),
                  controller: _addressController,
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                width: 420,
                height: 215,
                padding:
                    EdgeInsets.only(top: 50, left: 24, right: 16, bottom: 33),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: GoogleMap(
                    markers: {
                      Marker(
                          position:
                              LatLng(widget.contact.lat, widget.contact.lng),
                          markerId: MarkerId(''))
                    },
                    initialCameraPosition: _location,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
