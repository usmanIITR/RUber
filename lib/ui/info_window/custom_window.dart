import 'package:ruber/models/info_window.dart';
import 'package:ruber/ui/theme.dart';
import 'package:flutter/material.dart';

class CustomWindow extends StatelessWidget {
  const CustomWindow({Key? key, required this.info}) : super(key: key);
  final CityCabInfoWindow info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.appWhite,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: AppTheme.appBlack.withOpacity(.4),
                      spreadRadius: 2,
                      blurRadius: 5),
                ],
              ),
              width: double.infinity,
              height: double.infinity,
              child: Container(
                child: Row(
                  children: [
                    if (info.type == InfoWindowType.position)
                      Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        color: AppTheme.appblue,
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${(info.time!.inMinutes) % 60}',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(color: AppTheme.appWhite)),
                            Text('min',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(color: AppTheme.appWhite)),
                          ],
                        ),
                      ),
                    Expanded(
                        child: Text(
                      '${info.name}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: AppTheme.appBlack),
                    ).paddingAll(8)),
                    Icon(Icons.arrow_forward_ios,
                        size: 16, color: AppTheme.appBlack),
                    const SizedBox(width: 4),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
