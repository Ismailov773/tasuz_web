import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasuz_web/models/producers/ModelSet.dart';
import 'package:tasuz_web/models/producers/Section.dart';
import '../models/catalog_service_item.dart';
import '../models/news_item.dart';
import '../models/producers/OptionSet.dart';
import '../models/producers/Producer.dart';
import '../service/apiconnect.dart';

class Controller extends GetxController {
  final ScrollController homeController = ScrollController();

  List<Producer> listProducer = <Producer>[].obs;
  List<NewsItem> listNewsItem = <NewsItem>[].obs;
  List<Section> listSection = <Section>[].obs;
  List<ModelSet> listModelSet = <ModelSet>[].obs;
  List<OptionSet> listOptionSet = <OptionSet>[].obs;

  ModelSet? modelSet;
  OptionSet? optionSet;

  List<CatalogServiceItem> listCatalogServiceItem = <CatalogServiceItem>[].obs;

  final ApiConnector _apiConnector = ApiConnector();

  RxBool changeLocal = false.obs;

  @override
  void onInit() {
    super.onInit();
    homeController;
    fetchNews();
    fetchProducer();
    changeModelSet;
    changeOptionSet;
    changeLocale();

    // _controller.listProducer.forEach((element) {
    //   _listModel = element.modelSet!.where((element) => element.section!.id == _controller.section!.id).toList();

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
  }

  changeLocale() {
    changeLocal.toggle();
  }

  changeModelSet(ModelSet modelSet) {
    this.modelSet = modelSet;
  }

  changeOptionSet(OptionSet optionSet) {
    this.optionSet = optionSet;
  }

  fetchProducer() async {
    listProducer = await _apiConnector.getProducer();
  }

  fetchNews() async {
    listNewsItem = await _apiConnector.getNews();
  }
}
