import 'package:bim_assist_test/src/core/resources/assets.gen.dart';
import 'package:bim_assist_test/src/feature/page/home_page.dart';
import 'package:flutter/material.dart';

@immutable
class ServicesCard extends StatefulWidget {
  final int index;

  const ServicesCard({
    required this.index,
    super.key,
  });

  @override
  State<ServicesCard> createState() => _ServicesCardState();
}

class _ServicesCardState extends State<ServicesCard> {
  late final ValueNotifier<List<int>> _expandedController;

  @override
  void initState() {
    super.initState();
    _expandedController = ValueNotifier<List<int>>([]);
  }

  @override
  void dispose() {
    _expandedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(123, 97, 255, 0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: AnimatedBuilder(
          animation: _expandedController,
          builder: (context, child) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Комплексные услуги'),
                    SizedBox(
                      width: 24,
                      height: 24,
                      // нужна еще крутящая анимация но потом
                      child: IconButton(
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          if (_expandedController.value
                              .any((element) => element == widget.index)) {
                            _expandedController.value =
                                List.from(_expandedController.value)
                                  ..removeWhere(
                                      (element) => element == widget.index);
                          } else {
                            _expandedController.value =
                                List.from(_expandedController.value)
                                  ..add(widget.index);
                          }
                        },
                        icon: Assets.icons.arrowDown
                            .svg(height: 16, width: 16, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                if (_expandedController.value.contains(widget.index))
                  const _ContentList()
                else
                  const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      );
}

@immutable
class _ContentList extends StatelessWidget {
  const _ContentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Divider(
              height: 1,
            ),
          ),
          itemBuilder: (context, index) => Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Стрижка $index',
                        style: const TextStyle(
                          color: Color.fromRGBO(123, 97, 255, 1),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text('от 1000 ₽'),
                    ],
                  ),
                ),
              ),
              Assets.icons.infoCircle.svg(
                height: 16,
                width: 16,
              ),
            ],
          ),
        ),
      );
}

@immutable
class ServiceTab extends StatefulWidget {
  final TabController animalTab;

  /// Надо было делать через NestedScrollView, но это я понял в конце поэтому так
  const ServiceTab({
    required this.animalTab,
    super.key,
  });

  @override
  State<ServiceTab> createState() => _ServiceTabState();
}

class _ServiceTabState extends State<ServiceTab> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: SizedBox(
              height: 36,
              child: ListView.builder(
                itemCount: widget.animalTab.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                      right: index == AnimalTab.values.length - 1 ? 0 : 14),
                  child: OutlinedButton(
                    style: widget.animalTab.index == index ? styleOff : styleOn,
                    onPressed: () {
                      setState(() {
                        widget.animalTab.index = index;
                      });
                    },
                    child: Text(
                      AnimalTab.values[index].name,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: widget.animalTab,
              children: [
                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 4,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: ServicesCard(
                      index: index,
                    ),
                  ),
                ),
                const Placeholder(),
              ],
            ),
          )
        ],
      );

  final ButtonStyle styleOff = OutlinedButton.styleFrom(
    backgroundColor: const Color.fromRGBO(229, 223, 255, 1),
    side: BorderSide.none,
  );

  final ButtonStyle styleOn = OutlinedButton.styleFrom(
    backgroundColor: Colors.white,
    side: const BorderSide(
      color: Color.fromRGBO(229, 223, 255, 1),
    ),
  );
}
