import 'package:bim_assist_test/src/core/resources/assets.gen.dart';
import 'package:bim_assist_test/src/feature/page/home_page.dart';
import 'package:flutter/material.dart';

@immutable
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  /// Контроллер для вкладок Обзор, Услуги
  final TabController tabController;

  /// Виджет шапки
  const AppBarWidget({
    required this.tabController,
    super.key,
  });

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: const Color.fromRGBO(253, 253, 253, 1),
        leading: const _TitleLeading(),
        title: const _TittleAppBar(),
        actions: const [
          _TitleAction(),
        ],
        bottom: TabBarWidget(tabController: tabController, rating: 4.2),
      );

  @override
  Size get preferredSize => const Size.fromHeight(98 + 54);
}

@immutable
class _TitleLeading extends StatelessWidget {
  /// Икнока назад
  const _TitleLeading({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
        icon: Assets.icons.arrowLeft.svg(
          width: 24,
          height: 24,
          color: const Color.fromRGBO(123, 97, 255, 1),
        ),
        onPressed: () {},
      );
}

@immutable
class _TittleAppBar extends StatelessWidget {
  /// Заголовок в шапке
  const _TittleAppBar({super.key});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          // Лого
          SizedBox.square(
            dimension: 46,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(229, 223, 255, 1),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: Assets.icons.home.svg(
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ),
          // Title текст
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Название',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Assets.icons.circleCheck.svg(),
                    ),
                  ],
                ),
                const Text(
                  'г Воронеж, пл. Ленина, 1',
                  style: TextStyle(
                    color: Color.fromRGBO(110, 110, 110, 1),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      );
}

@immutable
class _TitleAction extends StatelessWidget {
  /// Кнопка лайк
  const _TitleAction({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 16, left: 11),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(253, 239, 232, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Assets.icons.heart.svg(
              height: 12,
              width: 12,
            ),
          ),
        ),
      );
}

@immutable
class TabBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final double rating;

  /// TabBar для bottom виджета
  const TabBarWidget({
    required this.tabController,
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _Rating(
                    rating: rating,
                  ),
                  Text('$rating'),
                  const SizedBox(width: 4),
                  const Expanded(
                    child: Text('12 оценок'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      height: 32,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(124, 98, 255, 1),
                              Color.fromRGBO(186, 98, 255, 1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(123, 97, 255, 0.1),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            onSurface: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Записаться',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TabBar(
                controller: tabController,
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                isScrollable: true,
                labelColor: const Color.fromRGBO(123, 97, 255, 1),
                indicatorWeight: 3,
                padding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.label,
                tabAlignment: TabAlignment.start,
                unselectedLabelColor: const Color.fromRGBO(159, 159, 159, 1),
                tabs: List.generate(
                  TabBarMenu.values.length,
                  (index) => Tab(
                    child: Row(
                      children: [
                        Text(TabBarMenu.values[index].name),
                        if (index == 1) const _Badge(),
                      ],
                    ),
                    height: 32,
                    // text: TabBarMenu.values[index].name,
                  ),
                ),
              ),
              const Expanded(
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: Color.fromRGBO(76, 93, 117, 0.3),
                ),
              )
            ],
          ),
        ],
      );

  @override
  Size get preferredSize => const Size.fromHeight(98);
}

@immutable
class _Badge extends StatelessWidget {
  /// Иконка для tabBar
  const _Badge({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.only(left: 4),
        child: SizedBox.square(
          dimension: 16,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromRGBO(187, 176, 243, 1),
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Center(
              child: Text(
                '10',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
}

@immutable
class _Rating extends StatelessWidget {
  final double rating;

  /// Виджет рейтинга
  const _Rating({
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: List.generate(
          5,
          (index) => index + 1 <= rating.round()
              ? Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Assets.icons.starFill.svg(),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Assets.icons.star.svg(),
                ),
        ),
      );
}
