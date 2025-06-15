import 'package:auto_route/auto_route.dart';
import 'package:clevit_flutter_bloc/core/enum/bottom_nav_item.dart';
import 'package:clevit_flutter_bloc/core/theme/app_theme.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/bottom_nav/bottom_nav_state.dart'; 
import 'package:clevit_flutter_bloc/presentation/features/collection/pages/collection_page.dart';
import 'package:clevit_flutter_bloc/presentation/widgets/custom_bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pages = const {
    BottomNavItem.scan: Center(child: Text('Scan', style: TextStyle(color: AppTheme.secondary,fontSize: 22),)),
    BottomNavItem.collection:  CollectionPage() ,
    BottomNavItem.shop: Center(child: Text('Shop',style: TextStyle(color: AppTheme.secondary,fontSize: 22),)),
    BottomNavItem.settings: Center(child: Text('Settings',style: TextStyle(color: AppTheme.secondary, fontSize: 22),)),
  };
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        // context.read<LiquorBloc>().add(LoadLiquorData());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppTheme.secondaryPrimaryColor,
          body: _pages[state.selected]!,
          bottomNavigationBar: SizedBox(
            height: 100,
            child: CustomBottomNavBar(selected: state.selected),
          ),
        );
      },
    );
  }
}
