import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_v2/generated/assets.dart';
import 'package:portfolio_v2/shared/text_view.dart';
import 'package:portfolio_v2/utils/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../screens/mobile_body.dart';

class ProjectsTab extends StatefulWidget {
  const ProjectsTab({
    Key? key,
  }) : super(key: key);

  @override
  State<ProjectsTab> createState() => _ProjectsTabState();
}

class _ProjectsTabState extends State<ProjectsTab> {
  // final List<bool> isVisible = [false, false, false, false];

  ValueNotifier<List<bool>> isInViewPort =
      ValueNotifier([false, false, false, false]);

  static List<Widget> projects = const [
    ProjectItem(
      title: 'Titan Xchange',
      description:
          'TitanXchange provides Seamless borderless payments at your Fingertips allowing you to transcend Borders, by eliminating long bank hours, costly service fees and lengthy processing times.',
      imageLink: AppStrings.titanXchangeImageLink,
      overlayColor: 0xff00312A,
      playStoreLink:
          'https://play.google.com/store/apps/details?id=com.titanx_change.www',
      appStoreLink: 'https://apps.apple.com/us/app/titanxchange/id6444230222',
    ),
    ProjectItem(
      title: 'Edoko',
      description:
          "Edoko is an E-commerce app that manages the payment and logistics between foreign stores and African consumers without worrying about spending limit or logistics.",
      imageLink: AppStrings.edokoImageLink,
      overlayColor: 0xff222222,
      playStoreLink:
          'https://play.google.com/store/apps/details?id=com.edako.edako',
      appStoreLink: 'https://apps.apple.com/ca/app/edoko/id1600923527',
    ),
    ProjectItem(
      title: 'Medbury',
      description:
          'Medbury Medical Services is the first dedicated Occupational Health, Industrial Hygiene and Medical Solutions Company in Nigeria.',
      imageLink: AppStrings.medburyImageLink,
      overlayColor: 0xff420001,
      playStoreLink: 'https://bit.ly/medbury_playstore',
      appStoreLink: 'https://apple.co/3uYrHyh',
    ),
    ProjectItem(
      title: '4traderx',
      description:
          '4traderx is a currency exchange platform making payments to Africa and currency exchange affordable and seamless.',
      imageLink: AppStrings.tradexImageLink,
      overlayColor: 0xff371C00,
      playStoreLink:
          'https://play.google.com/store/apps/details?id=com.fourtraderx.app',
      appStoreLink: 'https://apps.apple.com/us/app/4traderx/id1605193631',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return ValueListenableBuilder(
                valueListenable: isInViewPort,
                builder: (context, value, child) {
                  return RepaintBoundary(
                    child: VisibilityDetector(
                      key: Key('my-$index-key'),
                      onVisibilityChanged: (visibilityInfo) {
                        var visiblePercentage =
                            visibilityInfo.visibleFraction * 100;

                        if (visiblePercentage > 45 && visiblePercentage < 101) {
                          isInViewPort.value[index] = true;
                          isInViewPort.notifyListeners();

                          // setState(() {
                          //   isVisible[index] = true;
                          // });
                        } else {
                          isInViewPort.value[index] = false;

                          isInViewPort.notifyListeners();

                          // setState(() {
                          //   isVisible[index] = false;
                          // });
                        }
                      },
                      child: projects[index]
                          .animate(target: value[index] ? 1 : 0, delay: 100.ms)
                          .slideX(
                            duration: 400.ms,
                          )
                          .fade(),
                      // .shimmer(),
                    ),
                  );
                });
          })
    ]);
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
