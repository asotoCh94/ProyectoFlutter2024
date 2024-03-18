abstract class Resource<T> {}

class Initial extends Resource {}
class Loading extends Resource {}
//la T es in tipo de dato generico, cualquier tipo de dato q retorne
class Succes<T> extends Resource<T> {
  //OBTENEMOS LA DATA DE RESPUESTA
  final T data;
  Succes(this.data);
}

class Error<T> extends Resource<T> {
  //OBTENEMOS LA DATA DE RESPUESTA
  final String message;//mensaje de eror
  Error(this.message);
}
