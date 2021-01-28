part of 'contact_bloc.dart';

@immutable
abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactSuccess extends ContactState {
  final List<Contact> contacts;

  ContactSuccess(this.contacts);
}

class ContactFailure extends ContactState {
  final String errorContact;

  ContactFailure(this.errorContact);

  @override
  String toString() => errorContact;
}
