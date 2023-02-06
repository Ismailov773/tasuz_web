import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tasuz_web/controller/controller.dart';
import '../components/responsive.dart';
import '../models/user.dart';

class CatalogSelectPage extends StatefulWidget {
  const CatalogSelectPage({Key? key}) : super(key: key);

  @override
  State<CatalogSelectPage> createState() => _CatalogSelectPageState();
}

class _CatalogSelectPageState extends State<CatalogSelectPage> {
  final Controller controller = Get.put(Controller());
  var numberFormat = NumberFormat();
  final _formKey = GlobalKey<FormState>();

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _emailFocus = FocusNode();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  var maskFormatter = new MaskTextInputFormatter(
      mask: '(##) ###-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  User newUser = User();

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ваше выбор!"),
        centerTitle: true,
        actions: [
          TextButton.icon(
            icon: Icon(Icons.receipt_rounded),
            onPressed: () {
              showdialog();
            },
            label: Text("Заказать"),
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: isMobile(context) ? 15 : 20)),
              overlayColor: MaterialStateProperty.all(Colors.yellow.shade400),
              backgroundColor:
                  MaterialStateProperty.all(Colors.yellow.withOpacity(0.3)),
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) return Colors.black;
                return Colors.black;
              }),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "${controller.modelSet!.section!.name!} - ${controller.modelSet!.producername} :",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: isDesktop(context) ? 20 : 10,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "модель:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isDesktop(context) ? 17 : 12,
                          ),
                        ),
                        Text(
                          "${(controller.modelSet!.name).toString()}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: isDesktop(context) ? 20 : 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "цены от: ",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: isDesktop(context) ? 17 : 12,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          // "${(_listModelset[index].priceuzs).toString()}",
                          "${numberFormat.format(controller.modelSet!.priceuzs)} cум ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: isDesktop(context) ? 18 : 10,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.network(
                      'https://admin.tascom.uz:8083/api/download/model/${controller.modelSet!.imagepath}',
                      width: isMobile(context)
                          ? MediaQuery.of(context).size.width / 2
                          : MediaQuery.of(context).size.width / 3,
                      height: isMobile(context)
                          ? MediaQuery.of(context).size.height / 3
                          : MediaQuery.of(context).size.height / 2,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      "Описание: ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: isDesktop(context) ? 20 : 10,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${(controller.modelSet!.description).toString()}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: isDesktop(context) ? 17 : 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Характеристика",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: isDesktop(context) ? 20 : 10,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.modelSet!.optionSet!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                              controller.modelSet!.optionSet![index]
                              .optionConstant!.namerus
                              .toString()
                          ),
                          trailing: Text(controller
                              .modelSet!.optionSet![index].optionname!),
                        );
                      })
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Future<void> showdialog() {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            insetPadding: EdgeInsets.all(10),
            content: Container(
              height: !isMobile(context)
                  ? MediaQuery.of(context).size.height / 0.5
                  : MediaQuery.of(context).size.height / 0.5,
              width: !isMobile(context)
                  ? MediaQuery.of(context).size.width / 3
                  : MediaQuery.of(context).size.width / 3,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text(
                    "${controller.modelSet!.section!.name!} - ${controller.modelSet!.producername} :",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: isDesktop(context) ? 20 : 10,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "модель:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: isDesktop(context) ? 17 : 12,
                        ),
                      ),
                      Text(
                        "${(controller.modelSet!.name).toString()}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: isDesktop(context) ? 20 : 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.network(
                    'https://admin.tascom.uz:8083/api/download/model/${controller.modelSet!.imagepath}',
                    width: isMobile(context)
                        ? MediaQuery.of(context).size.width / 3
                        : MediaQuery.of(context).size.width / 4,
                    height: isMobile(context)
                        ? MediaQuery.of(context).size.height / 4
                        : MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.fill,
                  ),
                  Expanded(
                    child: Container(
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          padding: EdgeInsets.all(15),
                          children: [
                            TextFormField(
                              focusNode: _nameFocus,
                              autofocus: true,
                              onFieldSubmitted: (_) {
                                setState(() {
                                  _fieldFocusChange(
                                      context, _nameFocus, _phoneFocus);
                                });

                              },
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: "Ф.И.О. ",
                                // hintText: "What do people call you?",
                                prefixIcon: Icon(Icons.person),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _nameController.clear();
                                  },
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black54, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 2.0)),
                              ),
                              validator: _validateName,
                              onSaved: (value) => newUser.name = value,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              focusNode: _phoneFocus,
                              onFieldSubmitted: (_) {
                                setState(() {
                                  _fieldFocusChange(
                                      context, _phoneFocus, _emailFocus);
                                });

                              },
                              controller: _phoneController,
                              decoration: InputDecoration(
                                labelText: "Номер телефона ",
                                prefixIcon: Icon(Icons.call),
                                prefixText: "+998 ",
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _phoneController.clear();
                                  },
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black54, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 2.0)),
                              ),
                              keyboardType: TextInputType.phone,
                              inputFormatters: [maskFormatter
                              ],
                              validator: (value) => _validatePhoneNumber(value!)
                                  ? null
                                  : "Phone number must be entered as (XXX)XX XXX-XX-XX",
                              onSaved: (value) => newUser.phone = value,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              focusNode: _emailFocus,
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: "Эл.почта ",
                                icon: Icon(Icons.mail),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: _validateEmail,
                              onSaved: (value) => newUser.email = value,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                                onPressed: _submitForm,
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.yellow.shade400)),
                                child: Text("Заказ звонка!", style: TextStyle(fontSize: 20),))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("Name: ${_nameController.text}");
      print("Phone: ${_phoneController.text}");
      print("Email: ${_emailController.text}");
    } else {
      _showMessage(message: "Form is not valid! Please review and correct");
    }
  }

  void _showMessage({String? message}) {
    // _scaffoldKey.currentState.showSnackBar()
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        backgroundColor: Colors.redAccent,
        content: Text(
          message!,
          style: TextStyle(
              color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }

  String? _validateName(String? value) {
    final nameExp = RegExp(r"^[A-Za-z]+$");
    if (value!.isEmpty) {
      return "Name is required.";
    } else if (nameExp.hasMatch(value)) {
      return "Pleaser enter alphabetical characters.";
    } else {
      return null;
    }
  }

  bool _validatePhoneNumber(String input) {
    final phoneExp = RegExp(r'^\d\d \d\d\d-\d\d-\d\d$');
    return phoneExp.hasMatch(input);
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Email cannot be empty!";
    } else if (!_emailController.text.contains('@')) {
      return "Invalid email address";
    } else {
      return null;
    }
  }
}
