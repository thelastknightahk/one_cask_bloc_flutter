import 'package:clevit_flutter_bloc/core/theme/app_fonts.dart';
import 'package:clevit_flutter_bloc/core/theme/app_theme.dart';
import 'package:clevit_flutter_bloc/domain/entities/liquor.dart';
import 'package:clevit_flutter_bloc/presentation/widgets/custom_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CollectionItemWidget extends StatelessWidget {
  final Liquor liquor;
  final Function() onTap;
  const CollectionItemWidget({
    super.key,
    required this.liquor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Color(0xff0B1519)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            Center(
              child: CustomNetworkImage(
                imageUrl: liquor.image?.url,
                height: 169,
              ),
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                width: 100,
                child: Text(
                  maxLines: 2,
                  liquor.brand,
                  style: context.appFonts.body(
                    fontWeight: CustomFontWeight.medium,
                    fontSize: FontSize.s22,
                    color: AppTheme.secondary,
                  ),
                ),
              ),
            ),
            Gap(5),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                width: 100,
                child: Text(
                  maxLines: 2,
                   '${liquor.id}#1234',
                  style: context.appFonts.body(
                    fontWeight: CustomFontWeight.medium,
                    fontSize: FontSize.s22,
                    color: AppTheme.secondary,
                  ),
                ),
              ),
            ),
            Gap(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                width: 100,
                child: Text(
                  maxLines: 2,
                  "(${liquor.bottleNumber})",
                  style: context.appFonts.body(
                    fontWeight: CustomFontWeight.medium,
                    fontSize: FontSize.s12,
                    color: AppTheme.secondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
