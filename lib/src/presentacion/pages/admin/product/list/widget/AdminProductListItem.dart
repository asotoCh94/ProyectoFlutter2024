import 'package:flutter/material.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/list/bloc/AdminProductListBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/list/bloc/AdminProductListEvent.dart';

// ignore: must_be_immutable
class AdminProductListItem extends StatelessWidget {
  AdminProductListBloc? bloc;
  Product? product;

  AdminProductListItem(this.bloc, this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigator.pushNamed(context, 'admin/product/list', arguments: product);
      },
      child: ListTile(
        leading: product != null
            ? Container(
                width: 70,
                child: product!.image1!.isNotEmpty ?  FadeInImage.assetNetwork(
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
        trailing: Wrap(
          direction: Axis.horizontal,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'admin/product/update',arguments: product);
                },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  bloc?.add(DeleteProduct(id: product!.id!));
                },
                icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
