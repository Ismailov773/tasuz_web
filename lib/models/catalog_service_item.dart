import 'package:flutter/cupertino.dart';

class CatalogServiceItem {
  // IconData icon;
  ImageIcon icon;
  String title;
  String titleuz;
  String description;
  String descriptionuz;
  Image imageDialog;
  String descriptionDialog;
  String descriptionDialoguz;



  CatalogServiceItem(
      {required this.icon,
        required this.title,
        required this.titleuz,
        required this.description,
        required this.descriptionuz,
        required this.imageDialog,
        required this.descriptionDialog,
        required this.descriptionDialoguz,
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
