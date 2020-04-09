import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';

class About extends StatelessWidget {
  static const String route = '/about';

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
          children: <Widget>[
            Container(
              //TODO: standardize edge insets throughout project
                padding: const EdgeInsets.all(30.0),
                child: Text('Created by Team Helping Our Heroes, whose members '
                    + 'are students of the Georgia Institute of Technology, our '
                    + 'project, Heroes\' Manual, aims to serve as a quick, '
                    + 'intuitive guide that law enforcement officers and other '
                    + 'service providers can use for resources and instruction '
                    + 'on handling domestic violence situations.',
                    //TODO: change the source of the purple color and style to main
                    //  or some standardized/uniform font style for the app
                    style: new TextStyle(color: purple.shade500, fontSize: 20))
            ),
            Container(
              //TODO: standardize edge insets throughout project
                padding: const EdgeInsets.all(30.0),
                child: Text('Bibliography',
                    //TODO: change the source of the purple color and style to main
                    //  or some standardized/uniform font style for the app
                    style: new TextStyle(color: purple.shade500, fontSize: 17))
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Avanti Adhia, S. Bryn Austin, Garrett M. Fitzmaurice, David Hemenway. ""The Role of Intimate "
                      + "Partner Violence in Homicides of Children Aged 2–14 Years."" American Journal of Preventive "
                      + "Medicine, Volume 56, Issue 1 (2019): 38-46."),
                ),
              ListTile(
                leading: Icon(Icons.local_library),
                title: Text("Belknap, Joanne. ""Law enforcement officers'' attitudes about the appropriate responses to "
                    + "woman battering."" International Review of Victimology 4, no. 1 (1995): 47-62."),
                ),
              ListTile(
                leading: Icon(Icons.local_library),
                title: Text("Blaney, Elizabeth. &quot;Police officers&#39; views of specialized intimate partner violence "
                    + "training.&quot; Policing: an international journal of police strategies &amp; management 33, "
                    + "no. 2 (2010): 354-375."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Bloomberg, M. R. (2004). MEDICAL PROVIDERS’GUIDE TO MANAGING THE CARE OF DOMESTIC "
                      + "VIOLENCE PATIENTS WITHIN A CULTURAL CONTEXT."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Buzawa, Eves, and Thomas Austin. &quot;Determining police response to domestic violence"
                      + "victims.&quot; Victims of Crime and the Victimization Process 36, no. 5 (2013): 16."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Decker, M. R., Frattaroli, S., McCaw, B., Coker, A. L., Miller, E., Sharps, P., ... &amp; "
                      + "Bennett, W. L. (2012). Transforming the healthcare response to intimate partner violence and "
                      + "taking best practices to scale."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("DeJong, Christina, Amanda Burgess-Proctor, and Lori Elis. &quot;Police officer perceptions "
                      + "of intimate partner violence: An analysis of observational data.&quot; Violence and victims 23, "
                      + "no. 6 (2008): 683-696."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Ganley, A. L. (1995). Understanding domestic violence. Improving the health care response to "
                      + "domestic violence: A resource manual for health care providers, 15-42."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Hampton, Robert, William Oliver, and Lucia Magarian. &quot;Domestic violence in the African "
                      + "American community: An analysis of social and structural factors.&quot; Violence against women 9, "
                      + "no. 5 (2003): 533-557."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Hester, Marianne, Nicole Westmarland, Geetanjali Gangoli, Mike Wilkinson, Caitriona O’Kelly, "
                      + "Andrew Kent, and Alana Diamond. &quot;Domestic violence perpetrators: identifying needs to inform "
                      + "early intervention.&quot; Bristol: University of Bristol in association with the Northern Rock "
                      + "Foundation and the Home Office (2006)."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Huisman, Kimberly, Jeri Martinez, and Cathleen Wilson. &quot;Training police officers on "
                      + "domestic violence and racism: Challenges and strategies.&quot; Violence Against Women 11, no. "
                      + "6 (2005): 792-821."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Hurley, K. F., Brown-Maher, T., Campbell, S. G., Wallace, T., Venugopal, R., &amp; Baggs, "
                      + "D. (2005). Emergency department patients’ opinions of screening for intimate partner violence "
                      + "among women. Emergency Medicine Journal, 22(2), 97-98."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Lockwood, Daniel, and Ariane Prohaska. &quot;Police Officer Gender and Attitudes toward "
                      + "Intimate Partner Violence: How policy can eliminate stereotypes.&quot; International Journal of "
                      + "Criminal Justice Sciences 10, no. 1 (2015)."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Johnson, Holly, and Tina Hotton. &quot;Losing control: Homicide risk in estranged and "
                      + "intact intimate relationships.&quot; Homicide studies 7, no. 1 (2003): 58-84."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Kassis, Brittany P. &quot;911 Dispatchers: Their Role as Evidence Collectors.&quot; (2017)."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Laskey, Philippa, Elizabeth A. Bates, and Julie C. Taylor. &quot;A systematic literature "
                      + "review of intimate partner violence victimization: an inclusive review across gender and "
                      + "sexuality.&quot; Aggression and Violent Behavior (2019)."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Meischke, Hendrika, Ian Painter, Michelle Lilly, Randal Beaton, Debra Revere, Becca Calhoun, K. "
                      + "Seeley, Yvonne Carslay, Cathy Moe, and Janet Baseman. &quot;An exploration of sources, symptoms "
                      + "and buffers of occupational stress in 9-1-1 emergency call centers.&quot; Ann Emerg Dispatch "
                      + "Response 3, no. 2 (2015): 28-35."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Miller, Amalia R., and Carmit Segal. &quot;Do female officers improve law enforcement quality? "
                      + "Effects on crime reporting and domestic violence escalation.&quot; University of Zurich, UBS "
                      + "International Center of Economics in Society, Working Paper 9 (2014)."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Niolon, P. H., &amp; Centers for Disease Control and Prevention. (2017). Preventing intimate "
                      + "partner violence across the lifespan: A technical package of programs, policies, and practices. "
                      + "Government Printing Office."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("O&#39;Dell, Anne. &quot;Why do police arrest victims of domestic violence? The need for "
                      + "comprehensive training and investigative protocols.&quot; Journal of Aggression, Maltreatment &amp; "
                      + "Trauma 15, no. 3-4 (2007): 53-73."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Rabe-Hemp, Cara E. &quot;Female officers and the ethic of care: Does officer gender impact police "
                      + "behaviors?.&quot; Journal of criminal justice 36, no. 5 (2008): 426-434."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Reaves, Brian A. Police response to domestic violence, 2006-2015. US Department of Justice, "
                      + "Office of Justice Programs, Bureau of Justice Statistics, 2017."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Shah, Susan, Insha Rahman, and Anita Khashu. &quot;Overcoming Language Barriers.&quot; "
                      + "Solutions for law enforcement (2007): 1-17."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Stalans, Loretta J., and Mary A. Finn. &quot;Gender differences in officers&#39; perceptions "
                      + "and decisions about domestic violence cases.&quot; Women &amp; Criminal Justice 11, no. 3 (2000): 1-24."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Stover, Carla Smith, and Kimberly Lent. &quot;Training and certification for domestic violence "
                      + "service providers: The need for a national standard curriculum and training approach.&quot; Psychology of "
                      + "violence 4, no. 2 (2014): 117."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Townsend, Meg, Dana Hunt, Sarah Kuck, and Caity Baxter. &quot;Law enforcement response to "
                      + "domestic violence calls for service: Final report.&quot; Washington, DC: US Department of "
                      + "justice (2005)."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Turner, Kimberly D., &quot;Effects of Stress on 9-1-1 Call-Takers and Police Dispatchers: A Study "
                    + "at the San Jose Police Department&quot; (2015). Master&#39;s Theses. 4562. DOI: "
                    + "https://doi.org/10.31979/etd.3yxn-3pvm"),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Whetstone, Thomas S. &quot;Measuring the impact of a domestic violence coordinated response "
                    + "team.&quot; Policing: An International Journal of Police Strategies &amp; Management 24, no. 3 (2001): "
                    + "371-398."),
                ),
                ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text("Williams, Oliver J., William Oliver, and Marcus Pope. &quot;Domestic violence in the African "
                    + "American community.&quot; Journal of Aggression, Maltreatment &amp; Trauma 16, no. 3 (2008): 229-"
                    + "237."),
                ),
              ],
            ),
            Container(
                padding: const EdgeInsets.all(20.0),
                child: Text('To Be Included: information about the application and team',
                    style: new TextStyle(color: accent.shade900, fontSize: 17))
            ),
          ],
        ),
      ),
      bottomNavigationBar: HMBottomNavBar(),
    );
  }
}