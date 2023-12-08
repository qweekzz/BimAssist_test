import 'package:bim_assist_test/src/core/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

@immutable
class ViewTab extends StatelessWidget {
  const ViewTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            const Text(
              'Если вы любите своих питомцев, у нас есть лучший груминг-салон для них в Москве. '
              'Позвольте нашим опытным профессионалам позаботиться о ваших пушистых членах семьи, '
              'подстригая им ногти или расчесывая шерсть. Мы предлагаем различные услуги, такие как расчесывание и купание,'
              ' ванны, стрижка когтей и многое другое и многое многое другое',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Assets.icons.site.svg(
                    height: 16,
                    width: 16,
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      _redirectToSite('https://bimassist.ru/');
                    },
                    child: const Text(
                      'grooming-salon.ru',
                      style: TextStyle(
                        color: Color.fromRGBO(123, 97, 255, 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const _CardInfo()
          ],
        ),
      );

  Future<void> _redirectToSite(String address) async {
    final url = Uri.parse(address);
    await launchUrl(url);
  }
}

@immutable
class _CardInfo extends StatelessWidget {
  const _CardInfo({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(123, 97, 255, 0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Assets.icons.phone.svg(
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      _makePhoneCall('+7 (910) 258-39-68');
                    },
                    child: const Text(
                      '+7 (910) 258-39-68',
                      style: TextStyle(
                        color: Color.fromRGBO(123, 97, 255, 1),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Assets.icons.clock.svg(
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text('ежедневно, 08:00–21:00')
                ],
              ),
            ],
          ),
        ),
      );

  Future<void> _makePhoneCall(String phoneNumber) async {
    final launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
