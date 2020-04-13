import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';


class Organizations extends StatelessWidget {
  static const String route = '/organizations';
  static const List<String> organizationUrl = [
    "https://gcadv.org/",
    "https://gcfv.georgia.gov/",
    "https://ncadv.org/",
    "https://www.cdc.gov/violenceprevention/intimatepartnerviolence/fastfact.html",
    "https://www.womenshealth.gov/relationships-and-safety",
    "https://www.justice.gov/ovw/domestic-violence",
    "http://www.866uswomen.org",
    "https://gcadv.org/get-help/find-a-domestic-violence-center-near-you/",
    "https://greatist.com/happiness/stop-domestic-violence-organizations",
    "https://www.endabuse.org"
    "htpps://www.menstoppingviolence.org",
    "http://www.nationalcenterdvtraumamh.org/resources/national-domestic-violence-organizations/",
    "https://www.ncdbw.org/",
    "https://www.bwjp.org/resource-center/resource-results/national-network-to-end-domestic-violence.html",
  ];
  static const List<String> organizationTitles = [
    "Georgia Coalition Against Domestic Violence (GCADV) ",
    "Georgia Commision on Family Violence (GCFV)",
    "National Coalition Against Domestic Violence (NCADV) ",
    "Center for Disease Control and Prevention (CDC) : Preventing Intimate "
        "Partner Violence",
    "Office on Women’s Health",
    "U.S. Department of Justice",
    "Americans Overseas Domestic Violence Crisis Center",
    "Georgia Domestic Violence Shelters",
    "Greatist",
    "Family Violence Prevention Fund",
    "Men Stopping Violence",
    "National Center on Domestic Violence, Trauma, & Mental Health",
    "National Clearinghouse for the Defense of Battered Women",
    "National Network to End Domestic Violence",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        showLeading: true,
        showTrailing: true,
        leadingAction: () => Navigator.pop(context),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
              child: Text(
                'Important Organizations',
                style:
                new TextStyle(color: purple.shade500, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 15.0, 10.0),
                    shrinkWrap: true,
                    itemCount: organizationUrl.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          onTap: () => launch(organizationUrl[index]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.laptop),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    organizationTitles[index],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: HMBottomNavBar(),
    );
  }
}