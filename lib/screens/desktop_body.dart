import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:emailjs/emailjs.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:portfolio_v2/generated/assets.dart';
import 'package:portfolio_v2/shared/desktop_projects_tab.dart';
import 'package:portfolio_v2/shared/text_view.dart';
import 'package:portfolio_v2/utils/pallets.dart';
import 'package:portfolio_v2/utils/validation_helpers.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../shared/image_widget.dart';
import '../shared/rotataing_box.dart';
import '../utils/app_strings.dart';

class DesktopBody extends StatelessWidget {
  DesktopBody({Key? key}) : super(key: key);

  static final List<String> skills = [
    ' Flutter',
    ' Dart',
    ' Kotlin',
    ' Swift',
    ' Java',
    ' C++',
    ' Firebase',
    ' Fastlane',
    ' BloC Pattern',
    ' Provider',
    ' Riverpod',
  ];
  static final List<String> skills2 = [
    'Domain - driven design(DDD)',
    '  CI/CD',
    ' REST Api’s',
    '  JSON ',
    'GraphQL',
    'Git (Version control)',
    'Agile Development (Scrum)',
    'Object Oriented programming (OOP)',
    'XCode',
    'Android Studio',
    'Content Management Systems',
    'HTML/CSS /JavaScript',
    'Node',
    'Kotlin',
  ];

  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 16.0,
    fontFamily: 'Horizon',
  );
  final projectsKey = new GlobalKey();
  final aboutMeKey = new GlobalKey();
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController messageCtrl = TextEditingController();

  // final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: InteractiveViewer(
          // alignPanAxis: true,
          // panEnabled: false,
          scaleEnabled: MediaQuery.of(context).size.width <= 650 ? true : false,
          boundaryMargin: const EdgeInsets.all(0),
          child: LoaderOverlay(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: 60.sp,
                horizontal: 140.w,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        Assets.svgsLogo,
                        width: 85.w,
                      ),
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
                          80.w.horizontalSpace,
                          ButtonWidget(
                            title: 'GitHub',
                            isAlt: true,
                            onTap: () {
                              launchUrlString(AppStrings.githubUrl);
                            },
                          ),
                          80.w.horizontalSpace,
                          ButtonWidget(
                            title: 'Resume',
                            isAlt: true,
                            onTap: () {
                              launchUrlString(AppStrings.resumeUrl);
                            },
                          ),
                          80.w.horizontalSpace,
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
                          50.w.horizontalSpace,
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
                              durationInSeconds: 10,
                              // this is the default value
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
                  // MediaQuery.of(context).size.width <= 650
                  //     ? Row(
                  //         children: [
                  //           Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               ButtonWidget(
                  //                 title: 'Contact Me',
                  //                 onTap: () async {
                  //                   String email = Uri.encodeComponent(
                  //                       'daviesmanueltamunotonye@gmail.com');
                  //                   String subject =
                  //                       Uri.encodeComponent("From Website");
                  //                   String body = Uri.encodeComponent(
                  //                       messageCtrl.text.trim());
                  //                   // print(subject); //output: Hello%20Flutter
                  //                   Uri mail = Uri.parse(
                  //                       "mailto:$email?subject=$subject");
                  //                   if (await launchUrl(mail)) {
                  //                     //email app opened
                  //                   } else {
                  //                     //email app is not opened
                  //                   }
                  //                 },
                  //               ),
                  //               30.w.verticalSpace,
                  //               ButtonWidget(
                  //                 title: 'Github',
                  //                 onTap: () {
                  //                   launchUrlString(AppStrings.githubUrl);
                  //                 },
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       )
                  //     :
                  Row(
                    children: [
                      ButtonWidget(
                        title: 'Contact Me',
                        onTap: () async {
                          String email = Uri.encodeComponent(
                              'daviesmanueltamunotonye@gmail.com');
                          String subject = Uri.encodeComponent("From Website");
                          String body =
                              Uri.encodeComponent(messageCtrl.text.trim());
                          // print(subject); //output: Hello%20Flutter
                          Uri mail =
                              Uri.parse("mailto:$email?subject=$subject");
                          if (await launchUrl(mail)) {
                            //email app opened
                          } else {
                            //email app is not opened
                          }
                        },
                      ),
                      30.w.horizontalSpace,
                      ButtonWidget(
                        title: 'Github',
                        onTap: () {
                          launchUrlString(AppStrings.githubUrl);
                        },
                      ),
                    ],
                  ),
                  150.w.verticalSpace,
                  Divider(),
                  10.w.verticalSpace,

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

                  DesktopProjectsTab(),

                  200.w.verticalSpace,
                  Row(
                    children: [
                      TextViewAlt(
                        textKey: aboutMeKey,
                        text: 'ABOUT ME',
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
                      50.w.horizontalSpace,
                      Expanded(
                        child: Container(
                          width: 200,
                          height: 450.w,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ImageWidget(
                            imageUrl:
                                'https://res.cloudinary.com/dxfwzjz4k/image/upload/v1669623989/portfolio_projects/tamunor_cu5smt.png',
                            fit: BoxFit.cover,
                            imageType: ImageWidgetType.network,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      )
                    ],
                  ),
                  100.w.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        labelPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        indicatorColor: Pallets.blueAccent,
                        labelColor: Colors.black,
                        splashBorderRadius: BorderRadius.zero,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        unselectedLabelColor: Colors.black,
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        onTap: (value) {
                          // setState(() {
                          //   detailIndex = value;
                          // });
                        },
                        labelStyle: TextStyle(
                          fontFamily: GoogleFonts.openSans().fontFamily,
                          color: Colors.black,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        unselectedLabelStyle: TextStyle(
                          fontFamily: GoogleFonts.openSans().fontFamily,
                          color: Colors.black,
                          fontSize: 30.sp,
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
                  ),
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
                                    text: skills[index].trim(),
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
                                    text: skills2[index].trim(),
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
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            60.w.verticalSpace,
                            ExperienceTile(
                              title:
                                  '4traderX Inc. | Mobile Application Developer:',
                              date:
                                  'Part-Time Nov 2021 - Present; (Delaware, United States of America) ',
                            ),
                            60.w.verticalSpace,
                            ExperienceTile(
                              title:
                                  'Titanxchange Corp. | Lead Mobile Engineer',
                              date:
                                  'Part-Time July 2022 - Present; (Toronto,  Canada)',
                            ),
                            60.w.verticalSpace,
                            ExperienceTile(
                              title:
                                  'DFC Technology Hub (DTH) | Lead Mobile Developer',
                              date:
                                  'Jan 2021 - July 2022 / Hybrid (Abuja, Nigeria)',
                            ),
                            60.w.verticalSpace,
                            ExperienceTile(
                              title: 'MyNeighbours Kitchen | Mobile Developer',
                              date:
                                  'April 2020 - November 2020 / (Remote, Contract)',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            60.w.verticalSpace,
                            ExperienceTile(
                              title:
                                  'THE COMPLETE 2021 FLUTTER DEVELOPMENT BOOTCAMP WITH DART',
                              date: ' BY LONDONAPPBREWERY UDEMY (2019)',
                            ),
                            60.w.verticalSpace,
                            ExperienceTile(
                              title:
                                  'SOFTWARE ARCHITECTURE: PATTERNS FOR DEVELOPERS',
                              date: 'LINKEDIN (2022)',
                            ),
                            60.w.verticalSpace,
                            ExperienceTile(
                              title: 'BS.c MECHANICAL ENGINEERING',
                              date: 'LANDMARK UNIVERSITY (2015 - 2020)',
                            ),
                            60.w.verticalSpace,
                            ExperienceTile(
                              title:
                                  'Flutter Advanced Course - Clean Architecture With MVVM'
                                      .toUpperCase(),
                              date: 'BY MINA FARID LINKEDIN(2021)',
                            ),
                          ],
                        ),
                      ),
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

                  Container(
                    height: 550.h,
                    margin: EdgeInsets.symmetric(horizontal: 90.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MediaQuery.of(context).size.width <= 500
                            ? const SizedBox()
                            : Expanded(
                                child: ImageWidget(
                                  imageUrl: Assets.pngsMemoji,
                                  // height: 400,
                                  fit: BoxFit.fitHeight,
                                  size: 400.w,
                                ),
                              ),
                        MediaQuery.of(context).size.width <= 500
                            ? const SizedBox()
                            : 80.horizontalSpace,
                        Expanded(
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextBox(
                                  hint: 'Name',
                                  ctrl: nameCtrl,
                                  validator: FieldValidators.notEmptyValidator,
                                ),
                                20.verticalSpace,
                                TextBox(
                                  hint: 'Email',
                                  ctrl: emailCtrl,
                                  validator: FieldValidators.emailValidator,
                                ),
                                20.verticalSpace,
                                TextBox(
                                  hint: 'Your Message',
                                  maxLines: 10,
                                  ctrl: messageCtrl,
                                  validator: FieldValidators.notEmptyValidator,
                                ),
                                30.verticalSpace,
                                SmallButton(
                                  title: 'Send a Message',
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      Map<String, dynamic> templateParams = {
                                        'to_name': "Tamunor",
                                        'message': "${messageCtrl.text.trim()}",
                                        'sender_email':
                                            "${emailCtrl.text.trim()}",
                                        'sender_name':
                                            "${nameCtrl.text.trim()}",
                                      };

                                      try {
                                        context.loaderOverlay.show();

                                        await EmailJS.send(
                                          'service_qzamfcv',
                                          'template_quba45f',
                                          templateParams,
                                          const Options(
                                            publicKey: 'EVPOYuYkkrtr1hr3m',
                                            privateKey: 'blfAM3OcXZz6OjkEM7l9R',
                                          ),
                                        );
                                        print('SUCCESS!');

                                        Flushbar(
                                          message: 'Message sent Successfully!',
                                          icon: Icon(
                                            Icons.info_outline,
                                            size: 28.0,
                                            color: Colors.blue[300],
                                          ),
                                          margin: EdgeInsets.all(6.0),
                                          flushbarStyle: FlushbarStyle.FLOATING,
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          maxWidth: 300,
                                          textDirection:
                                              Directionality.of(context),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          duration: const Duration(seconds: 3),
                                          leftBarIndicatorColor:
                                              Colors.blue[300],
                                        ).show(context);
                                      } catch (error) {
                                        print(error.toString());
                                        Flushbar(
                                          message:
                                              'Failed to send, Please try again',
                                          icon: Icon(
                                            Icons.info_outline,
                                            size: 28.0,
                                            color: Colors.red[300],
                                          ),
                                          margin: EdgeInsets.all(6.0),
                                          flushbarStyle: FlushbarStyle.FLOATING,
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          maxWidth: 300,
                                          textDirection:
                                              Directionality.of(context),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          duration: const Duration(seconds: 3),
                                          leftBarIndicatorColor:
                                              Colors.red[300],
                                        ).show(context);
                                      } finally {
                                        context.loaderOverlay.hide();
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  140.w.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                            '© Tamunorth 2022',
                            textStyle: colorizeTextStyle,
                            colors: colorizeColors,
                          ),
                        ],
                        isRepeatingAnimation: true,
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                      // TextView(
                      //   text: '© Tamunorth 2022',
                      //   color: Pallets.grey,
                      //   size: 20,
                      //   weight: FontWeight.w400,
                      // ),
                      Row(
                        children: [
                          SizedBox(
                            child: SmallButton(
                              isAlt: true,
                              title: 'GitHub',
                              onTap: () {
                                launchUrlString(AppStrings.githubUrl);
                              },
                            ),
                          ),
                          14.horizontalSpace,
                          SizedBox(
                            child: SmallButton(
                              isAlt: true,
                              title: 'LinkedIn',
                              onTap: () {
                                launchUrlString(AppStrings.linkedInLink);
                              },
                            ),
                          ),
                          14.horizontalSpace,
                          SizedBox(
                            child: SmallButton(
                              isAlt: true,
                              title: 'Medium',
                              onTap: () {
                                launchUrlString(AppStrings.mediumLink);
                              },
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          final site =
                              Uri.parse('https://www.felicitylois.com');
                          launchUrl(site);
                        },
                        child: Row(
                          children: [
                            TextView(
                              text: 'Design by',
                              color: Pallets.grey,
                              size: 20,
                              weight: FontWeight.w400,
                            ),
                            TextView(
                              text: ' Lois',
                              color: Pallets.grey,
                              size: 20,
                              weight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExperienceTile extends StatelessWidget {
  const ExperienceTile({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: title,
          size: 32,
          weight: FontWeight.w600,
        ),
        13.verticalSpace,
        TextView(
          text: date,
          size: 32,
          weight: FontWeight.w400,
        ),
      ],
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox({
    Key? key,
    this.maxLines = 1,
    required this.hint,
    required this.ctrl,
    this.validator,
  }) : super(key: key);
  final int maxLines;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController ctrl;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
      scrollPadding: EdgeInsets.symmetric(horizontal: 10),
      validator: validator,
      decoration: InputDecoration(
        // isCollapsed: true,
        isDense: true,
        hintText: hint,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Pallets.grey,
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
      child: GestureDetector(
        onTap: onTap,
        child: ValueListenableBuilder(
            valueListenable: onHover,
            builder: (context, value, child) {
              return isAlt
                  ? InkWell(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: Container(
                        // height: 30,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: TextView(
                          text: title,
                          size: 18,
                          color: value == true ? Pallets.yellow : null,
                          weight: FontWeight.w600,
                        ),
                      ),
                    )
                  : InkWell(
                      child: Container(
                        // height: 50,
                        width: 250.w,
                        padding: EdgeInsets.symmetric(vertical: 14.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            title == 'Github'
                                ? SvgPicture.asset(Assets.svgsGitHub,
                                    width: 26.sp)
                                : SvgPicture.asset(
                                    Assets.svgsContactMe,
                                    width: 26.sp,
                                  ),
                            20.w.horizontalSpace,
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize: 26.sp, fontWeight: FontWeight.w500),
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
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  SmallButton({
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
      child: GestureDetector(
        onTap: onTap,
        child: ValueListenableBuilder(
            valueListenable: onHover,
            builder: (context, value, child) {
              return isAlt
                  ? InkWell(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: Container(
                        width: 150.w,
                        padding: EdgeInsets.symmetric(
                          vertical: 14.w,
                        ),
                        child: Center(
                          child: TextView(
                            text: title,
                            size: 16,
                            color: value == true ? Colors.black : null,
                            weight: FontWeight.w600,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: value == true ? Color(0xffFFC163) : null,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    )
                  : InkWell(
                      child: Container(
                        // height: 50,

                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 10),
                        child: Center(
                          child: TextView(
                            text: title,
                            size: 24,
                            color: value == true ? Colors.black : Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color:
                              value == true ? Color(0xffFFC163) : Colors.black,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    );
            }),
      ),
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

class MOverlayButtonWidget extends StatelessWidget {
  MOverlayButtonWidget({
    Key? key,
    required this.title,
    this.isAlt = false,
    this.onTap,
    this.icon,
  }) : super(key: key);

  final String title;
  final bool isAlt;
  final VoidCallback? onTap;
  final Widget? icon;

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
      child: GestureDetector(
        onTap: onTap,
        child: ValueListenableBuilder(
            valueListenable: onHover,
            builder: (context, value, child) {
              return isAlt
                  ? InkWell(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      child: Container(
                        // height: 30,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: TextView(
                          text: title,
                          size: 18,
                          color: value == true ? Pallets.yellow : Colors.white,
                          weight: FontWeight.w600,
                        ),
                      ),
                    )
                  : InkWell(
                      child: Container(
                        // height: 90,
                        width: 250.w,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            icon != null
                                ? icon!
                                : title == 'Github'
                                    ? SvgPicture.asset(Assets.svgsGitHub,
                                        width: 12)
                                    : SvgPicture.asset(
                                        Assets.svgsContactMe,
                                        width: 12,
                                      ),
                            20.w.horizontalSpace,
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w500,
                                color:
                                    value == true ? Colors.black : Colors.white,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: value == true ? Color(0xffFFC163) : null,
                          border: Border.all(
                              color:
                                  value == true ? Colors.black : Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    );
            }),
      ),
    );
  }
}
