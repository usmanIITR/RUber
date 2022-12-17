import 'package:ruber/pages/map/map_state.dart';
import 'package:ruber/ui/theme.dart';
import 'package:ruber/ui/widgets/buttons/city_cab_button.dart';
import 'package:ruber/ui/widgets/titles/bottom_slider_title.dart';
import 'package:ruber/utils/icon_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class ConfirmRide extends StatelessWidget {
  const ConfirmRide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MapState>();
    return Wrap(
      runAlignment: WrapAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: BottomSliderTitle(title: 'CONFIRM RIDE'),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppTheme.appblue.withOpacity(.08),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${state.selectedOption?.title}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '\₦${state.selectedOption?.price}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey[900],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.timelapse_rounded,
                            color: Colors.grey[600],
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Pickup in ${state.selectedOption?.timeOfArrival.difference(DateTime.now()).inMinutes} mins',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppTheme.appblue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.bolt, color: Colors.orange[300]),
                  Image.asset(
                    "${state.selectedOption?.icon}",
                    height: 60,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(CupertinoIcons.placemark_fill, color: AppTheme.appblue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${state.endAddress?.street}, ${state.endAddress?.city}, ${state.endAddress?.state}, ${state.endAddress?.country}',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  Icon(Icons.edit, color: Colors.grey[600], size: 18),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CityCabButton(
            title: 'CONFIRM',
            color: AppTheme.appblue,
            textColor: AppTheme.appWhite,
            disableColor: AppTheme.appLightGrey,
            buttonState: ButtonState.initial,
            onTap: () {
              state.confirmRide();
            },
          ),
        ),
      ],
    );
  }
}
