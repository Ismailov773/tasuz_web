import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasuz_web/components/constants.dart';
import '../components/onhover.dart';
import '../components/responsive.dart';
import '../controller/controller.dart';
import '../models/catalog_service_item.dart';





class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  CatalogServiceItem? catalogServiceItem;
  final Controller _controller = Get.find();
  List<CatalogServiceItem> listCatalogServiceItem = <CatalogServiceItem>[];

  @override
  void initState() {
    super.initState();


    CatalogServiceItem catalogServiceItem = CatalogServiceItem(
      icon: const ImageIcon(
        AssetImage('assets/images/service/1.png'),
        size: 60,
      ),
      title: "Проведение обучения",
      titleuz: "Trening o'tkazish",
      description:
          "Проведем комплексное обучение и консультацию сотрудников по эксплуатации техники китайских брендов",
      descriptionuz:
          "Biz xodimlarga Xitoy brendi uskunalarini ishlatish bo'yicha keng qamrovli treninglar o'tkazamiz va maslahatlar beramiz.",
      imageDialog: Image.asset(
        'assets/images/1.jpg',
        fit: BoxFit.fill,
      ),
      descriptionDialog:
          'Если уделить должное внимание обучению персонала можно продлить срок службы машин и '
          'добиться их максимальной экономической эффективности.',
      descriptionDialoguz:
          "Xodimlarni tayyorlashga to'g'ri e'tibor qaratsangiz, "
          "siz mashinalarning ishlash muddatini uzaytirishingiz va "
          "ularning maksimal iqtisodiy samaradorligiga erishishingiz mumkin.",
    );

    CatalogServiceItem catalogServiceItem2 = CatalogServiceItem(
      icon: const ImageIcon(
        AssetImage('assets/images/service/2.png'),
        size: 60,
      ),
      title: "Ремонт гидравлических систем",
      titleuz: "Gidravlika tizimlarini ta'mirlash",
      description:
          'Ремонт гидравлики спецтехники необходимо выполнят немедленно – как только '
          'обнаружились неполадки.',
      descriptionuz:
          "Maxsus texnikalar gidravlika tizimini muammolar aniqlanganda  ta'mirlash darhol amalga oshirilishi kerak.",
      imageDialog: Image.asset(
        'assets/images/2.jpeg',
        fit: BoxFit.cover,
      ),
      descriptionDialog:
          'Типы ремонтных работ по ходовой части: диагностика, выявление поломок, замена или '
          'починка деталей, консультация заказчиков после ремонта.',
      descriptionDialoguz:
          "Yurish qismini ta'mirlash turlari: diagnostika, buzilishlarni aniqlash, "
          "qismlarni almashtirish yoki ta'mirlash, ta'mirdan keyin mijozlar bilan maslahatlashish. ",
    );

    CatalogServiceItem catalogServiceItem3 = CatalogServiceItem(
      icon: const ImageIcon(
        AssetImage('assets/images/service/3.png'),
        size: 60,
      ),
      title: "Кузовные работы",
      titleuz: "Kuzov ishlari",
      description:
          'Кузововные работы автомобиля, восстановление геометрии кузова, удаление небольших '
          'царапин и сколов.',
      descriptionuz:
          "Avtomobil kuzov ishi, kuzov geometriyasini tiklash, kichik chizilgan "
          "va urilgan joylarini to`g'rilash.",
      imageDialog: Image.asset(
        'assets/images/3.jpeg',
        fit: BoxFit.contain,
      ),
      descriptionDialog:
          'Демонтаж, разборка, дефектовка, рихтовка, сбор и установка различных элементов кузова '
          'машины, шпатлевание дефектовка, полировка лакового покрытия автомобиля и тд.',
      descriptionDialoguz:
          "Demontaj, qismlarga ajratish, nuqsonlarni bartaraf etish, tekislash,"
          "kuzovni turli hil elementlarini yig'ish va o`rnatish, nuqsonli joylarni shuvoqlash, "
          "avtomobil bo`yoq lak qatlamini sayqallash. ",
    );

    CatalogServiceItem catalogServiceItem4 = CatalogServiceItem(
        icon: const ImageIcon(
          AssetImage('assets/images/service/4.png'),
          size: 60,
        ),
        title: "Ремонт блоков управления",
        titleuz: "Boshqaruv bloklarini ta'mirlash",
        description:
            "Ремонт и диагностика блоков управления авто разных моделей, устранение причин поломок.",
        descriptionuz:
            "Turli rusumdagi avtomobillar uchun boshqaruv bloklarini ta'mirlash "
            "va diagnostika qilish, buzilish sabablarini bartaraf etish.",
        imageDialog: Image.asset(
          'assets/images/4.jpeg',
          fit: BoxFit.contain,
        ),
        descriptionDialog:
            "Работы проводимые по блокам управления: блок управления двигателем, блок управления "
            "АКПП, блок управления парктроником, блок комфорта, блоки стеклоподъёмников и прочие блоки.",
        descriptionDialoguz:
            "Boshqarish bloklarida amalga oshirilgan ishlar: dvigatelni boshqarish bloki, "
            "avtomat uzatmani boshqarish bloki, to'xtash sensori boshqaruv bloki, "
            "konfor bloki, elektr oyna bloklari va boshqa birliklar.");

    CatalogServiceItem catalogServiceItem5 = CatalogServiceItem(
        icon: const ImageIcon(
          AssetImage('assets/images/service/5.png'),
          size: 60,
        ),
        title: "Электрические работы",
        titleuz: "Elektr ishlari",
        description:
            "Диагностика и ремонт электрической части техники, устранение неполадок в "
            "электрооборудовании.",
        descriptionuz:
            "Uskunaning elektr qismini diagnostika qilish va ta'mirlash, "
            "elektr jihozlaridagi nosozliklarni bartaraf etish.",
        imageDialog: Image.asset(
          'assets/images/5.jpeg',
          fit: BoxFit.contain,
        ),
        descriptionDialog:
            "Полная компьютерная диагностика на предмет выявления неисправностей с контактами; "
            "замена проводов, разъемов, штекеров; поиск и устранение неисправностей проводки и тд.",
        descriptionDialoguz:
            "Kontaktlardagi nosozliklarni aniqlash uchun to'liq kompyuter diagnostikasi,"
            " simlarni, ulagichlarni, vilkalarni almashtirish; simlar bilan bog'liq muammolarni bartaraf etish va boshqalar.");

    CatalogServiceItem catalogServiceItem6 = CatalogServiceItem(
      icon: const ImageIcon(
        AssetImage('assets/images/service/6.png'),
        size: 60,
      ),
      title: "Ремонт КПП",
      titleuz: "Uzatish qutisini ta'mirlash",
      description:
          "Проверка работоспособности АКПП и МКПП, определить неисправность коробки или другого "
          "механизма.",
      descriptionuz:
          "Avtomatik uzatish va mexanik uzatishning ishlashini tekshirish, "
          "qutining yoki boshqa mexanizmning noto'g'ri ishlashini aniqlash.",
      imageDialog: Image.asset(
        'assets/images/6.jpeg',
        fit: BoxFit.contain,
      ),
      descriptionDialog:
          "Выполнение ремонта поделятся на фазы: демонтаж, разборка с дефекацией узлов механизма, "
          "устранение дефектов, сборка и монтаж, выполнение необходимых регулировок сцепления.",
      descriptionDialoguz:
          "Ta'mirlash bosqichlarga bo'linadi: demontaj, mexanizm komponentlarini "
          "defekatsiya qilish bilan demontaj qilish, nuqsonlarni bartaraf etish, yig'ish va o'rnatish,"
          " debriyajni kerakli sozlashlarni amalga oshirish.",
    );

    CatalogServiceItem catalogServiceItem7 = CatalogServiceItem(
      icon: const ImageIcon(
        AssetImage('assets/images/service/7.png'),
        size: 60,
      ),
      title: "Ремонт тормозной системы",
      titleuz: "Tormoz tizimini ta'mirlash",
      description:
          "Ремонт тормозных механизмов колесной базы при утечки жидкостей, изнашевание наклодок "
          "или колодок.",
      descriptionuz:
          "Suyuqlikning oqishi, prokladkalar yoki prokladkalarning eskirishi holatlarida "
          "g'ildirak bazasi tormoz mexanizmlarini ta'mirlash.",
      imageDialog: Image.asset(
        'assets/images/7.jpeg',
        fit: BoxFit.contain,
      ),
      descriptionDialog:
          "Типы ремонтных работ по ходовой части: замена передних и задних тормозных колодок, "
          "задних накладок, колодок, шланговые трубки, ремонт усилителя тормозов.",
      descriptionDialoguz:
          "Yurish moslamalarida ta'mirlash ishlarining turlari: "
          "old va orqa tormoz prokladkalarini, orqa prokladkalarni, prokladkalarni, "
          "shlang quvurlarini almashtirish, tormoz kuchaytirgichini ta'mirlash.",
    );

    CatalogServiceItem catalogServiceItem8 = CatalogServiceItem(
      icon: const ImageIcon(
        AssetImage('assets/images/service/8.png'),
        size: 60,
      ),
      title: "Ремонт ходовой части",
      titleuz: "Yurish qismini ta'mirlash",
      description:
          "Полный анализ работоспособности ходовой части машины и выявление все имеющиеся "
          "неполадки и поломки.",
      descriptionuz:
          "Mashinaning yurish moslamasining ishlashini to'liq tahlil qilish "
          "va barcha mavjud muammolar va buzilishlarni aniqlash.",
      imageDialog: Image.asset(
        'assets/images/8.jpeg',
        fit: BoxFit.contain,
      ),
      descriptionDialog:
          "Типы ремонтных работ по ходовой части: протяжка соединений подвесок, регулировка "
          "развала и схождения. Замена механизмов и узлов: пружин, опор, наконечников рулевой тяги и тд",
      descriptionDialoguz: "Yurish qismida ta'mirlash ishlarining turlari: "
          "osma ulanishlarini cho`zish, kamber va konvergentsiyani sozlash. "
          "Mexanizmlar va agregatlarni almashtirish: prujinalar, tayanchlar, rul tayog'i uchlari va boshqalar.",
    );

    CatalogServiceItem catalogServiceItem9 = CatalogServiceItem(
      icon: const ImageIcon(
        AssetImage('assets/images/service/9.png'),
        size: 60,
      ),
      title: "Ремонт топливных систем",
      titleuz: "Yoqilg'i tizimlarini ta'mirlash",
      description:
          "Проверка и ремонт системы питания двигателя, исправность насосных фильтров.",
      descriptionuz:
          "Dvigatel quvvat tizimini va nasos filtrlarining to'g'ri ishlashini tekshirish va ta'mirlash.",
      imageDialog: Image.asset(
        'assets/images/9.jpeg',
        fit: BoxFit.contain,
      ),
      descriptionDialog:
          "Услуги по ремонту топливных систем: промывка и замена форсунок, электробензонасоса или "
          "воздушного фильтра, промывка расходомера воздуха.",
      descriptionDialoguz:
          "Yoqilg'i tizimini ta'mirlash xizmatlari: injektorlarni, "
          "elektr yonilg'i pompasini yoki havo filtrini yuvish va almashtirish, "
          "havo oqimi o'lchagichni yuvish.",
    );

    CatalogServiceItem catalogServiceItem10 = CatalogServiceItem(
      icon: const ImageIcon(
        AssetImage('assets/images/service/10.png'),
        size: 60,
      ),
      title: "Ремонт двигателей",
      titleuz: "Dvigatelni ta'mirlash",
      description:
          "Диагностика силового агрегата транспортного средства с исправлен исправлением "
          "неисправностей.",
      descriptionuz:
          "Avtomobilning quvvat blokining diagnostikasi kuchli xatolarni tuzatish bilan.",
      imageDialog: Image.asset(
        'assets/images/10.jpeg',
        fit: BoxFit.contain,
      ),
      descriptionDialog:
          "Типы ремонтных работ в двигателе: диагностика, капремонт, замена свечей, сальников, "
          "поршневых колец, гофры, натяжного ролика ГРМ, замеры компрессии и давления масла.",
      descriptionDialoguz:
          "Dvigatelda ta'mirlash ishlarining turlari: diagnostika, "
          "kapital ta'mirlash, svechalarni, muhrlarni, piston halqalarini, "
          "gofrirovkalarni almashtirish, gaz taqsimlash mexanizmi kuchlanish rolikini, "
          "siqish va yog' bosimini o'lchash.",
    );

    CatalogServiceItem catalogServiceItem11 = CatalogServiceItem(
      icon: const ImageIcon(
        AssetImage('assets/images/service/11.png'),
        size: 60,
      ),
      title: "Проведение комплексного ТО",
      titleuz: "Kompleks texnik xizmat ko'rsatishni amalga oshirish",
      description:
          "Плановое ТО включает в себя работы, которые необходимо проводить в строго определенный "
          "срок.",
      descriptionuz:
          "Rejali texnik xizmat ko'rsatish qat'iy belgilangan vaqtda "
          "bajarilishi kerak bo'lgan ishlarni o'z ichiga oladi.",
      imageDialog: Image.asset(
        'assets/images/11.jpeg',
        fit: BoxFit.contain,
      ),
      descriptionDialog:
          "Подробная проверка блоков с целью выявить изменение пробега и определить его реальное "
          "значение, сканирование всех электронных блоков.",
      descriptionDialoguz:
          "Kilometrning o'zgarishini aniqlash va uning haqiqiy qiymatini aniqlash "
          "uchun bloklarni batafsil tekshirish, barcha elektron bloklarni skanerlash",
    );

    CatalogServiceItem catalogServiceItem12 = CatalogServiceItem(
      icon: const ImageIcon(
        AssetImage('assets/images/service/12.png'),
        size: 60,
      ),
      title: "Компьютерная диагностика",
      titleuz: "Kompyuter diagnostikasi",
      description:
          "Это позволит избежать не нужной замены масла, промывки гидроблока или чистки соленоида.",
      descriptionuz:
          "Bu keraksiz yog' almashinuvini, gidroblokni yuvishni yoki solenoidni tozalashni oldini oladi.",
      imageDialog: Image.asset(
        'assets/images/12.jpeg',
        fit: BoxFit.contain,
      ),
      descriptionDialog:
          "Сбор анамнеза, чтение имеющихся и сохранённых ошибок, просмотр потока данных, "
          "логирование данных «в движении», опрос и сопоставление, тесты исполнительных механизмов и т.д.",
      descriptionDialoguz:
          "Tarixni olish, mavjud va saqlangan xatolarni o'qish, "
          "ma'lumotlar oqimini ko'rish, 'harakatdagi' ma'lumotlarni jurnalga kiritish, "
          "so'roq qilish va taqqoslash, aktuatorlarning sinovlari va boshqalar.",
    );

    listCatalogServiceItem = <CatalogServiceItem>[
      catalogServiceItem,
      catalogServiceItem2,
      catalogServiceItem3,
      catalogServiceItem4,
      catalogServiceItem5,
      catalogServiceItem6,
      catalogServiceItem7,
      catalogServiceItem8,
      catalogServiceItem9,
      catalogServiceItem10,
      catalogServiceItem11,
      catalogServiceItem12,
    ].toList();
    // _controller.changeLocale();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // decoration: stylePageBackground(context),
      height: isMobile(context)
          ? MediaQuery.of(context).size.height * 2
          : MediaQuery.of(context).size.height * 2.1,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/tassvg.svg",
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
                Obx(() => Text(
                    _controller.changeLocal.isFalse
                        ? "Servis markazi"
                        : 'Сервисный центр',
                    style: styleTitle(context))),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(() => Text(
                  _controller.changeLocal.isFalse
                      ? "TAS ishning barcha jabhalarida yuqori sifatli xizmat ko'rsatishga intiladi. Bizning maqsadimiz - yuqori sifatli avto ta'mirlash, mijozlarga xizmat ko'rsatish va arzon narxlar orqali qiymat berishdir. TAS umumiy ta'mirlashdan tashqari keng qamrovli xizmatlarni taklif etadi. Biz o'rtacha narxda eng yaxshi xizmatni taklif qilamiz."
                          "Mehnat odob-axloqidan biznes aloqalarigacha, bizning maqsadimiz doimo halol va tushunarli bo'lishdir. "
                          "Biz mijozlar, hamjamiyat va yetkazib beruvchilar bilan uzoq muddatli munosabatlarimizni qadrlaymiz."
                      : "TAS стремится к высочайшему качеству обслуживания во всех аспектах работы. Наша цель состоит в том, чтобы обеспечить ценность за счет высококачественного ремонта автомобилей, обслуживания клиентов и доступных цен. TAS предлагает комплексные услуги, выходящие за рамки общего ремонта. Мы предлагаем лучший сервис по разумной цене."
                          " От рабочей этики до делового взаимодействия наша цель — всегда быть честными и понимающими. "
                          "Мы ценим наши долгосрочные отношения с клиентами, сообществами, поставщиками и арендодателями.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Colors.black.withOpacity(0.6)),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(
              height: 50,
            ),
            getCatalog(),
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
            insetPadding: const EdgeInsets.all(100),
            content: SizedBox(
              height: !isMobile(context)
                  ? MediaQuery.of(context).size.height / 1
                  : MediaQuery.of(context).size.height / 1,
              width: !isMobile(context)
                  ? MediaQuery.of(context).size.width / 1.5
                  : MediaQuery.of(context).size.width / 1,
              child: !isMobile(context)
                  ? Row(
                      children: [
                        catalogServiceItem!.imageDialog,
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: !isMobile(context)
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.center,
                              crossAxisAlignment: !isMobile(context)
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    catalogServiceItem!.icon,
                                    IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: const Icon(
                                          Icons.cancel_outlined,
                                          size: 30,
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  _controller.changeLocal.isFalse
                                      ? catalogServiceItem!.titleuz
                                      : catalogServiceItem!.title,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Obx(() => Text(
                                      _controller.changeLocal.isFalse
                                          ? catalogServiceItem!.descriptionuz
                                          : catalogServiceItem!.description,
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Obx(() => Text(
                                      _controller.changeLocal.isFalse
                                          ? catalogServiceItem!
                                              .descriptionDialoguz
                                          : catalogServiceItem!
                                              .descriptionDialog,
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        catalogServiceItem!.imageDialog,
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: !isMobile(context)
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.center,
                            crossAxisAlignment: !isMobile(context)
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  catalogServiceItem!.icon,
                                  IconButton(
                                      onPressed: () => Navigator.pop(context),
                                      icon: const Icon(
                                        Icons.cancel_outlined,
                                        size: 30,
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Obx(() => Text(
                                    _controller.changeLocal.isFalse
                                        ? catalogServiceItem!.titleuz
                                        : catalogServiceItem!.title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Obx(() => Text(
                                    _controller.changeLocal.isFalse
                                        ? catalogServiceItem!.descriptionuz
                                        : catalogServiceItem!.description,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Obx(() => Text(
                                    _controller.changeLocal.isFalse
                                        ? catalogServiceItem!
                                            .descriptionDialoguz
                                        : catalogServiceItem!.descriptionDialog,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          );
        });
  }

  Widget getCatalog() {
    if (isMobile(context)) assert(debugCheckHasMaterial(context));
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: !isMobile(context) ? 13 / 8 : 3 / 3,
        crossAxisCount: !isMobile(context) ? 3 : 2,
        crossAxisSpacing: !isMobile(context) ? 20 : 10,
        mainAxisSpacing: !isMobile(context) ? 20 : 10,
      ),
      itemCount: listCatalogServiceItem.length,
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () {
          switch (index) {
            case 0:
              {
                catalogServiceItem = listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 1:
              {
                catalogServiceItem = listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 2:
              {
                catalogServiceItem = listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 3:
              {
                catalogServiceItem = listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 4:
              {
                catalogServiceItem = listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 5:
              {
                catalogServiceItem = listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 6:
              {
                catalogServiceItem = listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 7:
              {
                catalogServiceItem = listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 8:
              {
                catalogServiceItem = listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 9:
              {
                catalogServiceItem = listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 10:
              {
                catalogServiceItem = listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 11:
              {
                catalogServiceItem = listCatalogServiceItem[index];
                showdialog();
              }
              break;
          }
        },
        child: OnHover(
          builder: (isHovered) {
            final color = isHovered
                ? Colors.yellow.shade400
                : const Color.fromRGBO(235, 235, 235, 95);
            return PhysicalModel(
              color: Colors.white60,
              shadowColor: Colors.lime,
              elevation: isHovered ? 10 : 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                color: color,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ShaderMask(
                              blendMode: BlendMode.srcATop,
                              shaderCallback: (bounds) => const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.yellow, Colors.black])
                                  .createShader(bounds),
                              child: listCatalogServiceItem[index].icon,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Obx(() => Text(
                                    _controller.changeLocal.isFalse
                                        ? listCatalogServiceItem[index].titleuz
                                        : listCatalogServiceItem[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: isDesktop(context) ? 20 : 12,
                                      fontWeight: isHovered
                                          ? FontWeight.w900
                                          : FontWeight.bold,
                                    ),
                                  )),
                            )
                          ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Obx(() => Text(
                              _controller.changeLocal.isFalse
                                  ? listCatalogServiceItem[index]
                                      .descriptionuz
                                      .toString()
                                  : listCatalogServiceItem[index]
                                      .description
                                      .toString(),
                              textAlign: isMobile(context)
                                  ? TextAlign.justify
                                  : TextAlign.justify,
                              style: TextStyle(
                                color: isHovered
                                    ? Colors.lightBlueAccent
                                    : Colors.black54,
                                fontSize: isDesktop(context) ? 17 : 9,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        _controller.changeLocal.isFalse
                            ? "Davomini o`qish → "
                            : "Читать далее → ",
                        style: TextStyle(
                            color: isHovered ? Colors.black : Colors.black54,
                            fontSize: isDesktop(context) ? 17 : 10,
                            fontStyle: FontStyle.italic,
                            fontWeight: isHovered
                                ? FontWeight.w500
                                : FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


