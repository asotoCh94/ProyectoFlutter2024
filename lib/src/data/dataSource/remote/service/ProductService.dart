import 'dart:convert';
import 'dart:io';

import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:proyecto_flutter/src/domain/models/product.dart';
import 'package:http/http.dart' as http;
import '../../../../domain/utils/ListToString.dart';
import '../../../../domain/utils/Resource.dart';
import '../../../api/ApiConfig.dart';

class ProductSevice {
  Future<String> token;

  ProductSevice(this.token);

  Future<Resource<Product>> create(Product product, List<File> files) async {
    try {
      //http://192.168.1.2:3000/users/16
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/products');

      final request = http.MultipartRequest('POST', url);
      //validamos token
      request.headers['Authorization'] = await token;

      files.forEach((file) async {
        // Determine the content type based on the image file extension
        String contentType;
        if (file.path.endsWith('.jpg')) {
          contentType = 'jpg';
        } else if (file.path.endsWith('.jpeg')) {
          contentType = 'jpeg';
        } else if (file.path.endsWith('.png')) {
          contentType = 'png';
        } else {
          throw Exception('Unsupported image type');
        }
        //obtenemos la imagen
        request.files.add(http.MultipartFile(
          'files[]', //debe ser igual a lo q se coloco en el backend
          http.ByteStream(file.openRead().cast()),
          await file.length(),
          filename: basename(file.path),
          //contentType: MediaType('image', 'jpg'),
          contentType: MediaType('image', contentType),
        ));
      });

      request.fields['name'] = product.name!;
      request.fields['description'] = product.description!;
      request.fields['price'] = product.price!.toString();
      request.fields['id_category'] = product.idCategory!.toString();
      //se manda todo
      final response = await request.send();
      //transforma la respuesta en un objeto <Resource<xxxx>
      //transformamos la data q llega como json a un xxxxx
      final data =
          json.decode(await response.stream.transform(utf8.decoder).first);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Product productResponse = Product.fromJson(data);
        return Succes(productResponse);
      } else {
        print(data['message']);
        return Error(
            listToString(data['message'])); //para retornar un mapa de valores
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<List<Product>>> getProductsByCategory(int idCategory) async {
    try {
      //http://192.168.1.2:3000/users/16
      Uri url =
          Uri.http(ApiConfig.API_ECOMMERCE, '/products/category/$idCategory');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Product> product = Product.fromJsonList(data);
        return Succes(product);
      } else {
        return Error(
            listToString(data['message'])); //para retornar un mapa de valores
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Product>> update(int id, Product product) async {
    try {
      //http://192.168.1.2:3000/users/16
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/products/$id');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String bodyParams = json.encode({
        'name': product.name,
        'description': product.description,
        'price': product.price,
      });

      final response = await http.put(url, headers: headers, body: bodyParams);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Product productResponse = Product.fromJson(data);
        return Succes(productResponse);
      } else {
        return Error(
            listToString(data['message'])); //para retornar un mapa de valores
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Product>> updateWithImages(int id, Product product,
      List<File> files, List<int> imageToUpdate) async {
    try {
      //http://192.168.1.2:3000/users/16
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/products/upload/$id');

      final request = http.MultipartRequest('PUT', url);
      //validamos token
      request.headers['Authorization'] = await token;

      files.forEach((file) async {
        // Determine the content type based on the image file extension
        String contentType;
        if (file.path.endsWith('.jpg')) {
          contentType = 'jpg';
        } else if (file.path.endsWith('.jpeg')) {
          contentType = 'jpeg';
        } else if (file.path.endsWith('.png')) {
          contentType = 'png';
        } else {
          throw Exception('Unsupported image type');
        }
        //obtenemos la imagen
        request.files.add(http.MultipartFile(
          'files[]', //debe ser igual a lo q se coloco en el backend
          http.ByteStream(file.openRead().cast()),
          await file.length(),
          filename: basename(file.path),
          //contentType: MediaType('image', 'jpg'),
          contentType: MediaType('image', contentType),
        ));
      });

      request.fields['name'] = product.name!;
      request.fields['description'] = product.description!;
      request.fields['price'] = product.price!.toString();
      request.fields['imagesToUpdate'] = jsonEncode(imageToUpdate); //sale del backen imagesToUpdate| ['0','1']
      //se manda todo
      final response = await request.send();
      //transforma la respuesta en un objeto <Resource<xxxx>
      //transformamos la data q llega como json a un xxxxx
      final data =
          json.decode(await response.stream.transform(utf8.decoder).first);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Product productResponse = Product.fromJson(data);
        return Succes(productResponse);
      } else {
        print(data['message']);
        return Error(
            listToString(data['message'])); //para retornar un mapa de valores
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<bool>> delete(int id) async {
    try {
      //http://192.168.1.2:3000/users/16
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/products/$id');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.delete(url, headers: headers);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Succes(true);
      } else {
        return Error(
            listToString(data['message'])); //para retornar un mapa de valores
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

}
