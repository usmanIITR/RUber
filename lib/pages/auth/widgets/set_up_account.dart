import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruber/pages/auth/auth_state.dart';
import 'package:ruber/ui/theme.dart';
import 'package:ruber/ui/widgets/textfields/cab_textfield.dart';

class SetUpAccount extends StatelessWidget {
  const SetUpAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AuthState>(context);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kToolbarHeight * 0.6),
            Text(
              'Set Up Account',
              style: Theme.of(context).textTheme.headline5,
            ).paddingBottom(AppTheme.elementSpacing / 2),
            Text(
              'Fill the details below...',
              style: Theme.of(context).textTheme.bodyText1,
            ).paddingBottom(AppTheme.elementSpacing),
            Row(
              children: [
                Expanded(
                  child: CityTextField(
                    label: 'First Name',
                    controller: state.firstNameController,
                  ),
                ),
                SizedBox(width: AppTheme.elementSpacing),
                Expanded(
                  child: CityTextField(
                    label: 'Last Name',
                    controller: state.lastNameController,
                  ),
                ),
              ],
            ).paddingBottom(AppTheme.elementSpacing),
            CityTextField(
              label: 'Email',
              controller: state.emailController,
            ).paddingBottom(AppTheme.elementSpacing),
            Row(
              children: [
                CupertinoSwitch(
                  value: state.isRoleDriver,
                  onChanged: (v) {
                    state.changeRoleState = v == true ? 1 : 0;
                  },
                ),
                SizedBox(width: AppTheme.elementSpacing * 0.5),
                Text(
                  'I\'m a Driver',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ).paddingBottom(AppTheme.elementSpacing),
            Builder(builder: (context) {
              if (state.isRoleDriver == false) return const SizedBox.shrink();
              return Column(
                children: [
                  CityTextField(
                    label: 'Vehicle Type',
                    controller: state.vehicleTypeController,
                  ).paddingBottom(AppTheme.elementSpacing),
                  CityTextField(
                    label: 'Vehicle Manufacturer',
                    controller: state.vehicleManufacturersController,
                  ).paddingBottom(AppTheme.elementSpacing),
                  Row(
                    children: [
                      Expanded(
                        child: CityTextField(
                          label: 'Vehicle Color',
                          controller: state.vehicleColorController,
                        ),
                      ),
                      SizedBox(width: AppTheme.elementSpacing),
                      Expanded(
                        child: CityTextField(
                          label: 'License Plate',
                          controller: state.licensePlateController,
                        ),
                      ),
                    ],
                  ).paddingBottom(AppTheme.elementSpacing),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
