import 'package:banderas/models/modelo_pais_otrapagina.dart';
import 'package:dio/dio.dart';

class Respuesta{
  final dio= Dio();

  Future<String?> getAnswer() async{
     try {
      final respuesta = await dio.get("https://restcountries.com/v3.1/name/spain");

      if (respuesta.statusCode == 200) {
        
        if (respuesta.data is List) {

          final data = respuesta.data[0];
          
          if (data != null){
            
          final pais = ModeloPaisOtrapagina.fromJson(data);

          final Flags? bandera = pais.flags;
          print(bandera?.png);

          return bandera?.png;
          }
          else{
            return null;
          }
        } else {
          throw Exception("La respuesta no es una lista.");
        }
      } else {
        throw Exception("Error en la solicitud: ${respuesta.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
    /*final respuesta = await dio.get("https://restcountries.com/v3.1/name/spain");
    
    if(respuesta.statusCode == 200){
      
      
      final pais = CountryModel.fromJsonMap(respuesta.data);
      final Flags bandera = pais.flags;
      print(bandera.png);

      return bandera.png;
    }
    
  
    throw UnimplementedError();
  }*/
  
}