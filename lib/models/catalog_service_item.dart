import 'package:flutter/cupertino.dart';

class CatalogServiceItem {
  // IconData icon;
  ImageIcon icon;
  String title;
  String description;
  Image imageDialog;
  String descriptionDialog;



  CatalogServiceItem(
      {required this.icon,
        required this.title,
        required this.description,
        required this.imageDialog,
        required this.descriptionDialog,
      });

  @override
  String toString() {
    return 'CatalogServiceItem{'
        'icon: $icon, '
        'title: $title, '
        'description: $description, '
        'image: $imageDialog, '
        'description_dialog: $descriptionDialog }';
  }
}
