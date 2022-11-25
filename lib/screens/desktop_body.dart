import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_v2/generated/assets.dart';
import 'package:portfolio_v2/shared/text_view.dart';
import 'package:portfolio_v2/utils/pallets.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../shared/image_widget.dart';
import '../shared/rotataing_box.dart';
import '../utils/app_strings.dart';

class DesktopBody extends StatelessWidget {
  DesktopBody({Key? key}) : super(key: key);

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

  final projectsKey = new GlobalKey();
  final aboutMeKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 60.sp,
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
                      ButtonWidget(
                        title: 'Projects',
                        isAlt: true,
                        onTap: () {
                          Scrollable.ensureVisible(
                            projectsKey.currentContext!,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      80.horizontalSpace,
                      ButtonWidget(
                        title: 'GitHub',
                        isAlt: true,
                        onTap: () {
                          launchUrlString(AppStrings.githubUrl);
                        },
                      ),
                      80.horizontalSpace,
                      ButtonWidget(
                        title: 'Resume',
                        isAlt: true,
                        onTap: () {
                          launchUrlString(AppStrings.resumeUrl);
                        },
                      ),
                      80.horizontalSpace,
                      ButtonWidget(
                        title: 'About Me',
                        isAlt: true,
                        onTap: () {
                          Scrollable.ensureVisible(
                            aboutMeKey.currentContext!,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              100.w.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        margin: EdgeInsets.only(bottom: 16),
                        height: 95.w,
                        width: 340.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ImageWidget(
                                size: 700,
                                imageUrl:
                                    'https://res.cloudinary.com/dxfwzjz4k/image/upload/v1669061255/portfolio_projects/image_3_1_vqrnnz.png',
                                imageType: ImageWidgetType.network,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 10,
                              bottom: 10,
                              child: SvgPicture.asset(
                                Assets.svgsYellowAsset,
                                height: 95.w,

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
              27.w.verticalSpace,
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
                        height: 160.w,
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
              20.w.verticalSpace,
              Row(
                children: [
                  ButtonWidget(
                    title: 'Contact Me',
                  ),
                  30.horizontalSpace,
                  ButtonWidget(
                    title: 'Github',
                  ),
                ],
              ),
              150.w.verticalSpace,
              Divider(),
              10.w.verticalSpace,
              // IgnorePointer(
              //   child: TextScroll(
              //     AppStrings.bottomScrollText.toUpperCase(),
              //     mode: TextScrollMode.endless,
              //     velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
              //     delayBefore: Duration(milliseconds: 500),
              //     numberOfReps: 5,
              //     pauseBetween: Duration(milliseconds: 50),
              //     style: TextStyle(
              //       fontFamily: 'Clash',
              //       color: Colors.black,
              //       fontWeight: FontWeight.w600,
              //       fontSize: 60,
              //       height: 1.2,
              //     ),
              //     textAlign: TextAlign.right,
              //     // selectable: true,
              //   ),
              // ),
              ScrollingText(
                text: AppStrings.bottomScrollText.toUpperCase(),
              ),
              10.w.verticalSpace,
              Divider(),
              150.w.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: TextView(
                  textKey: projectsKey,
                  text: 'FEATURED PROJECTS',
                  size: 26,
                  lineHeight: .9,
                  color: Colors.black,
                  weight: FontWeight.w700,
                ),
              ),
              50.w.verticalSpace,
              Container(
                color: Colors.black,
                height: 800.w,
                child: Image.network(
                  'https://res.cloudinary.com/dxfwzjz4k/image/upload/v1669061368/portfolio_projects/Frame_41_zlz3cn.png',
                  fit: BoxFit.cover,
                ),
              ),
              50.w.verticalSpace,
              Container(
                color: Colors.black,
                height: 800.w,
                child: Image.network(
                  'https://res.cloudinary.com/dxfwzjz4k/image/upload/v1669269273/portfolio_projects/Frame_42_1_dnyh8n.png',
                  fit: BoxFit.cover,
                ),
              ),
              50.w.verticalSpace,
              Container(
                color: Colors.black,
                height: 800.w,
                child: Image.network(
                  'https://res.cloudinary.com/dxfwzjz4k/image/upload/v1669269235/portfolio_projects/Frame_33_g7wi32.png',
                  fit: BoxFit.cover,
                ),
              ),
              50.w.verticalSpace,
              Container(
                color: Colors.black,
                height: 800.w,
                child: Image.network(
                  'https://res.cloudinary.com/dxfwzjz4k/image/upload/v1669269274/portfolio_projects/Frame_40_mxkjw8.png',
                  fit: BoxFit.cover,
                ),
              ),
              200.w.verticalSpace,
              Row(
                children: [
                  TextViewAlt(
                    textKey: aboutMeKey,
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
                      height: 450.w,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                ],
              ),
              100.w.verticalSpace,
              TabBar(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  overlayColor: MaterialStateProperty.all(Pallets.yellow),
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
                height: 850.w,
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
              80.w.verticalSpace,

              Divider(
                color: Colors.black,
              ),
              // IgnorePointer(
              //   child: TextScroll(
              //     AppStrings.lookingForward.toUpperCase(),
              //     mode: TextScrollMode.endless,
              //     velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
              //     delayBefore: Duration(milliseconds: 500),
              //     numberOfReps: 5,
              //     pauseBetween: Duration(milliseconds: 50),
              //     style: TextStyle(
              //         fontFamily: 'Clash',
              //         color: Colors.black,
              //         fontWeight: FontWeight.w600,
              //         fontSize: 60,
              //         height: 1.2),
              //     textAlign: TextAlign.right,
              //   ),
              // ),
              ScrollingText(
                text: AppStrings.lookingForward.toUpperCase(),
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

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    Key? key,
    required this.title,
    this.isAlt = false,
    this.onTap,
  }) : super(key: key);

  final String title;
  final bool isAlt;
  final VoidCallback? onTap;

  final ValueNotifier<bool> onHover = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) {
        onHover.value = true;
      },
      onEnter: (event) {
        onHover.value = true;
      },
      onExit: (event) {
        onHover.value = false;
      },
      child: ValueListenableBuilder(
          valueListenable: onHover,
          builder: (context, value, child) {
            return isAlt
                ? Container(
                    // height: 30,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: TextView(
                      onTap: onTap,
                      text: title,
                      size: 18,
                      color: value == true ? Pallets.yellow : null,
                      weight: FontWeight.w600,
                    ),
                  )
                : GestureDetector(
                    onTap: onTap,
                    child: Container(
                      // height: 50,
                      width: 250,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            title == 'Github'
                                ? Icons.card_giftcard
                                : Icons.email,
                          ),
                          10.horizontalSpace,
                          TextView(
                            text: title,
                            size: 24,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: value == true ? Color(0xffFFC163) : null,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  );
          }),
    );
  }
}

class ScrollingText extends StatelessWidget {
  const ScrollingText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return ScrollLoopAutoScroll(
      child: TextViewAlt(
        text: text,
        color: Colors.black,
        weight: FontWeight.w600,
        size: 60,
        lineHeight: 1.2,
      ),
      //required
      scrollDirection: Axis.horizontal,
      //required
      delay: Duration(seconds: 1),
      duration: Duration(seconds: 50),
      gap: 25,
      reverseScroll: false,
      duplicateChild: 5,
      enableScrollInput: true,
      delayAfterScrollInput: Duration(seconds: 1),
    );
  }
}

class MyCursor extends StatefulWidget {
  const MyCursor({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyCursorState();
}

class _MyCursorState extends State<StatefulWidget> {
  double mouseX = 0;
  double mouseY = 0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _updateLocation,
      child: Stack(children: [
        Positioned(
          bottom: mouseY,
          top: mouseY,
          left: mouseX,
          right: mouseX,
          child: const Icon(
            Icons.beach_access,
          ),
        )
      ]),
    );
  }

  void _updateLocation(PointerHoverEvent event) {
    setState(() {
      mouseX = event.localPosition.dx;
      mouseY = event.localPosition.dy;
    });
  }
}
