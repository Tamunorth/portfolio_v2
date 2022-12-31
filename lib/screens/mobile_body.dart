import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:emailjs/emailjs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:portfolio_v2/generated/assets.dart';
import 'package:portfolio_v2/shared/text_view.dart';
import 'package:portfolio_v2/utils/pallets.dart';
import 'package:portfolio_v2/utils/validation_helpers.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../shared/image_widget.dart';
import '../shared/rotataing_box.dart';
import '../utils/app_strings.dart';

class MobileBody extends StatelessWidget {
  MobileBody({Key? key}) : super(key: key);

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

  final projectsKey = new GlobalKey();
  final aboutMeKey = new GlobalKey();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController messageCtrl = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool _isInViewport = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: SizedBox(
          height: 300,
          child: Drawer(
            width: 200,
            child: Container(
              color: Colors.black,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextViewMobile(
                      text: 'Projects',
                      size: 20,
                      weight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    20.verticalSpace,
                    TextViewMobile(
                      text: 'Projects',
                      size: 20,
                      weight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    20.verticalSpace,
                    TextViewMobile(
                      text: 'Projects',
                      size: 20,
                      weight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    20.verticalSpace,
                    TextViewMobile(
                      text: 'Projects',
                      size: 20,
                      weight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: InteractiveViewer(
          // alignPanAxis: true,
          // panEnabled: false,
          scaleEnabled: MediaQuery.of(context).size.width <= 650 ? true : false,
          boundaryMargin: const EdgeInsets.all(0),
          child: LoaderOverlay(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(
                vertical: 60,
                horizontal: 24,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        Assets.svgsLogo,
                        width: 45,
                      ),
                      InkWell(
                        onTap: () {
                          // scaffoldKey.currentState?.openEndDrawer();
                        },
                        child: PopupMenuButton<String>(
                          color: Colors.black,
                          offset: Offset(0, 20),
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                              child: TextViewMobile(
                                text: 'Projects',
                                color: Colors.white,
                                size: 15,
                                // color: value == true ? Pallets.yellow : null,
                                weight: FontWeight.w600,
                              ),
                              onTap: () {
                                Scrollable.ensureVisible(
                                  projectsKey.currentContext!,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.ease,
                                );
                              },
                            ),
                            PopupMenuItem(
                              child: TextViewMobile(
                                text: 'GitHub',
                                color: Colors.white,
                                size: 15,
                                // color: value == true ? Pallets.yellow : null,
                                weight: FontWeight.w600,
                              ),
                              onTap: () {
                                launchUrlString(AppStrings.githubUrl);
                              },
                            ),
                            PopupMenuItem(
                              child: TextViewMobile(
                                text: 'Resume',
                                color: Colors.white,
                                size: 15,
                                // color: value == true ? Pallets.yellow : null,
                                weight: FontWeight.w600,
                              ),
                              onTap: () {
                                launchUrlString(AppStrings.resumeUrl);
                              },
                            ),
                            PopupMenuItem(
                              child: TextViewMobile(
                                text: 'About Me',
                                color: Colors.white,
                                size: 15,
                                // color: value == true ? Pallets.yellow : null,
                                weight: FontWeight.w600,
                              ),
                              onTap: () {
                                Scrollable.ensureVisible(
                                  aboutMeKey.currentContext!,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.ease,
                                );
                              },
                            ),
                          ],
                          onSelected: (value) {},
                          child: SvgPicture.asset(
                            Assets.svgsMenu,
                            width: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  47.verticalSpace,
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
                  14.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextViewMobileAlt(
                          text: AppStrings.description,
                          size: 14,
                          color: Color(0xff565656),
                          weight: FontWeight.w400,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                            height: 200.w,
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
                  32.verticalSpace,

                  Row(
                    children: [
                      MButtonWidget(
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
                      30.horizontalSpace,
                      MButtonWidget(
                        title: 'Github',
                        onTap: () {
                          launchUrlString(AppStrings.githubUrl);
                        },
                      ),
                    ],
                  ),
                  53.verticalSpace,
                  Divider(
                    color: Colors.black,
                  ),
                  10.verticalSpace,

                  ScrollingText(
                    text: AppStrings.bottomScrollText.toUpperCase(),
                  ),
                  10.verticalSpace,
                  Divider(
                    color: Colors.black,
                  ),
                  40.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.svgsFeaturedButton,
                          height: 24,
                        ),
                        10.horizontalSpace,
                        TextViewMobileAlt(
                          textKey: projectsKey,
                          text: 'FEATURED PROJECTS',
                          size: 10,
                          lineHeight: .9,
                          color: Colors.black,
                          weight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),

                  10.verticalSpace,
                  //
                  //
                  //     ListView(
                  // controller: ,
                  //     ),

                  // ScrollToReveal.withAnimation(
                  //   label: 'ScrollTitanX',
                  //   scrollController: _scrollController,
                  //   reflectPosition: -100,
                  //   animationType: AnimationType.findInLeft,
                  //   child:
                  //
                  //
                  //
                  // ),

                  // Visibility(
                  //   visible: _isInViewport,
                  //   child: AnimatedOpacity(
                  //     duration: Duration(milliseconds: 500),
                  //     opacity: _isInViewport ? 1.0 : 0.0,
                  //     child: Text('Hello World'),
                  //   ),
                  // ),
                  const ProjectItem(
                    title: 'Titan Xchange',
                    description:
                        'TitanXchange provides Seamless borderless payments at your Fingertips allowing you to transcend Borders, by eliminating long bank hours, costly service fees and lengthy processing times.',
                    imageLink: AppStrings.titanXchangeImageLink,
                    overlayColor: 0xff00312A,
                    playStoreLink:
                        'https://play.google.com/store/apps/details?id=com.titanx_change.www',
                    appStoreLink:
                        'https://apps.apple.com/us/app/titanxchange/id6444230222',
                  ),
                  // ScrollToReveal.withAnimation(
                  //   label: 'ScrollEdoko',
                  //   scrollController: _scrollController,
                  //   reflectPosition: -200,
                  //   animationType: AnimationType.findInLeft,
                  //   child: const ProjectItem(
                  //     title: 'Edoko',
                  //     description:
                  //         "Edoko is an E-commerce app that manages the payment and logistics between foreign stores and African consumers without worrying about spending limit or logistics.",
                  //     imageLink: AppStrings.edokoImageLink,
                  //     overlayColor: 0xff222222,
                  //     playStoreLink:
                  //         'https://play.google.com/store/apps/details?id=com.edako.edako',
                  //     appStoreLink:
                  //         'https://apps.apple.com/ca/app/edoko/id1600923527',
                  //   ),
                  // ),

                  const ProjectItem(
                    title: '4traderx',
                    description:
                        '4traderx is a currency exchange platform making payments to Africa and currency exchange affordable and seamless.',
                    imageLink: AppStrings.tradexImageLink,
                    overlayColor: 0xff371C00,
                    playStoreLink:
                        'https://play.google.com/store/apps/details?id=com.fourtraderx.app',
                    appStoreLink:
                        'https://apps.apple.com/us/app/4traderx/id1605193631',
                  ),
                  // ScrollToReveal.withAnimation(
                  //   label: 'ScrollMedbury',
                  //   scrollController: _scrollController,
                  //   reflectPosition: -200,
                  //   animationType: AnimationType.findInLeft,
                  //   child: const ProjectItem(
                  //     title: 'Medbury',
                  //     description:
                  //         'Medbury Medical Services is the first dedicated Occupational Health, Industrial Hygiene and Medical Solutions Company in Nigeria.',
                  //     imageLink: AppStrings.medburyImageLink,
                  //     overlayColor: 0xff420001,
                  //     playStoreLink: 'https://bit.ly/medbury_playstore',
                  //     appStoreLink: 'https://apple.co/3uYrHyh',
                  //   ),
                  // ),
                  const ProjectItem(
                    title: 'Medbury',
                    description:
                        'Medbury Medical Services is the first dedicated Occupational Health, Industrial Hygiene and Medical Solutions Company in Nigeria.',
                    imageLink: AppStrings.medburyImageLink,
                    overlayColor: 0xff420001,
                    playStoreLink: 'https://bit.ly/medbury_playstore',
                    appStoreLink: 'https://apple.co/3uYrHyh',
                  ),
                  // ScrollToReveal.withAnimation(
                  //   label: 'Scroll4traderX',
                  //   scrollController: _scrollController,
                  //   reflectPosition: -200,
                  //   animationType: AnimationType.findInLeft,
                  //   child: const ProjectItem(
                  //     title: '4traderx',
                  //     description:
                  //         '4traderx is a currency exchange platform making payments to Africa and currency exchange affordable and seamless.',
                  //     imageLink: AppStrings.tradexImageLink,
                  //     overlayColor: 0xff371C00,
                  //     playStoreLink:
                  //         'https://play.google.com/store/apps/details?id=com.fourtraderx.app',
                  //     appStoreLink:
                  //         'https://apps.apple.com/us/app/4traderx/id1605193631',
                  //   ),
                  // ),

                  const ProjectItem(
                    title: '4traderx',
                    description:
                        '4traderx is a currency exchange platform making payments to Africa and currency exchange affordable and seamless.',
                    imageLink: AppStrings.tradexImageLink,
                    overlayColor: 0xff371C00,
                    playStoreLink:
                        'https://play.google.com/store/apps/details?id=com.fourtraderx.app',
                    appStoreLink:
                        'https://apps.apple.com/us/app/4traderx/id1605193631',
                  ),

                  30.verticalSpace,
                  Row(
                    children: [
                      TextViewAlt(
                        textKey: aboutMeKey,
                        text: 'About me'.toUpperCase(),
                        size: 60,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                  14.verticalSpace,
                  TextViewMobileAlt(
                    text: AppStrings.aboutMe,
                    size: 14,
                    weight: FontWeight.w400,
                  ),
                  20.verticalSpace,
                  Container(
                    width: double.infinity,
                    height: 400.h,
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
                  50.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        labelPadding: const EdgeInsets.only(
                          right: 10,
                        ),
                        padding: EdgeInsets.zero,
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
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                        unselectedLabelStyle: TextStyle(
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1),
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
                    height: 400.h,
                    child: TabBarView(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                  skills.length,
                                  (index) => TextViewMobileAlt(
                                        text: skills[index].trim(),
                                        size: 14,
                                        weight: FontWeight.w400,
                                      )),
                            ),
                            30.horizontalSpace,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    skills2.length,
                                    (index) => TextViewMobileAlt(
                                          text: skills2[index].trim(),
                                          size: 14,
                                          weight: FontWeight.w400,
                                        )),
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
                                MSmallButton(
                                  title: 'Send Message',
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
                      SizedBox(
                        child: MSmallButton(
                          isAlt: true,
                          title: 'GitHub',
                          onTap: () {
                            launchUrlString(AppStrings.githubUrl);
                          },
                        ),
                      ),
                      14.horizontalSpace,
                      SizedBox(
                        child: MSmallButton(
                          isAlt: true,
                          title: 'LinkedIn',
                          onTap: () {
                            launchUrlString(AppStrings.linkedInLink);
                          },
                        ),
                      ),
                      14.horizontalSpace,
                      SizedBox(
                        child: MSmallButton(
                          isAlt: true,
                          title: 'Medium',
                          onTap: () {
                            launchUrlString(AppStrings.mediumLink);
                          },
                        ),
                      ),
                    ],
                  ),
                  36.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextViewMobileAlt(
                        text: '© Tamunorth 2022',
                        color: Pallets.grey,
                        size: 14,
                        weight: FontWeight.w400,
                      ),
                      InkWell(
                        onTap: () {
                          final site =
                              Uri.parse('https://www.felicitylois.com');
                          launchUrl(site);
                        },
                        child: Row(
                          children: [
                            TextViewMobileAlt(
                              text: 'Design by',
                              color: Pallets.grey,
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                            TextViewMobileAlt(
                              text: ' Lois',
                              color: Pallets.grey,
                              size: 14,
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

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    Key? key,
    required this.imageLink,
    required this.overlayColor,
    required this.playStoreLink,
    required this.appStoreLink,
    this.title,
    this.description,
  }) : super(key: key);

  final String imageLink;
  final String? title;
  final String? description;
  final int overlayColor;
  final String playStoreLink;
  final String appStoreLink;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          color: Colors.black,
          height: 300.h,
          width: double.infinity,
          child: Image.network(
            imageLink,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            color: Color(overlayColor).withOpacity(0.8),
            height: 40,
            width: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextViewMobile(
                  text: title?.toUpperCase() ?? '',
                  size: 17,
                  color: Colors.white,
                ),
                8.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextViewMobileAlt(
                    textAlign: TextAlign.center,
                    text: description ?? '',
                    size: 9,
                    color: Colors.white,
                  ),
                ),
                10.verticalSpace,
                MOverlayButtonWidget(
                  title: 'Google Play',
                  onTap: () {
                    launchUrlString(playStoreLink);
                  },
                  icon: Image.asset(
                    Assets.pngsGoogle,
                    width: 10,
                    height: 10,
                    fit: BoxFit.cover,
                  ),
                ),
                8.verticalSpace,
                MOverlayButtonWidget(
                  title: 'App Store',
                  onTap: () {
                    launchUrl(Uri.parse(appStoreLink));
                    // launchUrlString(appStoreLink,
                    //     mode: LaunchMode.externalApplication);
                  },
                  icon: Image.asset(
                    Assets.pngsApple,
                    width: 10,
                    height: 10,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MButtonWidget extends StatelessWidget {
  MButtonWidget({
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
                          color: value == true ? Pallets.yellow : null,
                          weight: FontWeight.w600,
                        ),
                      ),
                    )
                  : InkWell(
                      child: Container(
                        height: 35,
                        width: 105,
                        padding: EdgeInsets.symmetric(vertical: 14.w),
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
                            20.horizontalSpace,
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
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
      // cursor: SystemMouseCursors.click,
      // onHover: (event) {
      //   onHover.value = true;
      // },
      // onEnter: (event) {
      //   onHover.value = true;
      // },
      // onExit: (event) {
      //   onHover.value = false;
      // },
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
                        height: 25,
                        width: 90,
                        padding: EdgeInsets.symmetric(vertical: 14.w),
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
                            20.horizontalSpace,
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: value == true ? Color(0xffFFC163) : null,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    );
            }),
      ),
    );
  }
}

class MSmallButton extends StatelessWidget {
  MSmallButton({
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
                        // width: 140,
                        padding: EdgeInsets.symmetric(
                            vertical: 14.w, horizontal: 24),
                        child: Center(
                          child: TextViewMobileAlt(
                            text: title,
                            size: 14,
                            color: value == true ? Colors.black : null,
                            weight: FontWeight.w400,
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
                        // height: 35,
                        width: 140,
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.w, vertical: 10),
                        child: Center(
                          child: TextViewMobileAlt(
                            text: title,
                            size: 14,
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
      child: TextViewMobile(
        text: text,
        color: Colors.black,
        weight: FontWeight.w600,
        size: 28,
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
        TextViewMobileAlt(
          text: title,
          size: 14,
          weight: FontWeight.w600,
        ),
        13.verticalSpace,
        TextViewMobileAlt(
          text: date,
          size: 14,
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
