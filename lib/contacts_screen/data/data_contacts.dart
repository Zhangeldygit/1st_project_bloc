import 'package:sample/contacts_screen/model/contact_model.dart';
import 'dart:convert';

import 'package:http/http.dart';

class ContactsDataSource {
  String url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<Contact>> getContacts() async {
    Response response = await get(url);

    return (jsonDecode(response.body) as List)
        .map((element) => Contact.fromJson(element))
        .toList();
  }
}
