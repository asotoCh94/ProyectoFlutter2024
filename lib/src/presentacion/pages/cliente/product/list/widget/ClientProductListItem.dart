import 'package:flutter/material.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/product/list/bloc/ClientProductListBloc.dart';

// ignore: must_be_immutable
class ClientProductListItem extends StatelessWidget {
  ClientProductListBloc? bloc;
  Product? product;

  ClientProductListItem(this.bloc, this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'client/product/detail', arguments: product);
      },
      child: ListTile(
        trailing: product != null
          ? Container(
              width: 70,
              child: product!.image1!.isNotEmpty 
              ?  FadeInImage.assetNetwork(
                placeholder: 'assets/img/user_image.png',
                image: product!.image1!,
                fit: BoxFit.cover,
                fadeInDuration: Duration(seconds: 1),
              ) : Container(),
            )
          : Container(),
        title: Text(product?.name ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text(product?.description ?? ''),
            Text('\$ ${product?.price.toString() ?? ''}'),
          ],
        ),
        contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
        
      ),
    );
  }
}
