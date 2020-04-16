import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';

class Laws extends StatelessWidget {
  static const String route = '/laws';
  static const List<String> GA_laws = [
    'Family Violence Act:\N'
      + 'The law protects against physical, sexual, and emotional abuse among '
        + 'family members.\N'
      + 'Family members in this situation of violence can be defined as present '
        + 'or past spouses, parents of the same child, parents and children, '
        + 'stepparents and stepchildren, foster parents and foster children, '
        + 'or other persons living or formerly living in the same household.\N'
      + 'Violation of protective orders can results in a misdemeanor charge with '
        + 'up to 12 months in jail and a \$1000 fine.\N'
      + 'Violation of protective orders can also be considered stalking and can '
        + 'be sentenced as either misdemeanor or felony.',
    'Georgia Code Title 19:\N'
      + 'Deals with petitioning for protective orders, basically the judge has '
        + 'the final say in if the petition gets granted and what the terms are '
        + 'of it \(especially regarding taking guns & licenses from the '
        + 'perpetrator of violence.\)'
  ];
  static const List<String> NTL_laws = [
    'Violence Against Women Act (VAWA):\N'
      +'It is a federal crime to cross state lines and physically injure an '
        + '\"intimate partner,\" to stalk or harrass, and to violate a '
        + 'qualifying Protection Order',
    'Gun Control Act:\N'
      + 'Declares it a federal crime to possess a firearm and/or ammunition '
        + 'while subject to a qualifying protection and after conviction of a '
        + 'qualifying misdemeanor crime of domestic violence.\N'
      + 'A misdemeanor will "qualify" if the conviction was for a crime '
        + 'committed by an intimate partner, parent or guardian of the victim '
        + 'that required the use of attempted use of physical force or the '
        + 'threatened use of a deadly weapon - fairly case by case, the US '
        + 'Attorney\'s Office examines each case.\N'
      + 'An intimate partner is defined as a spouse, a former spouse, a person '
        + 'who shares a child in common with the victim, or a person who '
        + 'cohabits or has cohabited with the victim.'
  ];
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HMAppBar(
          showLeading: true,
          showTrailing: true,
          leadingAction: () => Navigator.pop(context),
        ),
        body: Center(
          child: ClipRect(
            child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
              padding: const EdgeInsets.all(10.0),
                child: Container(
                decoration: new BoxDecoration(
                gradient: LinearGradient(
                colors: [purple.shade600, Colors.deepPurple[400]],
//                begin: Alignment.bottomRight,
//                end: Alignment.topLeft
                ),
              ),
                  child: Padding(
                  padding: const EdgeInsets.all(10.0),
                    child: Text(
                    'Georgia Laws',
                    style: new TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    itemCount: GA_laws.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        alignment: Alignment.topLeft,
                        //decoration: BoxDecoration(
                        //    color: background.shade600
                        //),
                        child: Text(
                          GA_laws[index],
                          style:
                          TextStyle(color: purple.shade600, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index)
                    => Divider(
                      color: background.shade600,
                      thickness: 3.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: new BoxDecoration(
                    gradient: LinearGradient(
                      colors: [purple.shade600, Colors.deepPurple[400]],
//                begin: Alignment.bottomRight,
//                end: Alignment.topLeft
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'National Laws',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    itemCount: NTL_laws.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        alignment: Alignment.topLeft,
                        //decoration: BoxDecoration(
                        //    color: background.shade600
                        //),
                        child: Text(
                          NTL_laws[index],
                          style:
                          TextStyle(color: purple.shade600, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index)
                    => Divider(
                      color: background.shade600,
                      thickness: 3.0,
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
      bottomNavigationBar: HMBottomNavBar(),
    );
  }
}