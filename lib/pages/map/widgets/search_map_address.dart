import 'package:ruber/pages/map/map_state.dart';
import 'package:ruber/ui/theme.dart';
import 'package:ruber/ui/widgets/textfields/cab_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchMapBar extends StatelessWidget {
  const SearchMapBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MapState>();

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.appWhite,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: AppTheme.appBlack.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.circle, size: 16, color: AppTheme.appblue),
                    Container(width: 4, height: 40, color: AppTheme.appblue),
                    Icon(Icons.place, color: AppTheme.appblue),
                  ],
                ).paddingHorizontal(4),
                Expanded(
                  child: Column(
                    children: [
                      Focus(
                        focusNode: state.focusNode,
                        child: CityTextField(
                          label: 'My Address',
                          controller: state.currentAddressController,
                          onChanged: (v) {
                            state.searchAddress(v);
                          },
                        ).paddingBottom(12),
                      ),
                      Focus(
                        focusNode: state.focusNode,
                        child: CityTextField(
                          label: 'Destination Address',
                          controller: state.destinationAddressController,
                          onChanged: (v) {
                            state.searchAddress(v);
                          },
                        ),
                      ),
                    ],
                  ).paddingRight(12).paddingVertical(12),
                ),
              ],
            ),
          ],
        ),
      ).paddingAll(8),
    );
  }
}
