import 'package:clevit_flutter_bloc/core/enum/collection_detail_type.dart';
import 'package:clevit_flutter_bloc/core/theme/app_fonts.dart';
import 'package:clevit_flutter_bloc/core/theme/app_theme.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/collection/collection_detail_bloc.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/collection/collection_detail_event.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/collection/collection_detail_state.dart';
import 'package:clevit_flutter_bloc/presentation/features/collection/widgets/detail_tab_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
    BlocBuilder<CollectionDetailBloc, CollectionDetailState>(
            builder: (context, state) {
              return    Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppTheme.blackColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children:
                                            CollectionDetailTabType.values
                                                .map(
                                                  (tab) => GestureDetector(
                                                    onTap:
                                                        () => context
                                                            .read<
                                                              CollectionDetailBloc
                                                            >()
                                                            .add(
                                                              ChangeDetailTab(
                                                                tab,
                                                              ),
                                                            ),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 33,
                                                            vertical: 8,
                                                          ),

                                                      decoration: BoxDecoration(
                                                        color:
                                                            state.selectedTab ==
                                                                    tab
                                                                ? AppTheme
                                                                    .accent
                                                                : Colors
                                                                    .transparent,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              4,
                                                            ),
                                                      ),
                                                      child: Text(
                                                        tab.name
                                                            .replaceAll(
                                                              'details',
                                                              'Details',
                                                            )
                                                            .replaceAll(
                                                              'tastingNotes',
                                                              'Tasting notes',
                                                            )
                                                            .replaceAll(
                                                              'history',
                                                              'History',
                                                            ),
                                                        style: context.appFonts.body(
                                                          fontSize:
                                                              FontSize.s12,
                                                          color:
                                                              state.selectedTab ==
                                                                      tab
                                                                  ? AppTheme
                                                                      .primary
                                                                  : Colors
                                                                      .white70,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          state.selectedTab !=
                                                  CollectionDetailTabType
                                                      .tastingNotes
                                              ? MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.45
                                              : MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.65,
                                      child: DetailTabContent(state),
                                    ),
                                  ],
                                ),
                              );
            });
    
  
  }
}