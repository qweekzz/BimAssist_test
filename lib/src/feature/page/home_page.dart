import 'package:bim_assist_test/src/feature/page/widgets/widgets.dart';
import 'package:flutter/material.dart';

@immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  /// TabController для управление табами (обычно использую AutoTabsRouter, но сейчас сделал дефолтный)
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarWidget(
          tabController: _tabController,
        ),
        body: _BodyLayout(
          tabController: _tabController,
        ),
        backgroundColor: const Color.fromRGBO(253, 253, 253, 1),
      );
}

@immutable
class _BodyLayout extends StatefulWidget {
  /// TabController для вкладок
  final TabController tabController;
  const _BodyLayout({required this.tabController, super.key});

  @override
  State<_BodyLayout> createState() => _BodyLayoutState();
}

class _BodyLayoutState extends State<_BodyLayout>
    with TickerProviderStateMixin {
  /// TabController для вкладок про животных
  late final TabController _animalTab;

  @override
  void initState() {
    super.initState();
    _animalTab = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _animalTab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TabBarView(
        controller: widget.tabController,
        children: [
          const ViewTab(),
          ServiceTab(animalTab: _animalTab),
        ],
      );
}

/// Данные для вкладок
enum TabBarMenu {
  view(
    'Обзор',
  ),

  services(
    'Услуги',
  );

  final String name;

  const TabBarMenu(this.name);
}

/// Данные для разделов про животных
enum AnimalTab {
  cat(
    'Кошки',
  ),

  dog(
    'Собаки',
  );

  final String name;

  const AnimalTab(this.name);
}
