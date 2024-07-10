import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/create/bloc/AdminCategoryCreateEvent.dart';
import 'package:proyecto_flutter/src/presentacion/pages/admin/category/create/bloc/AdminCategoryCreateState.dart';
import 'package:proyecto_flutter/src/presentacion/utils/BlocFormItem.dart';
import 'package:proyecto_flutter/src/presentacion/utils/SelectOptionImageDialog.dart';
import 'package:proyecto_flutter/src/presentacion/widgets/defaultIconBack.dart';
import 'package:proyecto_flutter/src/presentacion/widgets/defaultTexField.dart';

// ignore: must_be_immutable
class AdminCategoyCreateContenet extends StatelessWidget {
  AdminCategoryCreateBloc? bloc;
  AdminCategoryCreateState state;

  AdminCategoyCreateContenet(this.bloc, this.state);

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
                  children: [_imageCategory(context), _cardCategoryForm(context)],
                ),
              ),
            ),
            DefaultIconBack(left: 15, top: 50)
          ],
        ));
  }

  Widget _cardCategoryForm(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.44,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            _textNewCategory(),
            _textFieldName(),
            _textFieldDescripcion(),
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
            bloc?.add(FormOnClickCtg());
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

  Widget _textNewCategory() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 25, left: 10, bottom: 10),
      child: Text(
        'Nueva Categoria',
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget _textFieldName() {
    return DefaultTextField(
      label: 'Nombre categoria',
      icon: Icons.category,
      onChanged: (text) {
        bloc?.add(NameChangedCtg(name: BlocFormItem(value: text)));
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
            DescriptionChangedCtg(description: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.description.error;
      },
      color: Colors.black,
    );
  }

  Widget _imageCategory(BuildContext context) {
    return GestureDetector(      
      onTap: () {
        SelectOptionImageDialog(
          context, 
          () {bloc?.add(PickImageCtg());}, 
          () {bloc?.add(TakePhotoCtg());}
        );
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 100),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: ClipOval(
            child: state.file != null
            ? Image.file(
                state.file!,
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
