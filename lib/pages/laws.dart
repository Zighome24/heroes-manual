import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';

class Laws extends StatelessWidget {
  static const String route = '/laws';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        showLeading: true,
        showTrailing: true,
        leadingAction: () => Navigator.pop(context),
        trailingAction: () => debugPrint("something goes here, check task in Zenhub"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
                'Georgia Laws',
                style: new TextStyle(
                    color: purple.shade500,
                    fontSize: 20
                )
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.label),
                  title: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      ListTile(
                        title: Text('Family Violence Act:'),
                      ),
                      ListTile(
                        title: Text('The law protects against physical, sexual, '
                            + 'and emotional abuse among family members.'),
                      ),
                      ListTile(
                        title: Text('Family members in this situation of violence '
                            + 'can be defined as present or past spouses, parents '
                            + 'of the same child, parents and children, stepparents '
                            + 'and stepchildren, foster parents and foster children, '
                            + 'or other persons living or formerly living in the '
                            + 'same household.'),
                      ),
                      ListTile(
                        title: Text('Violation of protective orders can results '
                            + 'in a misdemeanor charge with up to 12 months in '
                            + 'jail and a \$1000 fine.'),
                      ),
                      ListTile(
                        title: Text('Violation of protective orders can also be '
                            + 'considered stalking and can be sentenced as '
                            + 'either misdemeanor or felony.'),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.label),
                  title: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      ListTile(
                        title: Text('Georgia Code Title 19:'),
                      ),
                      ListTile(
                        title: Text('Deals with petitioning for protective orders, '
                            + 'basically the judge has the final say in if the '
                            + 'petition gets granted and what the terms are of '
                            + 'it \(especially regarding taking guns & licenses '
                            + 'from the perpetrator of violence.\)'),
                      ),
                    ],
                  )
                ),
              ],
            ),
            Text(
                'National Laws',
                style: new TextStyle(
                    color: purple.shade500,
                    fontSize: 20
                )
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.label),
                  title: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      ListTile(
                        title: Text('Violence Against Women Act (VAWA):'),
                      ),
                      ListTile(
                        title: Text('It is a federal crime to cross state lines '
                            + 'and physically injure an \"intimate partner,\" to '
                            + 'stalk or harrass, and to violate a qualifying '
                            + 'Protection Order'),
                      ),
                    ],
                  ),
                ),
                ListTile(
                    leading: Icon(Icons.label),
                    title: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        ListTile(
                          title: Text('Gun Control Act:'),
                        ),
                        ListTile(
                          title: Text('Declare it a federal crime to possess a '
                              + 'firearm and/or ammunition while subject to a '
                              + 'qualifying protection and after conviction of '
                              + 'a qualifying misdemeanor crime of domestic violence'),
                        ),
                        ListTile(
                          title: Text('A misdemeanor will "qualify" if the '
                              + 'conviction was for a crime committed by an '
                              + 'intimate partner, parent or guardian of the '
                              + 'victim that required the use of attempted use '
                              + 'of physical force or the threatened use of a '
                              + 'deadly weapon - fairly case by case, the US '
                              + 'Attorney\'s Office examines each case.'),
                        ),
                        ListTile(
                          title: Text('An intimate partner is defined as a spouse, '
                              + 'a former spouse, a person who shares a child '
                              + 'in common with the victim, or a person who '
                              + 'cohabits or has cohabited with the victim.'),
                        )
                      ],
                    )
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