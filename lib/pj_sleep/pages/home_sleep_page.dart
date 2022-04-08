import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/misc/theme.dart';

class HomeSleepPage extends StatefulWidget {
  const HomeSleepPage({Key? key}) : super(key: key);

  @override
  _HomeSleepPageState createState() => _HomeSleepPageState();
}

class _HomeSleepPageState extends State<HomeSleepPage> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: SafeArea(
        child: orientation == Orientation.portrait
            ? Stack(
                children: [
                  getStartedBackground(),
                  FractionallySizedBox(
                      heightFactor: 0.4, child: getStartedHeader()),
                ],
              )
            : Row(
                children: [
                  Expanded(child: getStartedHeader()),
                  Expanded(child: getStartedBackground()),
                ],
              ),
      ),
    );
  }

  Align getStartedBackground() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
            heightFactor: 0.6,
            widthFactor: 1,
            child: FittedBox(
                fit: BoxFit.cover,
                child: SvgPicture.asset('assets/images/bg_get_started.svg'))));
  }

  Column getStartedHeader() {
    return Column(
      children: [
        Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: SvgPicture.asset(
              'assets/images/ic_logo.svg',
              alignment: const Alignment(0.0, -0.8),
            )),
        Flexible(
            flex: 1,
            child: Column(
              children: [
                FittedBox(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Hi Linh, Welcome\n',
                          style: primaryFont
                              .medium(30)
                              .copyWith(color: kColorLightYellow),
                          children: [
                            TextSpan(
                                text: 'to Slient Moon',
                                style: primaryFont
                                    .thin(30)
                                    .copyWith(color: kColorLightYellow))
                          ])),
                ),
              ],
            )),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: SizedBox.expand(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Align(
                alignment: Alignment.center,
                child: FittedBox(
                  child: Text(
                    'Explorer the app, Find some peace of mine\n to prepare for meditatial',
                    style: primaryFont
                        .light(16)
                        .copyWith(color: kColorLightGrey, height: 1.2),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
