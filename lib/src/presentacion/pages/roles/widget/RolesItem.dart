import 'package:flutter/material.dart';
import 'package:proyecto_flutter/src/domain/models/Rol.dart';

// ignore: must_be_immutable
class RolesItem extends StatelessWidget {
  Role role;
  RolesItem(this.role);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, role.route!, (route) => false);
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20,top: 15),
            height: 100,
            child: FadeInImage(
              image: NetworkImage(role.image!),
              fit: BoxFit.contain,
              fadeInDuration: Duration(seconds: 1),
              placeholder: AssetImage('assets/img/no-image.png'), 
            ),
          ),
          Text(role.name ?? '',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
