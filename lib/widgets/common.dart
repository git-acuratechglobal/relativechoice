import 'package:flutter/material.dart';
import 'package:relative_choice/Pages.dart/additional_screen.dart';
import 'package:relative_choice/Pages.dart/additional_screen2.dart';
import 'package:relative_choice/Pages.dart/distance.dart';
import 'package:relative_choice/Pages.dart/education.dart';
import 'package:relative_choice/Pages.dart/faith_perferences.dart';
import 'package:relative_choice/Pages.dart/family_structure.dart';
import 'package:relative_choice/Pages.dart/involvement.dart';
import 'package:relative_choice/Pages.dart/lifestyle_perference.dart';
import 'package:relative_choice/Pages.dart/partner_faith.dart';
import 'package:relative_choice/Pages.dart/partner_politics.dart';
import 'package:relative_choice/Pages.dart/personal_information.dart';
import 'package:relative_choice/Pages.dart/personal_lifestyle.dart';
import 'package:relative_choice/Pages.dart/pets.dart';
import 'package:relative_choice/Pages.dart/race_ethnicity_children.dart';
import 'package:relative_choice/Pages.dart/race_ethnicity_partner.dart';
import 'package:relative_choice/Pages.dart/race_ethnicity_primary.dart';
import 'package:relative_choice/profile/photo_upload.dart';
import 'package:relative_choice/Pages.dart/political.dart';
import 'package:relative_choice/Pages.dart/political_perferences.dart';
import 'package:relative_choice/Pages.dart/primary_account.dart';
import 'package:relative_choice/Pages.dart/race_ethnicity2.dart';
import 'package:relative_choice/profile/ready_upload.dart';
import 'package:relative_choice/Pages.dart/role_sought.dart';
import 'package:relative_choice/Pages.dart/roles_fullfill.dart';
import 'package:relative_choice/profile/profile_picture.dart';
import 'package:relative_choice/profile/story.dart';

class Common {
  static List<(Widget, Color)>  stepPageList(usertype){
return [
    (   Personal_Information(),
     Color(0xFFF6FFF4),
    
      
    ),
    (
      FamilyStructureScreen(),
    Color(0XFFF4FCFF),
    ),
   if(usertype != 'Individual' && usertype != 'Single Parent') (AdditionalScreen(), Colors.white),

    if(usertype != 'Individual' && usertype != 'Couple') (AdditionalScreen2(), Colors.white),
    (
      Education(),
      Color(0xFFF6FFF4),
    ),
    (
      PrimaryAccount(),
      Color(0XFFF4FCFF),
    ),
  if(usertype != 'Individual' && usertype != 'Single Parent')  (
      PartnerFaith(),
      Colors.white,
    ),
    (RaceEthnicity(), 
     Color(0xFFF6FFF4),
    ),
    if(usertype != 'Individual' && usertype != 'Single Parent')(RaceEthnicityPartner(), 
     Color(0XFFF4FCFF),
    ),
    if(usertype != 'Individual'&& usertype != 'Couple')(RaceEthnicityChildren(), Colors.white),
    (
      Politics(),
      Color(0xFFF6FFF4),
    ),
   if(usertype != 'Individual' && usertype != 'Single Parent') (PartnerPolitics(), 
    Color(0XFFF4FCFF),
    ),
    (
      PersonalLifestyle(),
      Colors.white,
    ),
    (
      Pets(),
      Color(0xFFF6FFF4),
    ),
  ];
  }  
  static List<(Widget, Color)> stepPageList2 = [
    (
      RoleSought(),
      Color(0xFFF6FFF4),
    ),
    (
      RolesFullfill(),
      Color(0XFFF4FCFF),
    ),
    (InvolvementScreen(), Colors.white),
    (
      Distance(),
      Color(0xFFF6FFF4),
    ),
    (FaithPerferences(), Color(0XFFF4FCFF)),
    (RaceEthnicity2(), Colors.white),
    (
      PoliticalPerferences(),
      Color(0xFFF6FFF4),
    ),
    (
      LifestylePerference(),
      Color(0XFFF4FCFF),
    ),
  ];

  List<String> labels = [
    'Agnostic',
    'Atheist',
    'Buddhism',
    'Catholicism',
    'Hinduism',
    'Islam',
    'Judaism',
    'Native/Indigenous Spirituality',
    'Protestantism',
    'Spiritual but Not Religious',
    'Other',
    'Prefer Not to Say'
  ];
  List<String> faithlabel = [
    'Agnostic',
    'Atheist',
    'Buddhism',
    'Catholicism',
    'Hinduism',
    'Islam',
    'Judaism',
    'Native/Indigenous Spirituality',
    'Protestantism',
    'Spiritual but Not Religious',
    'Prefer Not to Say'
  ];


  List<String> devoutness = [
    "Not Religious/Not Devout",
    "Somewhat Religious",
    "Moderately Religious",
    "Devout",
    "Very Devout "
  ];
  List<String> label = [
    'African American',
    'Asian',
    'Black',
    'Caucasian/White',
    'Hispanic/Latino',
    'Indigenous',
    'Middle Eastern',
    'Mixed Race',
    'Native American',
    'Pacific Islander',
    'Prefer Not to Say'
  ];
  List<String> politics = [
    'Apolitical',
    'Far Left',
    'Left-Leaning',
    'Moderate',
    'Right-Leaning',
    'Far Right',
    'Prefer Not to Say'
  ];

  List<String> drinking = [
    "Yes, Regularly",
    "Occasionally",
    "No",
    "Prefer Not to Say"
  ];
  List<String> pets = [
    'Dogs',
    'Cats',
    'Rodents',
    'Birds',
    'Fish',
    'Reptiles',
    'None'
  ];

  static List<(Widget, Color)> stepPageList3 = [
    (
      ProfilePicture(),
      Color(0xFFF6FFF4),
    ),
    (Story(), Color(0xFFF4FCFF)),
    (ReadyToUpload(),Colors.white),
    (PhotoUpload(),Color(0xFFF6FFF4),)
  ];

  List<String> roleoptions = [
    "Adult Child",
    "Aunt/Uncle",
    "Grandchild",
    "Grandparent",
    "Parent",
    "Sibling"
  ];

}




abstract class CommomUrl{
static String baseUrl = 'http://relative-choice.acublock.in/';
}