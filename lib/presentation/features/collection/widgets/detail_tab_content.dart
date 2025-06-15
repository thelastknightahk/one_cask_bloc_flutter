
import 'package:clevit_flutter_bloc/core/enum/collection_detail_type.dart';
import 'package:clevit_flutter_bloc/core/theme/app_fonts.dart';
import 'package:clevit_flutter_bloc/core/theme/app_theme.dart';
import 'package:clevit_flutter_bloc/core/utils/image_assets.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/collection/collection_detail_state.dart';
import 'package:clevit_flutter_bloc/presentation/widgets/one_cask_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DetailTabContent extends StatelessWidget {
  final CollectionDetailState state;

  const DetailTabContent(this.state);

  @override
  Widget build(BuildContext context) {
    final liquor = state.liquor!;
    switch (state.selectedTab) {
      case CollectionDetailTabType.details:
        return ListView(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Gap(10),
            _labelValueRow('Distillery', liquor.details?.distillery, context),
            _labelValueRow('Region', liquor.details?.region, context),
            _labelValueRow('Country', liquor.details?.country, context),
            _labelValueRow('Type', liquor.details?.type, context),
            _labelValueRow('Age', liquor.details?.ageStatement, context),
            _labelValueRow('Filled', liquor.details?.filled, context),
            _labelValueRow('Bottled', liquor.details?.bottled, context),
            _labelValueRow('Cask', liquor.details?.caskNumber, context),
            _labelValueRow(
              'ABV',
              liquor.details?.abv != null ? '${liquor.details!.abv}%' : null,
              context,
            ),
            _labelValueRow('Size', liquor.details?.size, context),
            _labelValueRow('Finish', liquor.details?.finish, context),
          ],
        );

      case CollectionDetailTabType.tastingNotes:
        final t = liquor.tastingNotes;
        return t == null
            ? Center(
              child: Text('No tasting notes', style: context.appFonts.body(color: AppTheme.greyColor)),
            )
            : ListView(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Gap(20),
                SizedBox(
                  width: 311,
                  height: 233,
                  child: OneCaskVideoPlayer(
                    videoUrl: t.videoUrl ?? '',
                    width: 311,
                    height: 233,
                  ),
                ),

                // _labelValueRow('Author', t.author, context),
                // _labelValueRow('Video URL', t.videoUrl, context),
                _buildListSection('Nose ${t.videoUrl ?? ''}', t.nose, context),
                Gap(10),
                _buildListSection('Palate', t.palate, context),
                Gap(10),
                _buildListSection('Finish', t.finish, context),
              ],
            );

      case CollectionDetailTabType.history:
        return liquor.history.isEmpty
            ? Center(
              child: Text(
                'No history',
                style: context.appFonts.body(color: AppTheme.greyLightColor),
              ),
            )
            : Container(
              margin: EdgeInsets.only(top: 12),
              color: AppTheme.blackColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 12, left: 12),
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: liquor.history.length,
                  itemBuilder: (_, idx) {
                    final h = liquor.history[idx];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: AppTheme.secondary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            Image.asset(ImageAssets.verticalLine),
                          ],
                        ),
                        Gap(20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              h.event,
                              style: context.appFonts.body(
                                fontWeight: CustomFontWeight.medium,
                                fontSize: FontSize.s12,
                                color: AppTheme.secondary,
                              ),
                            ),
                            Gap(10),
                            Text(
                              h.caskType ?? '',
                              style: context.appFonts.body(
                                fontWeight: CustomFontWeight.medium,
                                fontSize: FontSize.s22,
                                color: AppTheme.secondary,
                              ),
                            ),
                            Gap(10),
                            Text(
                              h.caskNumber ?? '',
                              style: context.appFonts.body(
                                fontWeight: CustomFontWeight.medium,
                                fontSize: FontSize.s22,
                                color: AppTheme.secondary,
                              ),
                            ),
                            Gap(10),
                            Container(
                              width: 260,
                              decoration: BoxDecoration(
                                color: AppTheme.blackColor,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Gap(8),
                                  Row(
                                    children: [
                                      Gap(8),
                                      SvgPicture.asset(
                                        colorFilter: ColorFilter.mode(
                                          Colors.white,
                                          BlendMode.srcIn,
                                        ),
                                        ImageAssets.attachementIcon,
                                        width: 16,
                                        height: 16,
                                      ),
                                      Gap(8),
                                      Text(
                                        'Attachments',
                                        style: context.appFonts.body(
                                          fontWeight: CustomFontWeight.medium,
                                          fontSize: FontSize.s12,
                                          color: AppTheme.secondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(12),
                                  Row(
                                    children: [
                                      Gap(12),
                                      Container(
                                        width: 80,
                                        height: 80,
                                        color: AppTheme.greyColor,
                                      ),
                                      Gap(4),
                                      Container(
                                        width: 80,
                                        height: 80,
                                        color: AppTheme.greyColor,
                                      ),
                                      Gap(4),
                                      Container(
                                        width: 80,
                                        height: 80,
                                        color: AppTheme.greyColor,
                                      ),
                                    ],
                                  ),
                                  Gap(12),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
    }
  }

  Widget _labelValueRow(String label, String? value, BuildContext context) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: context.appFonts.body(
                color: AppTheme.secondary,
                fontSize: FontSize.s16,
                fontWeight: CustomFontWeight.regular,
              ),
            ),

            Text(
              value ?? '-',
              style: context.appFonts.body(
                color: AppTheme.secondary,
                fontSize: FontSize.s16,
                fontWeight: CustomFontWeight.regular,
              ),
            ),
          ],
        ),
      );

  Widget _buildListSection(
    String title,
    List<String> items,
    BuildContext context,
  ) => Container(
    decoration: BoxDecoration(color: AppTheme.secondaryPrimaryColor),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.appFonts.body(
              color: Colors.white,
              fontSize: FontSize.s16,
              fontWeight: CustomFontWeight.regular,
            ),
          ),
          Gap(10),
          ...items.map(
            (e) => Text(
              '- $e',
              style: context.appFonts.body(
                color: Colors.white,
                fontSize: FontSize.s16,
                fontWeight: CustomFontWeight.regular,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}