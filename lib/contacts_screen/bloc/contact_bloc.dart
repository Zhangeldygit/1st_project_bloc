import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sample/contacts_screen/data/data_contacts.dart';
import 'package:sample/contacts_screen/model/contact_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial());
  ContactsDataSource _contactsDataSource = ContactsDataSource();

  @override
  Stream<ContactState> mapEventToState(
    ContactEvent event,
  ) async* {
    if (event is GetContacts) {
      yield ContactLoading();
      try {
        final List<Contact> contacts = await _contactsDataSource.getContacts();
        yield ContactSuccess(contacts);
      } on Exception catch (e) {
        yield ContactFailure(e.toString());
      }
    }
  }
}
