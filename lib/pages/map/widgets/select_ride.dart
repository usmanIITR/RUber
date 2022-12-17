import 'package:ruber/constant/ride_options.dart';
import 'package:ruber/pages/map/map_state.dart';
import 'package:ruber/ui/widgets/cards/ride_card.dart';
import 'package:ruber/ui/widgets/titles/bottom_slider_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruber/ui/theme.dart';
import 'package:ruber/ui/widgets/buttons/city_cab_button.dart';

class SelectRide extends StatelessWidget {
  const SelectRide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MapState>(context);
    return Wrap(
      runAlignment: WrapAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: BottomSliderTitle(title: 'SELECT RIDE OPTION'),
            ),
            const SizedBox(height: 16),
            Container(
              height: 140,
              child: ListView.builder(
                itemCount: rideOptions.length,
                padding: const EdgeInsets.only(left: 16, right: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final option = rideOptions[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: RideOptionCard(
                      isSelected: state.isSelectedOptions[index],
                      onTap: (option) {
                        state.onTapRideOption(option, index);
                      },
                      option: option,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CityCabButton(
            title: 'PROCEED WITH ${state.selectedOption?.title.toUpperCase()}',
            color: AppTheme.appblue,
            textColor: AppTheme.appWhite,
            disableColor: AppTheme.appLightGrey,
            buttonState: ButtonState.initial,
            onTap: () {
              state.proceedRide();
            },
          ),
        ),
      ],
    );
  }
}
