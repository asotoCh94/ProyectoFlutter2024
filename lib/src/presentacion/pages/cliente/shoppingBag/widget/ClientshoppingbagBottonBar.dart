import 'package:flutter/material.dart';
import 'package:proyecto_flutter/src/presentacion/pages/cliente/shoppingBag/bloc/ClientshoppingbagState.dart';
import 'package:proyecto_flutter/src/presentacion/widgets/defaultButton.dart';

// ignore: must_be_immutable
class ClientshoppingbagBottonBar extends StatelessWidget {
  //ClientshoppingbagBloc? _bloc;
  ClientshoppingbagState state;

  ClientshoppingbagBottonBar(this.state);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.grey.shade300,
      child: Column(
        children: [
          Divider(
            color: Colors.grey.shade400,
            height: 0,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.grey.shade400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Total \$${state.total}',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 170,
                  child: DefaultButton(
                    text: 'Confirmar Orden',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
