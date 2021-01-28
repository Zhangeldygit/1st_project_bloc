import 'package:flutter/material.dart';
import 'package:sample/contacts_screen/details_screen.dart';
import 'package:sample/contacts_screen/model/contact_model.dart';

class ContactsCard extends StatelessWidget {
  final Contact contact;
  const ContactsCard({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  DetailsScreen(contact: contact),
            ));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              child: Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
            Text(
              contact.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Raleway', fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
