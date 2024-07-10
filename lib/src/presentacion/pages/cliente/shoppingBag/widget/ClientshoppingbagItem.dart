import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/shoppingBag/bloc/ClientshoppingbagBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/shoppingBag/bloc/ClientshoppingbagEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/shoppingBag/bloc/ClientshoppingbagState.dart';

// ignore: must_be_immutable
class Clientshoppingbagitem extends StatelessWidget {
  ClientshoppingbagBloc? bloc;
  ClientshoppingbagState state;
  Product? product;

  Clientshoppingbagitem(this.bloc, this.state, this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 80,
      margin: EdgeInsets.only(left: 25, right: 15, top: 15),
      child: Row(
        children: [
          _imageProduct(),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textProduct(),
              SizedBox(height: 5),
              _actionAddandSubtract(),
            ],
          ),
          Spacer(),
          Column(
            children: [
              _textPrice(),
              _iconRemove(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionAddandSubtract() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            bloc?.add(SubtractdItem(product: product!));
          },
          child: Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                )),
            child: Text(
              '-',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          width: 35,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: Text(
            product?.quantity.toString() ?? '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: () {
            bloc?.add(AddItem(product: product!));
          },
          child: Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
            child: Text(
              '+',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _textPrice() {
    return product != null
        ? Text(
            '\$ ${product!.price! * product!.quantity!}',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          )
        : Container();
  }

  Widget _iconRemove() {
    return IconButton(
        onPressed: () {
          bloc?.add(RemoveItem(product: product!));
        },
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ));
  }

  Widget _textProduct() {
    return Container(
      width: 180,
      child: Text(
        product?.name ?? '',
        //overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _imageProduct() {
    return product != null
        ? Container(
            width: 70,
            child: product!.image1!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: 'assets/img/user_image.png',
                    image: product!.image1!,
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  )
                : Container(),
          )
        : Image.asset(
            'assets/img/no-image.png',
            width: 70,
          );
  }
}
