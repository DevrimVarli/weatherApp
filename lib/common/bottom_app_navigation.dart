import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/controller/pages_index_controller.dart';
import 'package:weather_app/common/widgets/card.dart';
import 'package:weather_app/features/filters_screen/presentation/filters_screen.dart';
import 'package:weather_app/features/home_screen/controller/is_card_visible.dart';
import 'package:weather_app/features/home_screen/presentation/home_screen.dart';

class BottomAppNavigationBar extends ConsumerStatefulWidget {
  const BottomAppNavigationBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomAppNavigationBarState();
}

class _BottomAppNavigationBarState
    extends ConsumerState<BottomAppNavigationBar> {
  final List<Widget> pages = const <Widget>[HomeScreen(), FiltersScreen()];

  @override
  Widget build(BuildContext context) {
    bool isCardVisible = ref.watch(isCardVisibleProvider);
    int state = ref.watch(pagesIndexProvider);

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: pages[state],

      // 🔹 Ortada + buton
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF7F5AF0),
          elevation: 0,
          onPressed: () {
            ref
                .read(isCardVisibleProvider.notifier)
                .switchVisibility(!isCardVisible); 
            if (!isCardVisible) {
              showModalBottomSheet(
                barrierColor: Colors.black.withValues(alpha: 0.2),
                context: context,
                isScrollControlled: true, // tam ekran genişleyebilir
                backgroundColor: Colors.transparent, // köşeler yumuşak görünür
                builder: (BuildContext context) {
                  return CardWidget();
                },
              ).then((_) {
                ref
                    .read(isCardVisibleProvider.notifier)
                    .switchVisibility(false);
              });
            }
          },
          child: Icon(
            isCardVisible ? Icons.close : Icons.add,
            color: Colors.white,
          ),
        ),
      ),

      // 🔹 Alt bar
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: BottomAppBar(
            color: Colors.white.withValues(alpha: 0.1),
            shape: const CircularNotchedRectangle(),
            notchMargin: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _navButton(
                  icon: Icons.person_rounded,
                  label: 'home'.tr(),
                  isActive: state == 0,
                  onTap: () => ref.read(pagesIndexProvider.notifier).setIndex(0),
                ),
                const SizedBox(width: 60), // orta + buton boşluğu
                _navButton(
                  icon: Icons.filter_alt_rounded,
                  label: 'filter'.tr(),
                  isActive: state == 1,
                  onTap: () => ref.read(pagesIndexProvider.notifier).setIndex(1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navButton({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),

              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFF7F5AF0).withValues(alpha: 0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 26,
                color: isActive
                    ? const Color(0xFF7F5AF0)
                    : Colors.white.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                color: isActive
                    ? const Color(0xFF7F5AF0)
                    : Colors.white.withValues(alpha: 0.6),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
