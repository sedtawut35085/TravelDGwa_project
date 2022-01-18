import 'package:flutter/material.dart';
import 'package:se_app2/connect.dart';
import 'package:se_app2/hotel.dart';
import 'package:se_app2/eachHotel.dart';

class hotel extends StatefulWidget {
  final connect_Server api = connect_Server();

  @override
  _hotelState createState() => _hotelState();
}

class _hotelState extends State<hotel> {
  List<Hotel> hotel = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  void _loadContacts([bool showSpinner = false]) {
    if (showSpinner) {
      setState(() {
        loading = true;
      });
    }

    widget.api.getHotelInfo().then((data) {
      setState(() {
        hotel = data;
        loading = false;
      });
    });
  }

  void _addContact() async {
    final fullName = 'Holiday';

    final createdHotelInfo = await widget.api.createHotelInfo(fullName);
    setState(() {
      hotel.add(createdHotelInfo);
    });
  }

  void _deleteContact(String id) async {
    await widget.api.deleteContact(id);
    setState(() {
      hotel.removeWhere((contact) => contact.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: Text('Choose hotel'),
      //   elevation: 0,
      //   centerTitle: true,
      // ),
      // body: Padding(
      //   padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
      //   child: Column(
      //     children: [
      //       Text('เลือกสถานที่5'),
      //       DecoratedBox(
      //           decoration: BoxDecoration(
      //               shape: BoxShape.rectangle, color: Colors.redAccent)),
      //     ],
      //   ),
      // ),
      body: loading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ContactsListing(
        hotel: hotel,
        onAdd: _addContact,
        onDelete: _deleteContact,
      ),
      floatingActionButton:
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () {
            _loadContacts(true);
          },
          tooltip: 'Refresh list',
          backgroundColor: Colors.purple,
          child: Icon(Icons.refresh),
        ),
        SizedBox(width: 10),
        FloatingActionButton(
          onPressed: _addContact,
          tooltip: 'Add new contact',
          child: Icon(Icons.person_add),
        ),
      ]),
    );
  }
}