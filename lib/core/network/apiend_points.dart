class ApiEndPoints {
  static const String baseUrl = "http://16.171.29.173/api/";

  static const String localBaseUrl =
      "http://192.168.4.218/relative-choice/api/";

  static const String imageBaseUrl = "http://16.171.29.173/storage/";

  static const String localImageBaseUrl = "http://192.168.4.218/storage/";

  static const String betaCode = "submit-beta-code";

  static const String emailAddress = "is-email-exists";

  static const String otp = "send-otp";

  static const String matchOtp = "match-otp";

  static const String register = "register";

  static const String personalInformation = "add-personal-information";

  static const String login = "login";

  static const String checkOnBoardingStage = "check-onboarding-stage";

  static const String profile = "profile";

  static String userProfile(int id) => "get-user-profile/$id";

  static const String forgetPasswordSendOtp = "forgot-password-send-otp";

  static const String forgetPasswordMatchOtp = "forgot-password-match-otp";

  static const String updatePassword = "update-password";

  static const String changePassword = "change-password";

  static const String updateProfile = "update-profile";

  static const String addShowCaseImages = "add-showcase-images";

  static const String updateProfilePic = "update-profile-pic";

  static const String updatePrompt = "stories";

  static const String familyStructure = "update-family-structure";

  static const String partnerAge = "update-partner-age";

  static const String childrenAge = "update-children-age";

  static const String educationLevel = "update-education-level";

  static const String accountHolderFaith = "update-account-holder-faith";

  static const String partnerFaith = "update-partner-faith";

  static const String raceAndEthnicity = "update-account-holder-ethnicity";

  static const String partnerEthnicity = "update-partner-ethnicity";

  static const String childrenEthnicity = "update-children-ethnicity";

  static const String accountHolderPolitics = "update-account-holder-politics";

  static const String partnerPolitics = "update-partner-politics";

  static const String personalLifeStyle = "update-personal-lifestyle-choices";

  static const String petDetails = "update-pets-detail";

  static const String roleSought = "update-roles-sought";

  static const String roleToFulfill = "update-roles-to-fulfil";

  static const String involvement = "update-involvement";

  static const String distance = "update-distance";

  static const String faithPerferences =
      "update-roles-sought-faith-preferences";

  static const String rollRaceAndEthnicity = "update-roles-ethnicity";

  static const String politicalPrefrence = "update-roles-political-prefrences";

  static const String lifestylePrefrence = "update-roles-lifestyle-prefrences";

  static const String getMatchingRecords = "get-matching-records";

  static const String sendConnectionRequest = "send-connection-request";

  static const String acceptConnectionRequest = "accept-connection-request";

  static const String deleteConnectionRequest = "delete-connection-request";

  static const String addToMayBeList = "add-to-wishlist";

  static const String getMaybeList='get-wishlist';

  static const String getLikedByOther = "list-requests";

  static const String likedByMe = "list-sent-requests";

  static const String removeUserFrmSuggestion = "remove-user-from-suggestions";

  static const String cancelRequest = "cancel-sent-request";

  static const String getMatchedList = "get-connection-list";

  static const String blockUser = "block-user";

  static const String getBlockedUsers = "get-blocked-users";

  static const String reportUser = "report-user";

  static const String userShowCaseImages = "activity-feed";

  static const String dailyTips = "daily-tips";

}
