import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/contacts_screen/bloc/contact_bloc.dart';
import 'package:sample/contacts_screen/contacts_card.dart';
import 'package:sample/gradient_appbar.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContactBloc()..add(GetContacts()),
      child: Scaffold(
        backgroundColor: Color(0xff0F0B21),
        body: Column(
          children: [
            GradientAppBar(isHided: true, title: 'Contacts'),
            ContactsList(),
          ],
        ),
      ),
    );
  }
}

class ContactsList extends StatelessWidget {
  const ContactsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ContactFailure) {
            return Text(state.errorContact);
          }
          if (state is ContactSuccess) {
            return ListView.separated(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: state.contacts.length,
              itemBuilder: (context, index) {
                return ContactsCard(
                  contact: state.contacts[index],
                );
              },
            );
          } else
            return Offstage();
        },
      ),
    );
  }
}
