import 'package:banderas/domain/entities/url_provider.dart';
import 'package:banderas/models/respuesta.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pantalla extends StatelessWidget {
  const Pantalla({super.key});

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UrlProvider())],
      child: Builder(
        builder: (context) { //DIOS MIO DE MI VIDA GRACIAS
          return Scaffold(
              appBar: AppBar(
                title: const Text("ESPAÑA"),
                centerTitle: true,
              ),
              body: Center(
                child: Column(
                  children: [
                    TextFormField(
                      controller: textController,
                    ),
                    Consumer<UrlProvider>(builder: (context, urlProvider, child) {
                      return Image.network(urlProvider.url!);
                    }),
                    ElevatedButton(
                        onPressed: () {
                          if (textController.text == "Spain" || textController.text == "spain") {
                            print("Aqui iria la imagen");
                            print(Respuesta().getAnswer().toString());
                            Provider.of<UrlProvider>(context, listen: false)
                                .modificarUrl();
                            Respuesta().getAnswer().then((imagenurlApi) {
                              print("$imagenurlApi ha llegado");
                            });
                          }
                        },
                        child: const Text("Dime la bandera")),
                  ],
                ),
              )
            );
        }
      ),
    );
  }
}
