final class OnBoardingScreenContent {
  final String title;
  final String image;
  final String description;
  final String appName;
  final String moto;
     List<String> ?selectLanguage;



  OnBoardingScreenContent(
      {required this.title,
      required this.image,
      required this.description,
      required this.appName,
       this.selectLanguage,

      required this.moto});
}

List<OnBoardingScreenContent> contentList = [
  OnBoardingScreenContent(
      title: "Select Language",
      image: '',
      description: '',
     selectLanguage :languages,
      appName: "Eksukaa App",
      moto: "Easy Life."),
  OnBoardingScreenContent(
      title: "Welcome",
      image: "assets/images/welcome.png",
      selectLanguage: [],
      description:
          "Eksukaa App this passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets his passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets.",
      appName: "Eksukaa App",
      moto: "Easy Life."),
  OnBoardingScreenContent(
      title: "About",
      image: "assets/images/about.png",
      selectLanguage: [],
      description:
          "Eksukaa App this passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets his passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets.",
      appName: "Eksukaa App",
      moto: "Easy Life."),
  OnBoardingScreenContent(
      title: "User Agreement",
      image: "assets/images/Terms.png",
      selectLanguage: [],
      description:
          "Eksukaa App this passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets. This passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets.",
      appName: "Eksukaa App",
      moto: "Easy Life."),
  OnBoardingScreenContent(
      title: "Congratulation",
      image: "assets/images/congratulation.png",
      selectLanguage: [],
      description:
          "Eksukaa App this passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets his passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets.",
      appName: "Eksukaa App",
      moto: "Easy Life."),
];



List<String> languages = [
  'English',
  'Nepali',
  'Spanish',
  'French',
  'German',
  'Chinese',
  'Japanese',
  'Korean',
  // 'Arabic',
  // 'Russian',
  // 'Portuguese',
  // 'Italian',
  // 'Hindi',
  // 'Bengali',
  // 'Urdu',
  // 'Turkish',
  // 'Indonesian',
  // 'Vietnamese',
  // 'Thai',
  // 'Dutch',
  // 'Swedish',
  // 'Polish',
  // 'Ukrainian',
  // 'Romanian',
  // 'Greek',
  // 'Czech',
  // 'Danish',
  // 'Finnish',
  // 'Hungarian',
  // 'Norwegian',
  // 'Hebrew',
  
];