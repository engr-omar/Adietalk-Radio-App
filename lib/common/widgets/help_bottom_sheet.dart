import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/common/widgets/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:icons_plus/icons_plus.dart'
    hide FontAwesome; // 👈 hide FontAwesome to prevent conflict
import 'package:url_launcher/url_launcher.dart';

Future<dynamic> showHelpCenterBottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true, // allows full height scrolling
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Adietalk Radio Help Center',
                          style: appStyle(
                            18.0,
                            Kolors.kPrimary,
                            FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),

                      // Intro
                      Center(
                        child: Text(
                          'Welcome to Adietalk Radio App! 🎶\nFind quick answers, explore FAQs, or contact our support team.',
                          textAlign: TextAlign.center,
                          style: appStyle(
                            16.0,
                            Kolors.kDark,
                            FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      // FAQ Section
                      const Text(
                        'FAQs:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('How do I listen to live radio?'),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Kolors.kGray,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Can I listen offline?'),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Kolors.kGray,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          'How do I request a song or shout-out?',
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Kolors.kGray,
                        ),
                        onTap: () {},
                      ),

                      const SizedBox(height: 15.0),

                      // Contact Section
                      const Text(
                        'Contact Us:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),

                      // Email
                      InkWell(
                        onTap: () async {
                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: 'support@adietalk.com',
                          );
                          if (await canLaunchUrl(emailLaunchUri)) {
                            await launchUrl(emailLaunchUri);
                          }
                        },
                        child: const Row(
                          children: [
                            Icon(
                              MaterialCommunityIcons.email_outline,
                              color: Kolors.kPrimary,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              'support@adietalk.com',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // Phone
                      InkWell(
                        onTap: () async {
                          final Uri phoneUri = Uri(
                            scheme: 'tel',
                            path: '+2348000000000',
                          );
                          if (await canLaunchUrl(phoneUri)) {
                            await launchUrl(phoneUri);
                          }
                        },
                        child: const Row(
                          children: [
                            Icon(
                              MaterialCommunityIcons.phone_outline,
                              color: Kolors.kPrimary,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              '+234 800 000 0000',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // Social Media
                      const Text(
                        'Follow us on:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),

                      Center(
                        child: Row(
                          children: [
                            // Facebook
                            IconButton(
                              icon: const Icon(
                                FontAwesome.facebook_square,
                                color: Colors.blue,
                                size: 30,
                              ),
                              onPressed: () async {
                                final url = Uri.parse(
                                  "https://www.facebook.com/adietalkradio",
                                );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                }
                              },
                            ),
                            SizedBox(width: 15),

                            // Instagram
                            IconButton(
                              icon: const Icon(
                                FontAwesome.instagram,
                                color: Colors.purple,
                                size: 30,
                              ),
                              onPressed: () async {
                                final url = Uri.parse(
                                  "https://www.instagram.com/adietalkradio",
                                );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                }
                              },
                            ),
                            SizedBox(width: 15),

                            // TikTok (from icons_plus)
                            IconButton(
                              icon: const Icon(
                                Bootstrap.tiktok,
                                color: Colors.black,
                                size: 30,
                              ),
                              onPressed: () async {
                                final url = Uri.parse(
                                  "https://www.tiktok.com/@adietalkradio",
                                );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                }
                              },
                            ),
                            SizedBox(width: 15),

                            // Twitter
                            IconButton(
                              icon: const Icon(
                                FontAwesome.twitter,
                                color: Colors.lightBlue,
                                size: 30,
                              ),
                              onPressed: () async {
                                final url = Uri.parse(
                                  "https://twitter.com/adietalkradio",
                                );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                }
                              },
                            ),
                            SizedBox(width: 15),
                            // Youtube (from icons_plus)
                            IconButton(
                              icon: const Icon(
                                Bootstrap.youtube,
                                color: Colors.red,
                                size: 30,
                              ),
                              onPressed: () async {
                                final url = Uri.parse(
                                  "https://www.tiktok.com/@adietalkradio",
                                );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              // CTA Button always visible
              SafeArea(
                top: false, // we only care about bottom
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Kolors.kPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: Size(double.infinity, 50.h), // full width
                  ),
                  onPressed: () {
                    // Navigate to full Help Center Page
                  },
                  child: const Text(
                    'Visit Full Help Center',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}
