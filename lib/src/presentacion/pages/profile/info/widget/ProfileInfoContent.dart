import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto_flutter/src/domain/models/User.dart';

// ignore: must_be_immutable
class ProfileInfoContent extends StatelessWidget {
  User? user;

  ProfileInfoContent(this.user);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _imageBackground(context),
        Column(
          children: [
            _imageProfile(),
            Spacer(),
            _cardProfileInfo(context),
          ],
        )
      ],
    );
  }

  Widget _cardProfileInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ListTile(
              title: Text('${user?.name ?? ''} ${user?.lastName ?? ''}'),
              subtitle: Text('Nombre del Usuario'),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text(user?.email ?? ''),
              subtitle: Text('Correo Electronico'),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text(user?.phone ?? ''),
              subtitle: Text('Telefono'),
              leading: Icon(Icons.person),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 10),
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, 'profile/update',arguments: user);
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _imageProfile() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      width: 150,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: ClipOval(
          child: user != null
          ? FadeInImage.assetNetwork(
            placeholder: 'assets/img/user_image.png',
            image: user!.image!,
            fit: BoxFit.cover,
            fadeInDuration: Duration(seconds: 1),
          )
          :Container(),
        ),
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background3.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}
