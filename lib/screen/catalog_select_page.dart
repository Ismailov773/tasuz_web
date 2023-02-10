import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tasuz_web/controller/controller.dart';
import 'package:tasuz_web/screen/credit_page.dart';
import '../components/responsive.dart';
import '../models/user.dart';

class CatalogSelectPage extends StatefulWidget {
  const CatalogSelectPage({Key? key}) : super(key: key);

  @override
  State<CatalogSelectPage> createState() => _CatalogSelectPageState();
}

class _CatalogSelectPageState extends State<CatalogSelectPage> {
  bool _changeLocal = false;

  final Controller controller = Get.put(Controller());
  var numberFormat = NumberFormat();
  final _formKey = GlobalKey<FormState>();

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _emailFocus = FocusNode();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  var maskFormatter = MaskTextInputFormatter(
      mask: '(##) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  User newUser = User();

  @override
  void initState() {
    super.initState();
  }

  @override
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
        title: Text(_changeLocal ? "Sizning tanlovingiz!" :"Ваше выбор!"),
        centerTitle: true,
        actions: [
          SizedBox(
            width: 30,
          ),
          TextButton.icon(
            icon: const Icon(Icons.receipt_rounded),
            onPressed: () {
              showdialog();
            },
            label: Text(_changeLocal ? "Buyurtma qilish" : "Заказать"),
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
            width: 20,
          ),
          TextButton.icon(
            icon: const Icon(Typicons.calculator),
            onPressed: () {
              Get.to(CreditPage());
            },
            label: Text(_changeLocal ? "Kredit" : "Кредит"),
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
          const SizedBox(
            width: 20,
          ),
          InkWell(
            radius: 20,
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              setState(() {
                _changeLocal = !_changeLocal;
              });
            },
            child: Center(
              child: Text(
                _changeLocal ? 'UZ' : 'RU',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(
            width: 40,
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      _changeLocal
                          ? "${controller.modelSet!.section!.nameuz!} - ${controller.modelSet!.producername} :"
                          : "${controller.modelSet!.section!.name!} - ${controller.modelSet!.producername} :",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: isDesktop(context) ? 20 : 10,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _changeLocal ? "model: " : "модель: ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isDesktop(context) ? 17 : 12,
                          ),
                        ),
                        Text(
                          (controller.modelSet!.name).toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: isDesktop(context) ? 20 : 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _changeLocal ? "boshlang'ich narxi: " : "цены от: ",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: isDesktop(context) ? 17 : 12,
                              fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          _changeLocal
                              ? "${numberFormat.format(controller.modelSet!.priceuzs)} so`m "
                              : "${numberFormat.format(controller.modelSet!.priceuzs)} cум ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: isDesktop(context) ? 18 : 10,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    const SizedBox(
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
                      _changeLocal ? "Tavsifi: " : "Описание: ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: isDesktop(context) ? 20 : 10,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _changeLocal
                          ? (controller.modelSet!.descriptionuz).toString()
                          : (controller.modelSet!.description).toString(),
                      textAlign: TextAlign.justify,
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
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    _changeLocal ? "Xarakteristikasi: " : "Характеристика: ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: isDesktop(context) ? 20 : 10,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.modelSet!.optionSet!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(_changeLocal
                              ? controller.modelSet!.optionSet![index]
                                  .optionConstant!.nameuz
                                  .toString()
                              : controller.modelSet!.optionSet![index]
                                  .optionConstant!.namerus
                                  .toString()),
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
            contentPadding: const EdgeInsets.all(0),
            insetPadding: const EdgeInsets.all(10),
            content: SizedBox(
              height: !isMobile(context)
                  ? MediaQuery.of(context).size.height / 0.5
                  : MediaQuery.of(context).size.height / 0.5,
              width: !isMobile(context)
                  ? MediaQuery.of(context).size.width / 3
                  : MediaQuery.of(context).size.width / 3,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    _changeLocal
                        ? "${controller.modelSet!.section!.nameuz!} - ${controller.modelSet!.producername} :"
                        : "${controller.modelSet!.section!.name!} - ${controller.modelSet!.producername} :",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: isDesktop(context) ? 20 : 10,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _changeLocal ? "model: " : "модель: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: isDesktop(context) ? 17 : 12,
                        ),
                      ),
                      Text(
                        (controller.modelSet!.name).toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: isDesktop(context) ? 20 : 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
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
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        padding: const EdgeInsets.all(15),
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
                              labelText: _changeLocal ? "F.I.SH." : "Ф.И.О. ",
                              // hintText: "What do people call you?",
                              prefixIcon: const Icon(Icons.person),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _nameController.clear();
                                },
                                child: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.redAccent,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 2.0)),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2.0)),
                            ),
                            validator: _validateName,
                            onSaved: (value) => newUser.name = value,
                          ),
                          const SizedBox(
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
                              labelText: _changeLocal ? "Telefon raqamingiz" : "Номер телефона ",
                              prefixIcon: const Icon(Icons.call),
                              prefixText: "+998 ",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _phoneController.clear();
                                },
                                child: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.redAccent,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                      color: Colors.black54, width: 2.0)),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2.0)),
                            ),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [maskFormatter],
                            validator: (value) => _validatePhoneNumber(value!)
                                ? null
                                : _changeLocal ? "Tel raqamingizni kiriting" : "Заполните номер телефона",
                            onSaved: (value) => newUser.phone = value,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            focusNode: _emailFocus,
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: _changeLocal ? "E-mail" : "Эл.почта ",
                              icon: Icon(Icons.mail),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: _validateEmail,
                            onSaved: (value) => newUser.email = value,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                              onPressed: _submitForm,
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.yellow.shade400)),
                              child: Text(_changeLocal ? "Buyurtma berish!":
                                "Заказ звонка!",
                                style: TextStyle(fontSize: 20),
                              ))
                        ],
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
      if (kDebugMode) {
        print("Name: ${_nameController.text}");
      }
      if (kDebugMode) {
        print("Phone: ${_phoneController.text}");
      }
      if (kDebugMode) {
        print("Email: ${_emailController.text}");
      }
    } else {
      _showMessage(message: _changeLocal ? "Forma to`liqmas! Iltimos, ko'rib chiqing va to'g'rilang!" : "Форма недействительна! Пожалуйста, просмотрите и исправьте!");
    }
  }

  void _showMessage({String? message}) {
    // _scaffoldKey.currentState.showSnackBar()
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.redAccent,
        content: Text(
          message!,
          style: const TextStyle(
              color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }

  String? _validateName(String? value) {
    final nameExp = RegExp(r"^[A-Za-z]+$");
    if (value!.isEmpty) {
      return _changeLocal ? "F.I.SH. to`ldirilmagan!" :  "Ф.И.О. не заполнено!";
    } else if (nameExp.hasMatch(value)) {
      return _changeLocal ? "Iltimos alifbo belgilari bilan kiriting!" : "Пожалуйста, введите буквы алфавита.";
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
      return _changeLocal ? "E-mail to`ldirilmagan!" : "Электронная почта не может быть пустой!";
    } else if (!_emailController.text.contains('@')) {
      return _changeLocal ? "Email manzili noto‘g‘ri" : "Неверный адрес электронной почты";
    } else {
      return null;
    }
  }
}
