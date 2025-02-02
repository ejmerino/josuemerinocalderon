import 'package:flutter/material.dart';
import '../model/menu_option_model.dart';
import '../view/main_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../view/map_screen.dart';

class AppMenuController {
  // Aquí empieza la definición de la clase AppMenuController

  List<MenuOption> getMenuOptions(BuildContext context) {
    return [
      MenuOption(
        title: 'Pagos de servicios básicos',
        icon: Icons.payment,
        onTap: () {
          launchURL(
              'https://www.pichincha.com/detalle-producto/pymes-servicios-pagos-de-servicios-publicos-y-privados'); // Reemplaza con la URL real
        },
      ),
      MenuOption(
        title: 'Empresa eléctrica',
        icon: Icons.lightbulb,
        onTap: () {
          launchURL(
              'https://www.empresa-electrica.com'); // URL de la empresa eléctrica
        },
      ),
      MenuOption(
        title: 'CNT',
        icon: Icons.phone,
        onTap: () {
          launchURL('https://www.cnt.com.ec'); // URL de CNT
        },
      ),
    ];
  }

  // Función para lanzar la URL
  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se puede abrir la URL: $url';
    }
  }
}
