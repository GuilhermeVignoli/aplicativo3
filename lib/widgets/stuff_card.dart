import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:memstuff/helpers/phone_services.dart';
import 'package:memstuff/helpers/service_locator.dart';

import '../helpers/date_helper.dart';
import '../models/stuff_model.dart';

class StuffCard extends StatelessWidget {
  final StuffModel stuff;
  final Function onUpdate;
  final Function onDelete;

  const StuffCard({
    Key key,
    this.stuff,
    this.onUpdate,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: _buildCard(),
      actions: <Widget>[
        IconSlideAction(
          caption: 'DELETAR',
          color: Theme.of(context).accentColor,
          icon: Icons.delete,
          onTap: onDelete,
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          caption: 'LIGAR',
          color: Colors.red,
          icon : Icons.call_outlined,
          onTap: () => _callPhoneService(stuff.phone),
        ),
      ],
    );
  }

  _callPhoneService(String number){
      final PhoneServices _services = locator<PhoneServices>();
      _services.call(number);
  }

  _buildCard() {
    return InkWell(
      onTap: onUpdate,
      child: Container(
        child: ListTile(
          title: Text(stuff.description ?? ''),
          subtitle: Text(stuff.contactName ?? ''),
          trailing: Container(
            padding: const EdgeInsets.only(top: 8),
            height: double.infinity,
            child: Text(DateHelper.relative(stuff.date)),
          ),
          leading: CircleAvatar(
            backgroundImage:
                stuff.hasPhoto ? FileImage(File(stuff.photoPath)) : null,
            child: stuff.hasPhoto ? null : Text(stuff.description[0]),
          ),
        ),
      ),
    );
  }
}
