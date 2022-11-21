import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_v2/generated/assets.dart';
import 'package:portfolio_v2/shared/text_view.dart';
import 'package:text_scroll/text_scroll.dart';

import '../shared/rotataing_box.dart';
import '../utils/app_strings.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({Key? key}) : super(key: key);

  static final List<String> skills = [
    '     Flutter   ',
    '         Dart',
    '         Caching',
    '         RESTful APIs',
    '         Debugging',
    '         Unit and Widget',
    '         testing',
    '         Responsive UI',
    '         BloC',
    '         Provider',
    '         Riverpod',
  ];
  static final List<String> skills2 = [
    '         SQLite',
    '         JSON',
    '         GraphQL',
    '         Object Oriented',
    '         programming',
    '         Firebase',
    '         Git/Version control',
    '         C++',
    '         SOLID development',
    '         Test-Driven',
    '         Development (TDD)',
    '     HTML/CSS /JavaScript',
    '     Node',
    '     Kotlin',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 60.h,
            horizontal: 140.w,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(Assets.svgsLogo),
                  Row(
                    children: [
                      TextView(
                        text: 'Projects',
                        size: 18,
                        weight: FontWeight.w600,
                      ),
                      80.horizontalSpace,
                      TextView(
                        text: 'Github',
                        size: 18,
                        weight: FontWeight.w600,
                      ),
                      80.horizontalSpace,
                      TextView(
                        text: 'Resume',
                        size: 18,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
              100.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextViewAlt(
                        text: 'Mobile'.toUpperCase(),
                        size: 120,
                        lineHeight: .9,
                        color: Colors.black,
                        weight: FontWeight.w600,
                      ),
                      50.horizontalSpace,
                      Container(
                        height: 95,
                        width: 340.w,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Stack(
                          children: [
                            // ImageWidget(imageUrl: Assets.pngsTamunorthLogo),
                            Positioned(
                              right: 15,
                              top: 10,
                              bottom: 10,
                              child: SvgPicture.asset(
                                Assets.svgsYellowAsset,
                                // height: 120,
                                // width: 120,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TextViewAlt(
                    text: 'Developer'.toUpperCase(),
                    size: 120,
                    lineHeight: .9,
                    color: Colors.black,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              27.verticalSpace,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextView(
                      text: AppStrings.description,
                      size: 32,
                      color: Color(0xff565656),
                      weight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                        height: 160.sp,
                        child: InfiniteAnimation(
                          durationInSeconds: 10, // this is the default value
                          child: SvgPicture.asset(
                            Assets.svgsMobileDev,
                            // height: 120,
                            // width: 120,
                            fit: BoxFit.contain,
                          ),
                        )),
                  )
                ],
              ),
              20.verticalSpace,
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 250,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.email,
                        ),
                        10.horizontalSpace,
                        TextView(text: 'Contact Me')
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  30.horizontalSpace,
                  Container(
                    height: 50,
                    width: 250,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.card_giftcard,
                        ),
                        10.horizontalSpace,
                        TextView(text: 'Github')
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ],
              ),
              150.verticalSpace,
              Divider(),
              10.verticalSpace,
              TextScroll(
                AppStrings.bottomScrollText.toUpperCase(),
                mode: TextScrollMode.endless,
                velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
                delayBefore: Duration(milliseconds: 500),
                numberOfReps: 5,
                pauseBetween: Duration(milliseconds: 50),
                style: TextStyle(
                  fontFamily: 'Clash',
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 60,
                  height: 1.2,
                ),
                textAlign: TextAlign.right,
                // selectable: true,
              ),
              10.verticalSpace,
              Divider(),
              150.verticalSpace,
              TextView(
                text: 'FEATURED PROJECTS',
                size: 26,
                lineHeight: .9,
                color: Colors.black,
                weight: FontWeight.w700,
              ),
              50.verticalSpace,
              Container(
                color: Colors.black,
                height: 800.h,
              ),
              50.verticalSpace,
              Container(
                color: Colors.black,
                height: 800.h,
              ),
              50.verticalSpace,
              Container(
                color: Colors.black,
                height: 800.h,
              ),
              50.verticalSpace,
              Container(
                color: Colors.black,
                height: 800.h,
              ),
              200.verticalSpace,
              Row(
                children: [
                  TextViewAlt(
                    text: 'About me',
                    size: 60,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextView(
                      text: AppStrings.aboutMe,
                      size: 32,
                      weight: FontWeight.w400,
                    ),
                  ),
                  50.horizontalSpace,
                  Expanded(
                    child: Container(
                      width: 200,
                      height: 450,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                ],
              ),
              100.verticalSpace,
              TabBar(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  onTap: (value) {
                    // setState(() {
                    //   detailIndex = value;
                    // });
                  },
                  labelStyle: TextStyle(
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: const [
                    Tab(
                      text: 'Skills',
                    ),
                    Tab(
                      text: 'Experience',
                    ),
                    Tab(
                      text: 'Education',
                    ),
                  ]),
              SizedBox(
                height: 850,
                child: TabBarView(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return TextView(
                                text: skills[index].replaceAll(' ', ''),
                                size: 32,
                                weight: FontWeight.w400,
                              );
                            },
                            itemCount: skills.length,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return TextView(
                                text: skills2[index].replaceAll(' ', ''),
                                size: 32,
                                weight: FontWeight.w400,
                              );
                            },
                            itemCount: skills2.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(),
                  Container(),
                ]),
              ),
              100.verticalSpace,
              Divider(
                color: Colors.black,
              ),
              TextScroll(
                AppStrings.lookingForward.toUpperCase(),
                mode: TextScrollMode.endless,
                velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
                delayBefore: Duration(milliseconds: 500),
                numberOfReps: 5,
                pauseBetween: Duration(milliseconds: 50),
                style: TextStyle(
                    fontFamily: 'Clash',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 60,
                    height: 1.2),
                textAlign: TextAlign.right,
                selectable: true,
              ),
              Divider(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
