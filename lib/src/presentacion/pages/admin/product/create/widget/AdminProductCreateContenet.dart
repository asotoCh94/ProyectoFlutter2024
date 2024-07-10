import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/create/bloc/AdminProductCreateState.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/product/create/bloc/AdminProductCreateEvent.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';
import 'package:proyecto_flutter/src/presentacion/utils/SelectOptionImageDialog.dart';
import 'package:proyecto_flutter/src/presentacion/widgets/defaultIconBack.dart';
import 'package:proyecto_flutter/src/presentacion/widgets/defaultTexField.dart';

// ignore: must_be_immutable
class AdminProductCreateContenet extends StatelessWidget {
  AdminProductCreateBloc? bloc;
  AdminProductCreateState state;

  AdminProductCreateContenet(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: state.formkey,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _imageBackground(context),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _imageProductOne(context),
                        SizedBox(width: 20),
                        _imageProductTwo(context),
                      ],
                    ),
                    _cardProdcutForm(context)
                  ],
                ),
              ),
            ),
            DefaultIconBack(left: 15, top: 50)
          ],
        ));
  }

  Widget _cardProdcutForm(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.55,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            _textNewProduct(),
            _textFieldName(),
            _textFieldDescripcion(),
            _textFieldPrice(),
            _fabSubmit()
          ],
        ),
      ),
    );
  }

  Widget _fabSubmit() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 20),
      child: FloatingActionButton(
        onPressed: () {
          if (state.formkey!.currentState!.validate()) {
            bloc?.add(FormOnClickPrdt());
          } else {
            Fluttertoast.showToast(
                msg: 'El formulario no es valido',
                toastLength: Toast.LENGTH_LONG);
          }
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _textNewProduct() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 25, left: 10, bottom: 10),
      child: Text(
        'Nuevp producto',
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget _textFieldName() {
    return DefaultTextField(
      label: 'Nombre producto',
      icon: Icons.category,
      onChanged: (text) {
        bloc?.add(NameChangedPrdt(name: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.name.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldDescripcion() {
    return DefaultTextField(
      label: 'Descripcion',
      icon: Icons.list,
      onChanged: (text) {
        bloc?.add(
            DescriptionChangedPrdt(description: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.description.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldPrice() {
    return DefaultTextField(
      label: 'Precio del producto',
      icon: Icons.money,
      textInputType: TextInputType.number,
      onChanged: (text) {
        bloc?.add(PriceChangedPrdt(price: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.price.error;
      },
      color: Colors.black,
    );
  }

  Widget _imageProductOne(BuildContext context) {
    return GestureDetector(      
      onTap: () {
        SelectOptionImageDialog(
          context, 
          () {bloc?.add(PickImagePrdt(numberFile: 1));}, 
          () {bloc?.add(TakePhotoPrdt(numberFile: 1));}
        );
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 100),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
            child: state.file1 != null
            ? Image.file(
                state.file1!,
                fit: BoxFit.cover,
              )
            : Image.asset(
              'assets/img/no-image.png',
              fit: BoxFit.cover,
            ) 
          ),
        ),
      ),
    );
  }

  Widget _imageProductTwo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SelectOptionImageDialog(context, () {
          bloc?.add(PickImagePrdt(numberFile: 2));
        }, () {
          bloc?.add(TakePhotoPrdt(numberFile: 2));
        });
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 100),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
              child: state.file2 != null
                  ? Image.file(
                      state.file2!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/img/no-image.png',
                      fit: BoxFit.cover,
                    )),
        ),
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background1.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}
