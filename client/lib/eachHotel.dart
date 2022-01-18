import 'package:flutter/material.dart';

import 'hotel.dart';
import 'no_contract.dart';

class ContactsListing extends StatelessWidget {
  final List<Hotel> hotel;
  final VoidCallback onAdd;
  final Function(String id) onDelete;

  ContactsListing({this.hotel, this.onAdd, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return hotel.isEmpty
        ? NoContacts(
      onAdd: onAdd,
    )
        : ListView(children: [
      ...hotel
          .map<Widget>(
            (contact) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Text('555'),
            ),
            title: Text(
              contact.name,
              style: TextStyle(fontSize: 20),
            ),
            trailing: FlatButton(
              onPressed: () {
                onDelete(contact.id);
              },
              child: Icon(
                Icons.delete,
                size: 30,
              ),
            ),
          ),
        ),
      )
          .toList(),
      SizedBox(height: 70),
    ]);
  }
}