import 'package:auto_route/auto_route.dart';
import 'package:clevit_flutter_bloc/core/enum/collection_detail_type.dart';
import 'package:clevit_flutter_bloc/core/services/connectivity_service.dart';
import 'package:clevit_flutter_bloc/core/theme/app_fonts.dart';
import 'package:clevit_flutter_bloc/core/theme/app_theme.dart';
import 'package:clevit_flutter_bloc/core/utils/image_assets.dart';
import 'package:clevit_flutter_bloc/domain/entities/liquor.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/collection/collection_detail_bloc.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/collection/collection_detail_event.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/collection/collection_detail_state.dart';
import 'package:clevit_flutter_bloc/presentation/features/collection/widgets/tab_widget.dart';
import 'package:clevit_flutter_bloc/presentation/widgets/bottle_status_bar.dart';
import 'package:clevit_flutter_bloc/presentation/widgets/one_cask_button_widget.dart';
import 'package:clevit_flutter_bloc/presentation/widgets/one_cask_video_player.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

@RoutePage()
class CollectionDetailScreen extends StatefulWidget {
  final Liquor liquor;
  const CollectionDetailScreen({super.key, required this.liquor});

  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen> {
  final ConnectivityService connectivityService = ConnectivityService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<ConnectivityResult>>(
        stream: connectivityService.connectivityStream,
        initialData: const [ConnectivityResult.wifi],
        builder: (context, snapshot) {
          
          return BlocBuilder<CollectionDetailBloc, CollectionDetailState>(
            builder: (context, state) {
              final liquor = state.liquor!;
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.bottleDetailBgImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Gap(40),
                      // Top bar
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.liquor.collection ?? '',
                              style: context.appFonts.body(
                                color: AppTheme.secondary,
                                fontSize: FontSize.s12,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                context.pop();
                              },
                              child: Image.asset(ImageAssets.closeIcon),
                            ),
                          ],
                        ),
                      ),
   if (!snapshot.hasData ||
              snapshot.data!.contains(ConnectivityResult.none))
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Text(
                    maxLines: 2,
                    "No Internet",
                    style: context.appFonts.body(
                      fontWeight: CustomFontWeight.medium,
                      fontSize: FontSize.s18,
                      color: AppTheme.secondary,
                    ),
                  ),
                ),
              ),
                      BottleStatusBar(
                        onTap:
                            () => context.read<CollectionDetailBloc>().add(
                              ToggleBottleOpenStatus(),
                            ),
                        label:
                            state.isBottleOpened
                                ? 'Bottle (Opened)'
                                : 'Bottle (Unopened)',
                      ),
                      Gap(20),
                      // Bottle image
                      Center(
                        child: Image.network(
                          liquor.image?.url ?? '',
                          height: 260,
                        ),
                      ),
                      Gap(20),

                      // Info panel
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
                          width: double.infinity,

                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppTheme.primary.withOpacity(0.85),
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap(4),
                              Text(
                                'Bottle ${liquor.bottleNumber}',
                                style: context.appFonts.body(
                                  fontWeight: CustomFontWeight.medium,
                                  fontSize: FontSize.s12,
                                  color: AppTheme.secondary,
                                ),
                              ),
                              Gap(8),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: liquor.brand,
                                      style: context.appFonts.body(
                                        fontWeight: CustomFontWeight.medium,
                                        fontSize: FontSize.s32,
                                        color:
                                            AppTheme
                                                .secondary, // Grey color for "Talisker"
                                      ),
                                    ),
                                    TextSpan(
                                      text: " ${liquor.name}",
                                      style: context.appFonts.body(
                                        fontWeight: CustomFontWeight.medium,
                                        fontSize: FontSize.s32,
                                        color: const Color(
                                          0xFFFFD700,
                                        ), // Yellow color for "18 Year Old"
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Gap(4),
                              Text(
                                '#${liquor.id}',
                                style: context.appFonts.body(
                                  fontWeight: CustomFontWeight.medium,
                                  fontSize: FontSize.s32,
                                  color: AppTheme.secondary,
                                ),
                              ),
                              Gap(20),
                              // Tabs
                              TabWidget(),

                              // Content based on selected tab
                              const SizedBox(height: 12),

                              // Action Button
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 20,
                        ),
                        child: OneCaskButtonWidget(
                          content: 'Add to my collection',
                          width: MediaQuery.of(context).size.width * 0.6,
                          onTap: () {},
                          leftIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

