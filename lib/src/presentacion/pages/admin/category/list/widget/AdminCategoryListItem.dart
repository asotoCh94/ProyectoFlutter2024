import 'package:flutter/material.dart';
import 'package:proyecto_flutter/src/domain/models/Category.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/list/bloc/AdminCtgListBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/list/bloc/AdminCtgListEvent.dart';

// ignore: must_be_immutable
class AdminCategoryListItem extends StatelessWidget {
  AdminCtgListBloc? bloc;
  Category? category;

  AdminCategoryListItem(this.bloc, this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'admin/product/list', arguments: category);
      },
      child: ListTile(
        leading: category != null
            ? Container(
                width: 70,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/img/user_image.png',
                  image: category!.image!,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(seconds: 1),
                ),
              )
            : Container(),
        title: Text(category?.name ?? ''),
        subtitle: Text(category?.description ?? ''),
        contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
        trailing: Wrap(
          direction: Axis.horizontal,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'admin/category/update',
                      arguments: category);
                },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  bloc?.add(DeleteCtg(id: category!.id!));
                },
                icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
