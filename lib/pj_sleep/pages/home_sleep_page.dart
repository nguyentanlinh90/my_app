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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: SafeArea(
        child: orientation == Orientation.portrait
            ? Stack(
                children: [
                  getStartedBackground(),
                  FractionallySizedBox(
                      heightFactor: 0.4, child: getStartedHeader()),
                  Align(
                      alignment: const Alignment(0.0, 0.8),
                      child: GetStartedButton(
                        fixedSize: MaterialStateProperty.all(
                            Size(size.width * 0.9, size.height * 0.065)),
                        textStyle: MaterialStateProperty.all(
                            primaryFont.medium(size.height * 0.015)),
                      ))
                ],
              )
            : Row(
                children: [
                  Expanded(
                      child: Align(
                    alignment: Alignment.topCenter,
                    child: FractionallySizedBox(
                        heightFactor: 0.8, child: getStartedHeader()),
                  )),
                  Expanded(
                      child: Stack(children: [
                    getStartedBackground(),
                    Align(
                      alignment: const Alignment(0.0, 0.8),
                      child: GetStartedButton(
                        fixedSize: MaterialStateProperty.all(
                            Size(size.width * 0.4, size.height * 0.065)),
                      ),
                    )
                  ])),
                ],
              ),
      ),
    );
  }

  Align getStartedBackground() {
    final orientation = MediaQuery.of(context).orientation;
    return Align(
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
            heightFactor: orientation == Orientation.portrait ? 0.6 : 0.9,
            widthFactor: 1,
            child: FittedBox(
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                clipBehavior: Clip.antiAlias,
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

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({Key? key, this.fixedSize, this.textStyle})
      : super(key: key);

  final MaterialStateProperty<Size>? fixedSize;
  final MaterialStateProperty<TextStyle>? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('GET STARTED'),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kColorLightGrey),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(38))),
          elevation: MaterialStateProperty.all(0),
          fixedSize: fixedSize,
          foregroundColor: MaterialStateProperty.all(Colors.grey),
          textStyle: textStyle),
    );
  }
}
