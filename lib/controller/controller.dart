import 'package:flutter/foundation.dart';
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
  final count = 0.obs;
  increment() => count.value++;
  ModelSet? modelSet;
  OptionSet? optionSet;



  List<CatalogServiceItem> listCatalogServiceItem = <CatalogServiceItem>[].obs;

  final ApiConnector _apiConnector = ApiConnector();

  @override
  void onInit() {
    super.onInit();
    homeController;
    fetchNews();
    fetchProducer();
    changeModelSet;
    changeOptionSet;


    // _controller.listProducer.forEach((element) {
    //   _listModel = element.modelSet!.where((element) => element.section!.id == _controller.section!.id).toList();





    CatalogServiceItem catalogServiceItem = CatalogServiceItem(
        icon: const ImageIcon(
          AssetImage('assets/images/service/1.png'),
          size: 60,
        ),
        title: "Проведение обучения",
        description:
            "Проведем комплексное обучение и консультацию сотрудников по эксплуатации техники китайских брендов",
        imageDialog: Image.asset(
          'assets/images/1.jpg',
          fit: BoxFit.fill,
        ),
        descriptionDialog:
            'Если уделить должное внимание обучению персонала можно продлить срок службы машин и '
            'добиться их максимальной экономической эффективности.');
    CatalogServiceItem catalogServiceItem2 = CatalogServiceItem(
        icon: const ImageIcon(
          AssetImage('assets/images/service/2.png'),
          size: 60,
        ),
        title: "Ремонт гидравлических систем",
        description:
            'Ремонт гидравлики спецтехники необходимо выполнят немедленно – как только '
            'обнаружились неполадки.',
        imageDialog: Image.asset(
          'assets/images/2.jpeg',
          fit: BoxFit.cover,
        ),
        descriptionDialog:
            'Типы ремонтных работ по ходовой части: диагностика, выявление поломок, замена или '
            'починка деталей, консультация заказчиков после ремонта.');
    CatalogServiceItem catalogServiceItem3 = CatalogServiceItem(
        icon: ImageIcon(
          AssetImage('assets/images/service/3.png'),
          size: 60,
        ),
        title: "Кузовные работы",
        description:
            'Кузововные работы автомобиля, восстановление геометрии кузова, удаление небольших '
            'царапин и сколов.',
        imageDialog: Image.asset(
          'assets/images/3.jpeg',
          fit: BoxFit.contain,
        ),
        descriptionDialog:
            'Демонтаж, разборка, дефектовка, рихтовка, сбор и установка различных элементов кузова '
            'машины, шпатлевание дефектовка, полировка лакового покрытия автомобиля и тд.');
    CatalogServiceItem catalogServiceItem4 = CatalogServiceItem(
        icon: ImageIcon(
          AssetImage('assets/images/service/4.png'),
          size: 60,
        ),
        title: "Ремонт блоков управления",
        description:
            "Ремонт и диагностика блоков управления авто разных моделей, устранение причин поломок.",
        imageDialog: Image.asset(
          'assets/images/4.jpeg',
          fit: BoxFit.contain,
        ),
        descriptionDialog:
            "Работы проводимые по блокам управления: блок управления двигателем, блок управления "
            "АКПП, блок управления парктроником, блок комфорта, блоки стеклоподъёмников и прочие блоки.");
    CatalogServiceItem catalogServiceItem5 = CatalogServiceItem(
        icon: ImageIcon(
          AssetImage('assets/images/service/5.png'),
          size: 60,
        ),
        title: "Электрические работы",
        description:
            "Диагностика и ремонт электрической части техники, устранение неполадок в "
            "электрооборудовании.",
        imageDialog: Image.asset(
          'assets/images/5.jpeg',
          fit: BoxFit.contain,
        ),
        descriptionDialog:
            "Полная компьютерная диагностика на предмет выявления неисправностей с контактами; "
            "замена проводов, разъемов, штекеров; поиск и устранение неисправностей проводки и тд.");
    CatalogServiceItem catalogServiceItem6 = CatalogServiceItem(
        icon: ImageIcon(
          AssetImage('assets/images/service/6.png'),
          size: 60,
        ),
        title: "Ремонт КПП",
        description:
            "Проверка работоспособности АКПП и МКПП, определить неисправность коробки или другого "
            "механизма.",
        imageDialog: Image.asset(
          'assets/images/6.jpeg',
          fit: BoxFit.contain,
        ),
        descriptionDialog:
            "Выполнение ремонта поделятся на фазы: демонтаж, разборка с дефекацией узлов механизма, "
            "устранение дефектов, сборка и монтаж, выполнение необходимых регулировок сцепления.");
    CatalogServiceItem catalogServiceItem7 = CatalogServiceItem(
        icon: ImageIcon(
          AssetImage('assets/images/service/7.png'),
          size: 60,
        ),
        title: "Ремонт тормозной системы",
        description:
            "Ремонт тормозных механизмов колесной базы при утечки жидкостей, изнашевание наклодок "
            "или колодок.",
        imageDialog: Image.asset(
          'assets/images/7.jpeg',
          fit: BoxFit.contain,
        ),
        descriptionDialog:
            "Типы ремонтных работ по ходовой части: замена передних и задних тормозных колодок, "
            "задних накладок, колодок, шланговые трубки, ремонт усилителя тормозов.");
    CatalogServiceItem catalogServiceItem8 = CatalogServiceItem(
        icon: ImageIcon(
          AssetImage('assets/images/service/8.png'),
          size: 60,
        ),
        title: "Ремонт ходовой части",
        description:
            "Полный анализ работоспособности ходовой части машины и выявление все имеющиеся "
            "неполадки и поломки.",
        imageDialog: Image.asset(
          'assets/images/8.jpeg',
          fit: BoxFit.contain,
        ),
        descriptionDialog:
            "Типы ремонтных работ по ходовой части: протяжка соединений подвесок, регулировка "
            "развала и схождения; замена механизмов и узлов: пружин, опор, наконечников рулевой тяги и тд");
    CatalogServiceItem catalogServiceItem9 = CatalogServiceItem(
        icon: ImageIcon(
          AssetImage('assets/images/service/9.png'),
          size: 60,
        ),
        title: "Ремонт топливных систем",
        description:
            "Проверка и ремонт системы питания двигателя, исправность насосных фильтров.",
        imageDialog: Image.asset(
          'assets/images/9.jpeg',
          fit: BoxFit.contain,
        ),
        descriptionDialog:
            "Услуги по ремонту топливных систем: промывка и замена форсунок, электробензонасоса или "
            "воздушного фильтра, промывка расходомера воздуха.");
    CatalogServiceItem catalogServiceItem10 = CatalogServiceItem(
        icon: const ImageIcon(
          AssetImage('assets/images/service/10.png'),
          size: 60,
        ),
        title: "Ремонт двигателей",
        description:
            "Диагностика силового агрегата транспортного средства с исправлен исправлением "
            "неисправностей.",
        imageDialog: Image.asset(
          'assets/images/10.jpeg',
          fit: BoxFit.contain,
        ),
        descriptionDialog:
            "Типы ремонтных работ в двигателе: диагностика, капремонт, замена свечей, сальников, "
            "поршневых колец, гофры, натяжного ролика ГРМ, замеры компрессии и давления масла.");
    CatalogServiceItem catalogServiceItem11 = CatalogServiceItem(
        icon: const ImageIcon(
          AssetImage('assets/images/service/11.png'),
          size: 60,
        ),
        title: "Проведеные комплексного ТО",
        description:
            "Плановое ТО включает в себя работы, которые необходимо проводить в строго определенный "
            "срок.",
        imageDialog: Image.asset(
          'assets/images/11.jpeg',
          fit: BoxFit.contain,
        ),
        descriptionDialog:
            "Подробная проверка блоков с целью выявить изменение пробега и определить его реальное "
            "значение, сканирование всех электронных блоков");
    CatalogServiceItem catalogServiceItem12 = CatalogServiceItem(
        icon: ImageIcon(
          AssetImage('assets/images/service/12.png'),
          size: 60,
        ),
        title: "Компьютерная диагностика",
        description:
            "Это позволит избежать не нужной замены масла, промывки гидроблока или чистки соленоида.",
        imageDialog: Image.asset(
          'assets/images/12.jpeg',
          fit: BoxFit.contain,
        ),
        descriptionDialog:
            "Сбор анамнеза, чтение имеющихся и сохранённых ошибок, просмотр потока данных, "
            "логирование данных «в движении», опрос и сопоставление, тесты исполнительных механизмов и т.д.");

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

  changeModelSet(ModelSet modelSet) {
    this.modelSet = modelSet;
  }
  changeOptionSet(OptionSet optionSet){
    this.optionSet = optionSet;
  }

  fetchProducer() async {
    listProducer = await _apiConnector.getProducer();
  }

  fetchNews() async {
    listNewsItem = await _apiConnector.getNews();
  }
}



