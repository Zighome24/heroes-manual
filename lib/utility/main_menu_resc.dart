import 'package:heroes_manual/pages/hotlines.dart';
import 'package:heroes_manual/pages/laws.dart';
import 'package:heroes_manual/pages/main_menu.dart';
import 'package:heroes_manual/pages/organizations.dart';
import 'package:heroes_manual/pages/perpetrator_present.dart';
import 'package:heroes_manual/pages/red_flags.dart';
import 'package:heroes_manual/pages/safety_plan.dart';
import 'package:heroes_manual/pages/screening_page.dart';

const resourceRoutes = [SafetyPlan.route, Organizations.route, Hotlines.route, Laws.route, RedFlags.route];
// TODO: debug routes for screening - remove for production
const debugScreenRoutes = [Screening.route, PerpetratorPresent.route,
  MainMenu.route];