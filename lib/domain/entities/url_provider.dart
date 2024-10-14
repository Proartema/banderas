import 'package:banderas/models/respuesta.dart';
import 'package:flutter/material.dart';

class UrlProvider extends ChangeNotifier{

  String? url = "https://pamipe.com/wp-content/uploads/2022/09/Chihuahua.png" ;

  

  void modificarUrl() {

    Respuesta().getAnswer().then((imagenurlApi){
                        print("$imagenurlApi ha llegado");
                        url=imagenurlApi;
                        notifyListeners();
                      });
    
  }

}