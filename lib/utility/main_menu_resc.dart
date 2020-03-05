import 'package:heroes_manual/pages/dev_main_menu.dart';
import 'package:heroes_manual/pages/hotlines.dart';
import 'package:heroes_manual/pages/laws.dart';
import 'package:heroes_manual/pages/organizations.dart';
import 'package:heroes_manual/pages/perpetrator_present.dart';
import 'package:heroes_manual/pages/screening_page.dart';
import 'package:heroes_manual/pages/about.dart';

const resourceRoutes = [Organizations.route, Hotlines.route, Laws.route];
// TODO: debug routes for screening - remove for production
const debugScreenRoutes = [Screening.route, PerpetratorPresent.route,
  About.route, DevMainMenu.route];