
import 'package:desing_app/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final pageRoutes = <_Route>[
  _Route(
    icon: FontAwesomeIcons.slideshare, 
    title: 'Slideshow', 
    page: const SlideShowPage()
  ),
  _Route(
    icon: FontAwesomeIcons.truckMedical, 
    title: 'Emergency', 
    page: const EmergencyPage()
  ),
  _Route(
    icon: FontAwesomeIcons.heading, 
    title: 'Heading', 
    page: const HeadersPage()
  ),
  _Route(
    icon: FontAwesomeIcons.peopleCarryBox, 
    title: 'Animated Square', 
    page: const AnimationsPage()
  ),
  _Route(
    icon: FontAwesomeIcons.circleNotch, 
    title: 'Progress Bar', 
    page: const GraphsCircularsPage()
  ),
  _Route(
    icon: FontAwesomeIcons.pinterest, 
    title: 'Pinterest', 
    page: const PinterestPage()
  ),
  _Route(
    icon: FontAwesomeIcons.mobile, 
    title: 'Slivers', 
    page: const SliverPage()
  ),
];


class _Route {

  final IconData icon;
  final String title;
  final Widget page;

  _Route({
    required this.icon, 
    required this.title, 
    required this.page
  });

}