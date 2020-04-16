const String safety_plan_info = "A safety plan is a personalized, practical plan that details way to stay safe while in a relationship, planning leave a relationship, or after leaving a relationship.\n\nGive this safety plan to the person in need for them to fill out and keep safe.\n\nDon't directly text or email this to a potential victim to avoid potential HIPAA violations.";

const List<String> sources = [
  "\"2010 Georgia Code :: TITLE 19 - DOMESTIC RELATIONS :: CHAPTER 13 - FAMILY "
    + "VIOLENCE :: ARTICLE 1 - GRANTING OF RELIEF BY SUPERIOR COURTS :: § 19-"
    + "13-3 - Filing of Petition Seeking Relief from Family Violence; "
    + "Granting of Temporary Relief Ex Parte; Hearing; Dismissal of Petition "
    + "upon Failure to Hold Hearing; Procedural Advice for Victims.\" US Law, "
    + "Justia, 2020, law.justia.com/codes/georgia/2010/title-19/chapter-13/"
    + "article-1/19-13-3/#:~:text=.",
  "Avanti Adhia, S. Bryn Austin, Garrett M. Fitzmaurice, David Hemenway. \"The "
    + "Role of Intimate Partner Violence in Homicides of Children Aged 2–14 "
    + "Years.\" American Journal of Preventive Medicine, Volume 56, Issue 1 "
    + "(2019): 38-46.",
  "Belknap, Joanne. \"Law enforcement officers'' attitudes about the "
    + "appropriate responses to woman battering.\" International Review of "
    + "Victimology 4, no. 1 (1995): 47-62.",
  "Blaney, Elizabeth. \"Police officers\' views of specialized intimate "
    + "partner violence training.\" Policing: an international journal of "
    + "police strategies and management 33, no. 2 (2010): 354-375.",
  "Bloomberg, M. R. (2004). MEDICAL PROVIDERS’GUIDE TO MANAGING THE CARE OF "
    + "DOMESTIC VIOLENCE PATIENTS WITHIN A CULTURAL CONTEXT.",
  "Buzawa, Eves, and Thomas Austin. \"Determining police response to domestic "
    + "violence victims.\" Victims of Crime and the Victimization Process 36, "
    + "no. 5 (2013): 16.",
  "\"Cycle of Violence.\" Shelter for Help in Emergency, Blue Cloud Studio, "
    + "2020, www.shelterforhelpinemergency.org/get-help/cycle-violence.",
  "Decker, M. R., Frattaroli, S., McCaw, B., Coker, A. L., Miller, E., Sharps, "
    + "P., ...Bennett, W. L. (2012). Transforming the healthcare response to "
    + "intimate partner violence and taking best practices to scale.",
  "DeJong, Christina, Amanda Burgess-Proctor, and Lori Elis. \"Police officer "
    + "perceptions of intimate partner violence: An analysis of observational "
    + "data.\" Violence and victims 23, no. 6 (2008): 683-696.",
  "\"Federal Domestic Violence Laws.\" The United States Department of Justice, "
    + "The Offices of The United States Attorney, 6 Dec. 2017, www.justice.gov/"
    + "usao-wdtn/victim-witness-program/federal-domestic-violence-laws.",
  "\"Georgia Domestic Violence Laws.\" Findlaw, Thomas Reuters, 21 Mar. 2018, "
    + "statelaws.findlaw.com/georgia-law/georgia-domestic-violence-laws.html.",
  "Ganley, A. L. (1995). Understanding domestic violence. Improving the health "
    + "care response to domestic violence: A resource manual for health care "
    + "providers, 15-42.",
  "Hampton, Robert, William Oliver, and Lucia Magarian. \"Domestic violence in "
    + "the African American community: An analysis of social and structural "
    + "factors.\" Violence against women 9, no. 5 (2003): 533-557.",
  "\"Help for Friends and Family.\" The National Domestic Violence Hotline, "
    + "www.thehotline.org/help/help-for-friends-and-family/.",
  "Hester, Marianne, Nicole Westmarland, Geetanjali Gangoli, Mike Wilkinson, "
    + "Caitriona O’Kelly, Andrew Kent, and Alana Diamond. \"Domestic "
    + "violence perpetrators: identifying needs to inform early intervention."
    + "\" Bristol: University of Bristol in association with the Northern Rock "
    + "Foundation and the Home Office (2006).",
  "Huisman, Kimberly, Jeri Martinez, and Cathleen Wilson. \"Training police "
    + "officers on domestic violence and racism: Challenges and strategies.\" "
    + "Violence Against Women 11, no. 6 (2005): 792-821.",
  "Hurley, K. F., Brown-Maher, T., Campbell, S. G., Wallace, T., Venugopal, "
    + "R., and Baggs, D. (2005). Emergency department patients’ opinions of "
    + "screening for intimate partner violence among women. Emergency Medicine "
    + "Journal, 22(2), 97-98.",
  "Lockwood, Daniel, and Ariane Prohaska. \"Police Officer Gender and "
    + "Attitudes toward Intimate Partner Violence: How policy can eliminate "
    + "stereotypes.\" International Journal of Criminal Justice Sciences 10, "
    + "no. 1 (2015).",
  "Johnson, Holly, and Tina Hotton. \"Losing control: Homicide risk in "
    + "estranged and intact intimate relationships.\" Homicide studies 7, no. "
    + "1 (2003): 58-84.",
  "Kassis, Brittany P. \"911 Dispatchers: Their Role as Evidence Collectors.\" "
    + "(2017).",
  "Laskey, Philippa, Elizabeth A. Bates, and Julie C. Taylor. \"A systematic "
    + "literature review of intimate partner violence victimization: an "
    + "inclusive review across gender and sexuality.\" Aggression and Violent "
    + "Behavior (2019).",
  "Meischke, Hendrika, Ian Painter, Michelle Lilly, Randal Beaton, Debra "
    + "Revere, Becca Calhoun, K. Seeley, Yvonne Carslay, Cathy Moe, and Janet "
    + "Baseman. \"An exploration of sources, symptoms and buffers of "
    + "occupational stress in 9-1-1 emergency call centers.\" Ann Emerg "
    + "Dispatch Response 3, no. 2 (2015): 28-35.",
  "New Jersey Division of Criminal Justice. \"Interviewing Techniques in "
    + "Domestic Violence Cases.\" New Jersey Division of Criminal Justice.",
  "Miller, Amalia R., and Carmit Segal. \"Do female officers improve law "
    + "enforcement quality? Effects on crime reporting and domestic violence "
    + "escalation.\" University of Zurich, UBS International Center of "
    + "Economics in Society, Working Paper 9 (2014).",
  "Niolon, P. H., and Centers for Disease Control and Prevention. (2017). "
    + "Preventing intimate partner violence across the lifespan: A technical "
    + "package of programs, policies, and practices. Government Printing "
    + "Office.",
  "O\'Dell, Anne. \"Why do police arrest victims of domestic violence? The "
    + "need for comprehensive training and investigative protocols.\" Journal "
    + "of Aggression, Maltreatment and Trauma 15, no. 3-4 (2007): 53-73.",
  "Rabe-Hemp, Cara E. \"Female officers and the ethic of care: Does officer "
    + "gender impact police behaviors?.\" Journal of criminal justice 36, no. "
    + "5 (2008): 426-434.",
  "Reaves, Brian A. Police response to domestic violence, 2006-2015. US "
    + "Department of Justice, Office of Justice Programs, Bureau of Justice "
    + "Statistics, 2017.",
  "Shah, Susan, Insha Rahman, and Anita Khashu. \"Overcoming Language "
    + "Barriers.\" Solutions for law enforcement (2007): 1-17.",
  "\"Statistics.\" NCADV: National Coalition Against Domestic Violence, 2020, "
    + "ncadv.org/statistics.",
  "Stalans, Loretta J., and Mary A. Finn. \"Gender differences in officers\' "
    + "perceptions and decisions about domestic violence cases.\" Women and "
    + "Criminal Justice 11, no. 3 (2000): 1-24.",
  "Stover, Carla Smith, and Kimberly Lent. \"Training and certification for "
    + "domestic violence service providers: The need for a national standard "
    + "curriculum and training approach.\" Psychology of violence 4, no. 2 "
    + "(2014): 117.",
  "Townsend, Meg, Dana Hunt, Sarah Kuck, and Caity Baxter. \"Law enforcement "
    + "response to domestic violence calls for service: Final report.\" "
    + "Washington, DC: US Department of Justice (2005).",
  "Turner, Kimberly D., \"Effects of Stress on 9-1-1 Call-Takers and Police "
    + "Dispatchers: A Study at the San Jose Police Department\" (2015). "
    + "Master\'s Theses. 4562. DOI: https://doi.org/10.31979/etd.3yxn-3pvm",
  "Types of Domestic Violence. Arizona Coalition To End Sexual and Domestic "
    + "Violence, 2020, www.acesdv.org/domestic-violence-graphics/types-of-"
    + "abuse/.",
  "\"What Is Domestic/Family Violence?\" Compass Center, 27 July 2016, "
    + "compassctr.org/get-help/domestic-violence/what-is-domesticfamily-"
    + "violence/.",
  "Whetstone, Thomas S. \"Measuring the impact of a domestic violence "
    + "coordinated response team.\" Policing: An International Journal of "
    + "Police Strategies and Management 24, no. 3 (2001): 371-398.",
  "Williams, Oliver J., William Oliver, and Marcus Pope. \"Domestic violence "
    + "in the African American community.\" Journal of Aggression, "
    + "Maltreatment and Trauma 16, no. 3 (2008): 229-237."
]; // Sources for info button