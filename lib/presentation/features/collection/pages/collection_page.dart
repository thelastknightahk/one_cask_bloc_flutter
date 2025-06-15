import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:clevit_flutter_bloc/core/routers/app_routers.gr.dart';
import 'package:clevit_flutter_bloc/core/theme/app_fonts.dart';
import 'package:clevit_flutter_bloc/core/theme/app_theme.dart';
import 'package:clevit_flutter_bloc/core/utils/image_assets.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/collection/collection_detail_bloc.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/collection/collection_detail_event.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/liquor/liquor_bloc.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/liquor/liquor_event.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/liquor/liquor_state.dart';
import 'package:clevit_flutter_bloc/presentation/features/collection/widgets/collection_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My collection",
                  style: context.appFonts.body(
                    fontWeight: CustomFontWeight.medium,
                    fontSize: FontSize.s32,
                    color: AppTheme.secondary,
                  ),
                ),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Notification feature is coming soon',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor:
                            AppTheme.accent, // Your theme color (e.g., orange)
                        duration: const Duration(seconds: 3),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          textColor:
                              AppTheme.greyLightColor, // Your theme color
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ),
                    );
                  },
                  child: Image.asset(ImageAssets.notiIcon),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<LiquorBloc, LiquorState>(
              builder: (context, state) {
                if (state is LiquorLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LiquorLoaded) {
                  if (state.liquors.isEmpty) {
                    return const Center(child: Text("No liquors found."));
                  }

                  return RefreshIndicator(
                    onRefresh: () async {
                      // Trigger the FetchLiquors event to refresh the data
                      context.read<LiquorBloc>().add(LoadLiquorData());
                      // Wait for the bloc to process the event (optional, depending on your bloc setup)
                      await Future.delayed(const Duration(milliseconds: 500));
                    },
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ), // Add padding for better spacing
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            crossAxisSpacing: 12.0, // Space between columns
                            mainAxisSpacing: 12.0, // Space between rows
                            childAspectRatio:
                                0.62, // Adjust card height/width ratio
                          ),
                      itemCount: state.liquors.length,
                      itemBuilder: (context, index) {
                        final liquor = state.liquors[index];
                        return CollectionItemWidget(
                          liquor: liquor,
                          onTap: () {
                            context.read<CollectionDetailBloc>().add(
                              InitCollectionDetail(liquor),
                            );
                            context.pushRoute(
                              CollectionDetailRoute(liquor: liquor),
                            );
                          },
                        );
                      },
                    ),
                  );
                } else if (state is LiquorError) {
                  log("Error ${state.message}");
                  return Center(child: Text("Error: ${state.message}"));
                }

                return const SizedBox.shrink(); // For initial or unhandled states
              },
            ),
          ),
        ],
      ),
    );
  }
}
