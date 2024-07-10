import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:proyecto_flutter/src/data/api/ApiConfig.dart';
import 'package:proyecto_flutter/src/domain/models/Category.dart';
import 'package:proyecto_flutter/src/domain/utils/ListToString.dart';
import 'package:proyecto_flutter/src/domain/utils/Resource.dart';
import 'dart:io';

class CategoryService {
  Future<String> token;

  CategoryService(this.token);

  Future<Resource<Category>> create(Category category, File? image) async {
    try {
      //http://192.168.1.2:3000/users/16
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/categories');
      print(token);
      final request = http.MultipartRequest('POST', url);
      //validamos token
      request.headers['Authorization'] = await token;
      // Determine the content type based on the image file extension
      String contentType;
      if (image!.path.endsWith('.jpg')) {
        contentType = 'jpg';
      } else if (image.path.endsWith('.jpeg')) {
        contentType = 'jpeg';
      } else if (image.path.endsWith('.png')) {
        contentType = 'png';
      } else {
        throw Exception('Unsupported image type');
      }
      //obtenemos la imagen
      request.files.add(http.MultipartFile(
        'file', //debe ser igual a lo q se coloco en el backend @UseInterceptors(FileInterceptor('file'))
        http.ByteStream(image.openRead().cast()),
        await image.length(),
        filename: basename(image.path),
        //contentType: MediaType('image', 'jpg'),
        contentType: MediaType('image', contentType),
      ));
      //obtenemos la dta
      request.fields['name'] = category.name!;
      request.fields['description'] = category.description!;
      /* request.fields['category'] = json.encode({
        //'category' debe encajar con lo backen (@Body() category: UpdatecategoryDto)
        'name': category.name,
        'description': category.description,
      });*/
      //se manda todo
      final response = await request.send();
      //transforma la respuesta en un objeto <Resource<User>
      //transformamos la data q llega como json a un user
      final data =
          json.decode(await response.stream.transform(utf8.decoder).first);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Category categoryResponse = Category.fromJson(data);
        return Succes(categoryResponse);
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

  Future<Resource<List<Category>>> getCategories() async {
    try {
      //http://192.168.1.2:3000/users/16
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/categories');


      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };

      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Category> categories = Category.fromJsonList(data);
        return Succes(categories);
      } else {
        return Error(
            listToString(data['message'])); //para retornar un mapa de valores
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Category>> update(int id, Category category) async {
    try {
      //http://192.168.1.2:3000/users/16
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/categories/$id');


      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String bodyParams = json.encode({
        'name': category.name,
        'description': category.description,
      });

      final response = await http.put(url, headers: headers, body: bodyParams);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Category categoryResponse = Category.fromJson(data);
        return Succes(categoryResponse);
      } else {
        return Error(
            listToString(data['message'])); //para retornar un mapa de valores
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Category>> updateImage(int id, Category category, File? image) async {
    try {
      //http://192.168.1.2:3000/users/16
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/categories/updateWhitImage/$id');

      final request = http.MultipartRequest('PUT', url);
      //validamos token
      request.headers['Authorization'] = await token;
      // Determine the content type based on the image file extension
      String contentType;
      if (image!.path.endsWith('.jpg')) {
        contentType = 'jpg';
      } else if (image.path.endsWith('.jpeg')) {
        contentType = 'jpeg';
      } else if (image.path.endsWith('.png')) {
        contentType = 'png';
      } else {
        throw Exception('Unsupported image type');
      }
      //obtenemos la imagen
      request.files.add(http.MultipartFile(
        'file', //debe ser igual a lo q se coloco en el backend @UseInterceptors(FileInterceptor('file'))
        http.ByteStream(image.openRead().cast()),
        await image.length(),
        filename: basename(image.path),
        //contentType: MediaType('image', 'jpg'),
        contentType: MediaType('image', contentType),
      ));
      //obtenemos la dta
      request.fields['name'] = category.name!;
      request.fields['description'] = category.description!; 
      //se manda todo
      final response = await request.send();
      //transforma la respuesta en un objeto <Resource<User>
      //transformamos la data q llega como json a un user
      final data = json.decode(await response.stream.transform(utf8.decoder).first);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Category categoryResponse = Category.fromJson(data);
        return Succes(categoryResponse);
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
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/categories/$id');
      

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
