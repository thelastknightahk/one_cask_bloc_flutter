import 'package:clevit_flutter_bloc/core/enum/bottom_nav_item.dart';
import 'package:clevit_flutter_bloc/core/theme/app_theme.dart';
import 'package:clevit_flutter_bloc/core/utils/image_assets.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/bottom_nav/bottom_nav_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final BottomNavItem selected;

  const CustomBottomNavBar({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem(
        icon: ImageAssets.scannerIcon,
        label: 'Scan',
        value: BottomNavItem.scan,
      ),
      _NavItem(
        icon: ImageAssets.collectionIcon,
        label: 'Collection',
        value: BottomNavItem.collection,
      ),
      _NavItem(
        icon: ImageAssets.shopIcon,
        label: 'Shop',
        value: BottomNavItem.shop,
      ),
      _NavItem(
        icon: ImageAssets.settingIcon,
        label: 'Settings',
        value: BottomNavItem.settings,
      ),
    ];

    return BottomAppBar(
      color: AppTheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            items.map((item) {
              final isActive = selected == item.value;
              return GestureDetector(
                onTap: () {
                  context.read<BottomNavBloc>().add(
                    BottomNavChanged(item.value),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        colorFilter: ColorFilter.mode(
                          isActive ? Colors.white : Colors.white54,
                          BlendMode.srcIn,
                        ),
                        item.icon,
                        width: 24, 
                        height: 24,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.label,
                        style: TextStyle(
                          color: isActive ? Colors.white : Colors.white54,
                          fontWeight:
                              isActive ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}

class _NavItem {
  final String icon;
  final String label;
  final BottomNavItem value;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}
