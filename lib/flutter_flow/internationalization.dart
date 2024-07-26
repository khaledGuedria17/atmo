import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? frText = '',
  }) =>
      [enText, esText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Onboarding
  {
    'f9al2jiq': {
      'en': 'Join the Green Revolution',
      'es': 'La experiencia de comprar comida rápidamente',
      'fr': 'L’expérience d’acheter de la nourriture rapidement',
    },
    'q7mzy88d': {
      'en':
          'Discover a platform where sustainable projects meet responsible investors. Our marketplace connects you to verified carbon units from innovative green initiatives.',
      'es':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'fr':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    },
    '2egoby3b': {
      'en': 'Browse, buy, and trade carbon units effortlessly.',
      'es': 'Encuentre y obtenga su mejor comida',
      'fr': 'Trouvez et obtenez votre meilleure nourriture',
    },
    'neuxxcug': {
      'en':
          'Allowing you to understand project impacts, track your investments, and support initiatives that matter.',
      'es':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'fr':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    },
    'rijctza1': {
      'en': 'Start Your Journey',
      'es': 'El mensajero de Foodie envía con amor.',
      'fr': 'Courrier gourmand envoyé avec amour',
    },
    '5cdcpcqz': {
      'en':
          'Join a community committed to sustainability and make a positive impact while achieving your environmental goals.',
      'es':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
      'fr':
          'Urna amet, suspendisse ullamcorper ac elit diam facilisis cursus vestibulum.',
    },
    '2044raxp': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    'kvk96b9a': {
      'en': 'Already Have an Account',
      'es': 'Ya tienes una cuenta',
      'fr': 'Vous avez déjà un compte',
    },
    'e9n9xv7z': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CreateAccount
  {
    'fqhfxosd': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    '8r2ftoyt': {
      'en': 'Start by creating your account',
      'es': 'Comience a aprender con crear su cuenta',
      'fr': 'Commencez à apprendre en créant votre compte',
    },
    'w8fbq6qd': {
      'en': 'Username',
      'es': 'Nombre de usuario',
      'fr': 'Nom d\'utilisateur',
    },
    'qyz8jn8k': {
      'en': 'Create your username',
      'es': 'Crea tu nombre de usuario',
      'fr': 'Créez votre nom d\'utilisateur',
    },
    '5ejt2igx': {
      'en': 'Email',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    '1k2s07d4': {
      'en': 'Enter your email address',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    '8hrnyurr': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    '5ta75wx9': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    '7318gst0': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    'eqdiv2sl': {
      'en': 'Or using other method',
      'es': 'O usando otro método',
      'fr': 'Ou en utilisant une autre méthode',
    },
    'nt2a4i5y': {
      'en': 'Sign Up with Google',
      'es': 'Regístrate con Google',
      'fr': 'Inscrivez-vous avec Google',
    },
    'tj5ofugi': {
      'en': 'Have an acccount',
      'es': 'tener una cuenta',
      'fr': 'Avoir un compte',
    },
    '96k4zm5b': {
      'en': 'Login',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    'i6bq0pen': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // OTPVerification
  {
    'lnxzjexp': {
      'en': 'Verification',
      'es': 'Verificación',
      'fr': 'Vérification',
    },
    'm8vt32wl': {
      'en': 'Verification Code',
      'es': 'Código de verificación',
      'fr': 'Le code de vérification',
    },
    'j0wt8bqq': {
      'en':
          'We have to sent the code verification, Please enter the code to move forward',
      'es':
          'Tenemos que enviar el código de verificación 1234. Ingrese el código para seguir adelante.',
      'fr':
          'Nous devons envoyer le code de vérification 1234, veuillez entrer le code pour avancer',
    },
    'vfbmvgvb': {
      'en': 'Verify',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    '5iqum420': {
      'en': 'Didn\'t recceive the code? ',
      'es': '¿No recibiste el código?',
      'fr': 'Vous n\'avez pas reçu le code ?',
    },
    '7axmi8vz': {
      'en': 'Resend',
      'es': 'Reenviar',
      'fr': 'Renvoyer',
    },
    'hvh480nv': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LoginAccount
  {
    'absgjmyr': {
      'en': 'Login Account',
      'es': 'Iniciar sesión cuenta',
      'fr': 'Compte de connexion',
    },
    '7yyc6yio': {
      'en': 'Please login with registered account',
      'es': 'Por favor inicie sesión con una cuenta registrada',
      'fr': 'Veuillez vous connecter avec un compte enregistré',
    },
    '0y1a56v9': {
      'en': 'Email or Phone Number',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    'xq55heau': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    'iyk0cszg': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'tec1pifi': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    '0c1sk3ec': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
      'fr': 'Mot de passe oublié?',
    },
    '58ybobvm': {
      'en': 'Sign in',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
    },
    'cy7y6bn2': {
      'en': 'Or using other method',
      'es': 'O usando otro método',
      'fr': 'Ou en utilisant une autre méthode',
    },
    'qwppiiww': {
      'en': 'Sign Up with Google',
      'es': 'Regístrate con Google',
      'fr': 'Inscrivez-vous avec Google',
    },
    '9ftxk5xj': {
      'en': 'Don\'t have an acccount',
      'es': 'No tengo una cuenta',
      'fr': 'Je n\'ai pas de compte',
    },
    'jlqha2r3': {
      'en': 'Sign up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    '84xsjzjp': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Home
  {
    '5kjdmx0a': {
      'en': 'Projects',
      'es': '',
      'fr': '',
    },
    'stmlu8t7': {
      'en': 'Let\'s find your next ride',
      'es': '',
      'fr': '',
    },
    'i79hp206': {
      'en': 'Crediting Period',
      'es': '',
      'fr': '',
    },
    'sze2aej1': {
      'en': 'Issued ACU',
      'es': '',
      'fr': '',
    },
    'cnmcp5m3': {
      'en': 'APT/ACU',
      'es': '',
      'fr': '',
    },
    'tzgsgmft': {
      'en': 'Crediting Period',
      'es': '',
      'fr': '',
    },
    'i87sd34z': {
      'en': 'Issued ACU',
      'es': '',
      'fr': '',
    },
    'uegxbpbd': {
      'en': 'APT/ACU',
      'es': '',
      'fr': '',
    },
    '3w02n9mc': {
      'en': 'Add Project',
      'es': '',
      'fr': '',
    },
    'yuxvfcy0': {
      'en': 'Projects',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Investment
  {
    'xsdk8ayt': {
      'en': 'Investments',
      'es': '',
      'fr': '',
    },
    '460io703': {
      'en': 'Investments',
      'es': 'Mis ordenes',
      'fr': 'Mes commandes',
    },
  },
  // Details
  {
    '93m8nma2': {
      'en': 'ACUs Issued ',
      'es': '',
      'fr': '',
    },
    '69nn3dah': {
      'en': 'ACUs Retired ',
      'es': '',
      'fr': '',
    },
    'wnl8n2u6': {
      'en': 'Price /ACU',
      'es': '',
      'fr': '',
    },
    'dq83u7hh': {
      'en': 'NFT Details',
      'es': 'Ubicación',
      'fr': 'Emplacement',
    },
    'nts44an2': {
      'en': 'Description',
      'es': '',
      'fr': '',
    },
    'lznlkr7q': {
      'en': 'Project Type',
      'es': '',
      'fr': '',
    },
    '5ei05ssd': {
      'en': 'Methodology',
      'es': '',
      'fr': '',
    },
    'q69v5nti': {
      'en': 'Status',
      'es': '',
      'fr': '',
    },
    'gmc1eghx': {
      'en': 'Crediting Period',
      'es': '',
      'fr': '',
    },
    'rl8xur8h': {
      'en': 'Location',
      'es': '',
      'fr': '',
    },
    '480erb6b': {
      'en': 'ACUs Issued',
      'es': '',
      'fr': '',
    },
    'rjr56zu2': {
      'en': 'Add ACUs',
      'es': '',
      'fr': '',
    },
    'ew12fymt': {
      'en': 'Documents',
      'es': '',
      'fr': '',
    },
    'sg5jutkv': {
      'en': 'ACUs Issued ',
      'es': '',
      'fr': '',
    },
    '8k65ncpp': {
      'en': 'Checkout',
      'es': 'añadir a la cesta',
      'fr': 'Ajouter au panier',
    },
    '8fdhdr0e': {
      'en': 'Verify',
      'es': '',
      'fr': '',
    },
    'i1oj2yib': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Checkout-Verification
  {
    'obpxi59l': {
      'en': 'Checkout',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    'n7dh8d4x': {
      'en': 'Verification',
      'es': '',
      'fr': '',
    },
    'kyyepckw': {
      'en': 'Available ACUs ',
      'es': '',
      'fr': '',
    },
    '6e73xcrq': {
      'en': 'Crediting Period',
      'es': '',
      'fr': '',
    },
    'r2zpmxhp': {
      'en': 'APT/ACU',
      'es': '',
      'fr': '',
    },
    'u172lc5w': {
      'en': 'Total',
      'es': '',
      'fr': '',
    },
    '42n6g8rr': {
      'en': '\$',
      'es': '',
      'fr': '',
    },
    'mmqe4ifa': {
      'en': '19.9',
      'es': '',
      'fr': '',
    },
    'hegb680m': {
      'en': 'Checkout Now',
      'es': '',
      'fr': '',
    },
    'uf94lqy3': {
      'en': 'Holder Address',
      'es': '',
      'fr': '',
    },
    'pgawtrrn': {
      'en': 'Reward',
      'es': '',
      'fr': '',
    },
    'ikx62vh4': {
      'en': '\$',
      'es': '',
      'fr': '',
    },
    '8bbedde8': {
      'en': ' 40.0',
      'es': '',
      'fr': '',
    },
    'w5zimr09': {
      'en': 'Make sure to copy Holder Petra Address before proceeding ',
      'es': '',
      'fr': '',
    },
    'quudlufl': {
      'en': 'Verify Now',
      'es': '',
      'fr': '',
    },
    's9adsn9i': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Profile
  {
    'k9p4o7mq': {
      'en': 'General',
      'es': 'General',
      'fr': 'Général',
    },
    'huf27lxh': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'ds506agm': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    'rnd1sxmy': {
      'en': 'KYC',
      'es': 'Notificación de configuración',
      'fr': 'Paramètre de notification',
    },
    'd4rascv3': {
      'en': 'KYC',
      'es': '',
      'fr': '',
    },
    'qnlsz51m': {
      'en': 'My Projects',
      'es': '',
      'fr': '',
    },
    'o3t7i8tr': {
      'en': 'Language',
      'es': '',
      'fr': '',
    },
    'cow5ksut': {
      'en': 'About',
      'es': 'Preferencias',
      'fr': 'Préférences',
    },
    'a2ajdwfn': {
      'en': 'Terms and Conditions',
      'es': '',
      'fr': '',
    },
    'dlfhctl6': {
      'en': 'Privacy Policy',
      'es': '',
      'fr': '',
    },
    '33gpjjpl': {
      'en': 'Help & Support',
      'es': 'Servicio de asistencia',
      'fr': 'Support d\'aide',
    },
    '4k922abp': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    'tpcxi4d9': {
      'en': 'Profile',
      'es': 'Configuración',
      'fr': 'Paramètre',
    },
  },
  // EditProfile
  {
    'czlgmhds': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    '36zgxj4d': {
      'en': 'Username',
      'es': 'Nombre de usuario',
      'fr': 'Nom d\'utilisateur',
    },
    '3ia1b2s1': {
      'en': 'Create your username',
      'es': 'Crea tu nombre de usuario',
      'fr': 'Créez votre nom d\'utilisateur',
    },
    'y62t4x4v': {
      'en': 'Email',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    'qoq8rd90': {
      'en': 'Create your email',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    'wljoazp7': {
      'en': 'Phone Number',
      'es': '',
      'fr': '',
    },
    'vrtr6uvq': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
      'fr': 'Sauvegarder les modifications',
    },
    'ubo5xh9z': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ChangePassword
  {
    'qta47nw1': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    'm44q6y3o': {
      'en': 'New Password',
      'es': 'Nueva contraseña',
      'fr': 'nouveau mot de passe',
    },
    'ytk5ba6l': {
      'en': 'Enter new password',
      'es': 'Ingrese nueva clave',
      'fr': 'Entrez un nouveau mot de passe',
    },
    '8dzaf869': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
    },
    '8q91wovk': {
      'en': 'Confirm your new password',
      'es': 'Confirma tu nueva contraseña',
      'fr': 'Confirmez votre nouveau mot de passe',
    },
    'hi2yymxk': {
      'en': 'Chnage Now',
      'es': 'Cambiar ahora',
      'fr': 'Changement maintenant',
    },
    '92rkz0wl': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Language
  {
    'pw9fhsfe': {
      'en': 'Language',
      'es': 'Idioma',
      'fr': 'Langue',
    },
    '54vikyjk': {
      'en': 'Search language',
      'es': 'Idioma de búsqueda',
      'fr': 'Langue de recherche',
    },
    '6x0nymve': {
      'en': 'English',
      'es': 'Inglés',
      'fr': 'Anglais',
    },
    'lwrdsvca': {
      'en': 'Spanish',
      'es': 'Español',
      'fr': 'Espagnol',
    },
    'h8koak8c': {
      'en': 'French',
      'es': 'Francés',
      'fr': 'Français',
    },
    '3sa48wmg': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // EmptyScreen
  {
    'pv5ygd8b': {
      'en': 'Balance',
      'es': 'Notificaciones',
      'fr': 'Notifications',
    },
    'vmced3si': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // HelpandSupport
  {
    'pwzylnu2': {
      'en': 'Help and Support',
      'es': 'Ayuda y apoyo',
      'fr': 'Aide et soutien',
    },
    '0hxomwjo': {
      'en': 'Search',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    'u7zay0at': {
      'en': 'How do I sign up for RideWise?',
      'es': 'Título de soporte',
      'fr': 'Titre de l\'assistance',
    },
    'iq6peolc': {
      'en':
          'To sign up for RideWise, download the app from the App Store or Google Play Store. Open the app and click on the \"Sign Up\" button. You will be prompted to enter your email address, create a password, and provide some basic information about yourself. After verifying your email address, you can complete your profile and start using RideWise to find carpool partners.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercice ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'iku16ozk': {
      'en': 'How does the carbon footprint tracker work?',
      'es': 'Título de soporte',
      'fr': 'Titre de l\'assistance',
    },
    '70iqrdwa': {
      'en':
          'The carbon footprint tracker in RideWise calculates the amount of carbon dioxide (CO2) emissions saved by carpooling instead of driving alone. It takes into account the distance traveled and the average emissions of a car. Each time you complete a carpool ride, the app updates your total CO2 savings and displays it in your profile. This way, you can see the positive environmental impact you are making by using RideWise.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercice ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    '5j0pbo9z': {
      'en': 'Is RideWise safe to use?',
      'es': 'Título de soporte',
      'fr': 'Titre de l\'assistance',
    },
    'm803mq12': {
      'en':
          'Yes, RideWise prioritizes safety and security for all users. All users are required to verify their email and phone number during the sign-up process. Additionally, the app includes a rating and review system to help ensure a trustworthy community. You can also share your ride details with family and friends for added peace of mind. If you ever feel unsafe, you can report any concerns directly through the app.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercice ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'dhwvt3h7': {
      'en': 'How do I share the cost of the ride with my carpool partners?',
      'es': 'Título de soporte',
      'fr': 'Titre de l\'assistance',
    },
    'bkjcz8kj': {
      'en':
          'RideWise has an integrated payment system that makes it easy to share the cost of the ride. When you set up a carpool ride, the app automatically calculates the cost based on the distance traveled and divides it among the passengers. At the end of the ride, each passenger can pay their share through the app using a credit card, debit card, or other accepted payment methods. This ensures a fair and transparent cost-sharing process.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercice ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'clq57ljv': {
      'en': ' What if my plans change or I need to cancel a ride?',
      'es': 'Título de soporte',
      'fr': 'Titre de l\'assistance',
    },
    'vvpixpr1': {
      'en':
          ' If your plans change or you need to cancel a ride, you can do so directly through the RideWise app. Go to your scheduled rides, select the ride you need to cancel, and click the \"Cancel\" button. Please try to cancel as early as possible to give your carpool partners enough notice. Repeated cancellations without notice may affect your rating and ability to join future carpools.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'fr':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n\nquis nostrud exercice ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'leiu5g56': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // TermsAndConditions
  {
    'vkgb4h04': {
      'en': 'Terms and conditions',
      'es': 'Legales y Políticas',
      'fr': 'Mentions légales et politiques',
    },
    'icfwkxvp': {
      'en': 'AGREEMENT TO OUR LEGAL TERMS',
      'es': 'Términos',
      'fr': 'Termes',
    },
    'd216tz8f': {
      'en':
          'We are Private Higher School of Engineering and Technology (\"Company,\" \"we,\" \"us,\" \"our\").\nWe operate the mobile application Ride wise (the \"App\"), as well as any other related products and services that refer or link to these legal terms (the \"Legal Terms\") (collectively, the \"Services\").\nRideWise is an innovative carpooling application designed to connect commuters who share similar routes and schedules. The primary goal of RideWise is to promote sustainable transportation by facilitating carpooling, thereby reducing the number of vehicles on the road and minimizing carbon emissions.\nYou can contact us by phone at 70686506, email at contact@esprit.tn, or by mail to Z.I Chotrana I| - B.P. 160 Pôle Technologique, Cite El Ghazala Raoued , Ariana 2083, Tunisia.\nThese Legal Terms constitute a legally binding agreement made between you, whether personally or on behalf of an entity (\"you\"), and Private Higher School of Engineering and Technology, concerning your access to and use of the Services. You agree that by accessing the Services, you have read, understood, and agreed to be bound by all of these Legal Terms. IF YOU DO NOT AGREE WITH ALL OF THESE LEGAL TERMS, THEN YOU ARE EXPRESSLY PROHIBITED FROM USING THE SERVICES AND YOU MUST DISCONTINUE USE IMMEDIATELY.\nWe will provide you with prior notice of any scheduled changes to the Services you are using. The modified Legal Terms will become effective upon posting or notifying you by no-reply@esprit.n, as stated in the email message. By continuing to use the Services after the effective date of any changes, you agree to be bound by the modified terms.\nThe Services are intended for users who are at least 18 years old. Persons under the age of 18 are not permitted to use or register for the Services.\nWe recommend that you print a copy of these Legal Terms for your records.',
      'es':
          'Al utilizar esta aplicación, usted acepta cumplir y estar sujeto a los siguientes términos y condiciones. Por favor revíselos detenidamente. Si no está de acuerdo con estos términos, no debe utilizar esta aplicación. El término \"nosotros\" o \"nosotros\" se refiere a [Nombre de su empresa], el propietario de esta aplicación. El término \"usted\" se refiere al usuario o espectador de nuestra aplicación.\n\nTérminos, no debes utilizar esta aplicación. El término \"nosotros\" o \"nosotros\" se refiere a [Nombre de su empresa], el propietario de esta aplicación. El término \"usted\" se refiere al usuario o espectador de nuestra aplicación.',
      'fr':
          'En utilisant cette application, vous acceptez de respecter et d\'être lié par les termes et conditions suivants. Veuillez les examiner attentivement. Si vous n\'acceptez pas ces conditions, vous ne devez pas utiliser cette application. Le terme « nous » ou « nous » fait référence à [Nom de votre entreprise], propriétaire de cette application. Le terme « vous » fait référence à l\'utilisateur ou au spectateur de notre application.\n\nConditions, vous ne devez pas utiliser cette application. Le terme « nous » ou « nous » fait référence à [Nom de votre entreprise], propriétaire de cette application. Le terme « vous » fait référence à l\'utilisateur ou au spectateur de notre application.',
    },
    'mf4seg4j': {
      'en': 'Changes to the Service and/or Terms:',
      'es': 'Cambios al Servicio y/o Términos:',
      'fr': 'Modifications du Service et/ou des Conditions :',
    },
    '4aolvysc': {
      'en':
          'We reserve the right to change, modify, or remove the contents of the Services at any time or for any reason at our sole discretion without notice. However, we have no obligation to update any information on our Services. We also reserve the right to modify or discontinue all or part of the Services without notice at any time. We will not be liable to you or any third party for any modification, price change, suspension, or discontinuance of the Services.\nWe cannot guarantee the Services will be available at all times. We may experience hardware, software, or other problems or need to perform maintenance related to the Services, resulting in interruptions, delays, or errors. We reserve the right to change, revise, update, suspend, discontinue, or otherwise modify the Services at any time or for any reason without notice to you. You agree that we have no liability whatsoever for any loss, damage, or inconvenience caused by your inability to access or use the Services during any downtime or discontinuance of the Services. Nothing in these Legal Terms will be construed to obligate us to maintain and support the Services or to supply any corrections, updates, or releases in connection therewith.',
      'es':
          'Esta aplicación se le proporciona \"tal cual\" y no ofrecemos garantía expresa o implícita de ningún tipo con respecto a su funcionalidad, operatividad o uso, incluidos, entre otros.\n\nCualquier garantía implícita de comerciabilidad, idoneidad para un propósito particular o infracción. Renunciamos expresamente a cualquier responsabilidad por daños directos, indirectos, consecuentes, incidentales o especiales, incluidos, entre otros, pérdida de ingresos, pérdida de ganancias, pérdidas resultantes de la interrupción del negocio o la pérdida de\n\ndatos, independientemente de la forma de acción o teoría jurídica bajo la cual se pueda hacer valer la responsabilidad, incluso si se le advierte de la posibilidad o probabilidad de tales daños.\n\n\nAl utilizar esta aplicación, usted acepta cumplir y estar sujeto a los siguientes términos y condiciones. Por favor revíselos detenidamente. Si no está de acuerdo con estos términos, no debe utilizar esta aplicación. El término \"nosotros\" o \"nosotros\" se refiere a [Nombre de su empresa], el propietario de esta aplicación. El término \"usted\" se refiere al usuario o espectador de nuestra aplicación.',
      'fr':
          'Cette application vous est fournie « telle quelle » et nous n\'offrons aucune garantie expresse ou implicite de quelque nature que ce soit en ce qui concerne sa fonctionnalité, son opérabilité ou son utilisation, y compris, sans limitation.\n\nToute garantie implicite de qualité marchande, d’adéquation à un usage particulier ou de contrefaçon. Nous déclinons expressément toute responsabilité, quelle qu\'elle soit, pour tout dommage direct, indirect, consécutif, accidentel ou spécial, y compris, sans limitation, la perte de revenus, la perte de profits, les pertes résultant d\'une interruption des activités ou d\'une perte de\n\ndonnées, quelle que soit la forme d\'action ou la théorie juridique en vertu de laquelle la responsabilité peut être invoquée, même si elle est informée de la possibilité ou de la probabilité de tels dommages.\n\n\nEn utilisant cette application, vous acceptez de respecter et d\'être lié par les termes et conditions suivants. Veuillez les examiner attentivement. Si vous n\'acceptez pas ces conditions, vous ne devez pas utiliser cette application. Le terme « nous » ou « nous » fait référence à [Nom de votre entreprise], propriétaire de cette application. Le terme « vous » fait référence à l\'utilisateur ou au spectateur de notre application.',
    },
    'x014ew2n': {
      'en': 'Terms',
      'es': 'Términos',
      'fr': 'Termes',
    },
    'o3qpa1ln': {
      'en':
          'By using this application, you agree to comply with and be bound by the following terms and conditions. Please review them carefully. If you do not agree to these terms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.\n\nTerms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.',
      'es':
          'Al utilizar esta aplicación, usted acepta cumplir y estar sujeto a los siguientes términos y condiciones. Por favor revíselos detenidamente. Si no está de acuerdo con estos términos, no debe utilizar esta aplicación. El término \"nosotros\" o \"nosotros\" se refiere a [Nombre de su empresa], el propietario de esta aplicación. El término \"usted\" se refiere al usuario o espectador de nuestra aplicación.\n\nTérminos, no debes utilizar esta aplicación. El término \"nosotros\" o \"nosotros\" se refiere a [Nombre de su empresa], el propietario de esta aplicación. El término \"usted\" se refiere al usuario o espectador de nuestra aplicación.',
      'fr':
          'En utilisant cette application, vous acceptez de respecter et d\'être lié par les termes et conditions suivants. Veuillez les examiner attentivement. Si vous n\'acceptez pas ces conditions, vous ne devez pas utiliser cette application. Le terme « nous » ou « nous » fait référence à [Nom de votre entreprise], propriétaire de cette application. Le terme « vous » fait référence à l\'utilisateur ou au spectateur de notre application.\n\nConditions, vous ne devez pas utiliser cette application. Le terme « nous » ou « nous » fait référence à [Nom de votre entreprise], propriétaire de cette application. Le terme « vous » fait référence à l\'utilisateur ou au spectateur de notre application.',
    },
    'ul7nhajj': {
      'en': 'for more information visit our   ',
      'es': '',
      'fr': '',
    },
    'i3es496o': {
      'en': 'terms and condition',
      'es': '',
      'fr': '',
    },
    '8uluwyex': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Wallet
  {
    '6uf335rj': {
      'en': 'Wallet',
      'es': '',
      'fr': '',
    },
    'r8rp5asx': {
      'en': '101,0012',
      'es': '',
      'fr': '',
    },
    '5cghns3m': {
      'en': 'APT',
      'es': '',
      'fr': '',
    },
    'la279z4l': {
      'en': 'Amount estimated',
      'es': '',
      'fr': '',
    },
    '21c5de0x': {
      'en': '\$60.3',
      'es': '',
      'fr': '',
    },
    'lbk1v02q': {
      'en': 'Connect Petra Wallet',
      'es': '',
      'fr': '',
    },
    '9y0p91if': {
      'en': 'Transactions',
      'es': '',
      'fr': '',
    },
    '3uidqaaw': {
      'en': '0xb3dff3a1bf6ab4559fc47330c625afd8a60da058',
      'es': '',
      'fr': '',
    },
    'pwsddfj6': {
      'en': 'Income',
      'es': '',
      'fr': '',
    },
    '81snow2v': {
      'en': '1 TCP',
      'es': '',
      'fr': '',
    },
    'k9015e4b': {
      'en': 'Tues. 15, 4:32',
      'es': '',
      'fr': '',
    },
    '1no91t74': {
      'en': '0xb3dff3a1bf6ab4559fc47330c625afd8a60da058',
      'es': '',
      'fr': '',
    },
    '7kbyhafr': {
      'en': 'Withdraw',
      'es': '',
      'fr': '',
    },
    'cj3jazzo': {
      'en': '\$60.00',
      'es': '',
      'fr': '',
    },
    '8x1hwmoy': {
      'en': 'Tues. 15, 4:32',
      'es': '',
      'fr': '',
    },
    'tebvdxnk': {
      'en': 'Wallet',
      'es': '',
      'fr': '',
    },
  },
  // PrivacyPolicy
  {
    'j9qok2qi': {
      'en': 'Privacy Policy',
      'es': '',
      'fr': '',
    },
    '8ik3w5sa': {
      'en': 'Terms',
      'es': '',
      'fr': '',
    },
    'sbyif0az': {
      'en':
          'This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.\n\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy.',
      'es': '',
      'fr': '',
    },
    '7d0677n5': {
      'en': 'Changes to the Service and/or Terms:',
      'es': '',
      'fr': '',
    },
    '1ii6u7po': {
      'en':
          'We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.\n\nWe will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the \"Last updated\" date at the top of this Privacy Policy.\n\nYou are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.',
      'es': '',
      'fr': '',
    },
    'wxkq6i7c': {
      'en': 'Terms',
      'es': '',
      'fr': '',
    },
    '2zm5634p': {
      'en':
          'By using this application, you agree to comply with and be bound by the following terms and conditions. Please review them carefully. If you do not agree to these terms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.\n',
      'es': '',
      'fr': '',
    },
    '75r3t6qt': {
      'en': 'for more information visit our   ',
      'es': '',
      'fr': '',
    },
    'kki9ue7x': {
      'en': 'privacy policy ',
      'es': '',
      'fr': '',
    },
    'ializd9l': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // KYC
  {
    '46nyk0n4': {
      'en': 'Skip',
      'es': '',
      'fr': '',
    },
    'fe20mvuz': {
      'en': 'KYC',
      'es': '',
      'fr': '',
    },
    'lggycklt': {
      'en': 'First Step : Who you are?',
      'es': '',
      'fr': '',
    },
    '1pzb0pvi': {
      'en': 'Fullname',
      'es': '',
      'fr': '',
    },
    '550jemp3': {
      'en': 'Firstname Lastname',
      'es': '',
      'fr': '',
    },
    'pbules65': {
      'en': 'Document Number',
      'es': '',
      'fr': '',
    },
    '24p9rx3q': {
      'en': 'Document Number/ID',
      'es': '',
      'fr': '',
    },
    '4jn5cjwf': {
      'en': 'Country',
      'es': '',
      'fr': '',
    },
    'vj8ar3kl': {
      'en': 'Please select...',
      'es': '',
      'fr': '',
    },
    '9s8yr47k': {
      'en': 'Search for an item...',
      'es': '',
      'fr': '',
    },
    'vsxi09vj': {
      'en': 'Upload Passport - Front',
      'es': '',
      'fr': '',
    },
    'j05hgizn': {
      'en': 'Next',
      'es': '',
      'fr': '',
    },
    '0nsatgx0': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // KYC2
  {
    '7pztgffd': {
      'en': 'Back',
      'es': '',
      'fr': '',
    },
    'ysrix11b': {
      'en': 'Skip',
      'es': '',
      'fr': '',
    },
    'oi0vqkf4': {
      'en': 'KYC',
      'es': '',
      'fr': '',
    },
    'fqer8zgt': {
      'en': 'One More Step : Business details',
      'es': '',
      'fr': '',
    },
    'qtsqxw6y': {
      'en': 'Company name',
      'es': '',
      'fr': '',
    },
    'j7vf0oe9': {
      'en': 'Company name\n',
      'es': '',
      'fr': '',
    },
    '0l25kkfp': {
      'en': 'Legal Form',
      'es': '',
      'fr': '',
    },
    '7z4zzx2k': {
      'en': 'Document Number/ID',
      'es': '',
      'fr': '',
    },
    '3cg8k7rp': {
      'en': 'Registration Number',
      'es': '',
      'fr': '',
    },
    '53li8ygb': {
      'en': 'Document Number/ID',
      'es': '',
      'fr': '',
    },
    'edgh1uyt': {
      'en': 'Incorporation Date',
      'es': '',
      'fr': '',
    },
    'cqx3znot': {
      'en': 'Document Number/ID',
      'es': '',
      'fr': '',
    },
    'hf73d92z': {
      'en': 'Registered Address',
      'es': '',
      'fr': '',
    },
    'jhsvsexa': {
      'en': 'Document Number/ID',
      'es': '',
      'fr': '',
    },
    'd7s5d1ju': {
      'en': 'Tax Identification Number',
      'es': '',
      'fr': '',
    },
    '06z9w531': {
      'en': 'Document Number/ID',
      'es': '',
      'fr': '',
    },
    'rmynehcd': {
      'en': 'Upload Certificate of Incorporation',
      'es': '',
      'fr': '',
    },
    'i2m7zxye': {
      'en': 'VCS Project Validator',
      'es': '',
      'fr': '',
    },
    '7lun5cjx': {
      'en': 'I am aVCS Certification Provider ',
      'es': '',
      'fr': '',
    },
    'tksu2g7b': {
      'en': 'Add for review',
      'es': '',
      'fr': '',
    },
    '4623g0bg': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // MyProjects
  {
    'i4fci280': {
      'en': 'My Projects',
      'es': '',
      'fr': '',
    },
    'vsnbzfhz': {
      'en': 'Boost your project ',
      'es': '',
      'fr': '',
    },
    'jlue4vm5': {
      'en': 'Gain in visibility by boosting your project',
      'es': '',
      'fr': '',
    },
    '6gl8yvxc': {
      'en': 'Crediting Period',
      'es': '',
      'fr': '',
    },
    '79t39hzq': {
      'en': 'Issued ACU',
      'es': '',
      'fr': '',
    },
    '09wticqx': {
      'en': 'APT/ACU',
      'es': '',
      'fr': '',
    },
    '5sipqv27': {
      'en': 'Tap to create your NFT',
      'es': '',
      'fr': '',
    },
    'ojl0lt87': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // AddACU
  {
    '53usi889': {
      'en': 'Add Issued VCS',
      'es': '',
      'fr': '',
    },
    '1rp1jp2e': {
      'en': 'Crediting Period Start',
      'es': '',
      'fr': '',
    },
    '48psvcl4': {
      'en': 'Crediting Period End',
      'es': '',
      'fr': '',
    },
    '33v7v9wa': {
      'en': 'ACUs',
      'es': '',
      'fr': '',
    },
    'upincvd2': {
      'en': 'Submit',
      'es': '',
      'fr': '',
    },
    'wbhozaj6': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // AddProject
  {
    'o9vtjes4': {
      'en': 'Add Project',
      'es': '',
      'fr': '',
    },
    'cdognuzb': {
      'en': 'Step 1',
      'es': '',
      'fr': '',
    },
    'z1gfghja': {
      'en': 'Verra Project ID',
      'es': '',
      'fr': '',
    },
    'jfnvcvp5': {
      'en': 'ID',
      'es': '',
      'fr': '',
    },
    '2pbboxge': {
      'en': 'Project name',
      'es': '',
      'fr': '',
    },
    'pcugn7gg': {
      'en': 'Intitled',
      'es': '',
      'fr': '',
    },
    'rnd6tvhn': {
      'en': 'Project Description',
      'es': '',
      'fr': '',
    },
    'mf0s3bzi': {
      'en': '\n\nDescription',
      'es': '',
      'fr': '',
    },
    'dwd7ax89': {
      'en': 'Crediting Period Start',
      'es': '',
      'fr': '',
    },
    '0i6wgpdk': {
      'en': 'Crediting Period End',
      'es': '',
      'fr': '',
    },
    '5ezaoh6z': {
      'en': 'Next',
      'es': '',
      'fr': '',
    },
    '9w49wknh': {
      'en': 'Step 2',
      'es': '',
      'fr': '',
    },
    'omamjeh4': {
      'en': 'Project type',
      'es': '',
      'fr': '',
    },
    '6vxn4xud': {
      'en': 'Option 1',
      'es': '',
      'fr': '',
    },
    'hdyexi0u': {
      'en': 'Please select...',
      'es': '',
      'fr': '',
    },
    'lcyxrgd2': {
      'en': 'Search for an item...',
      'es': '',
      'fr': '',
    },
    '0y13lc8j': {
      'en': 'Methodology',
      'es': '',
      'fr': '',
    },
    '59p9n81e': {
      'en': 'Option 1',
      'es': '',
      'fr': '',
    },
    'apwmwau8': {
      'en': 'Please select...',
      'es': '',
      'fr': '',
    },
    'o7osla97': {
      'en': 'Search for an item...',
      'es': '',
      'fr': '',
    },
    'x2oep034': {
      'en': 'Status',
      'es': '',
      'fr': '',
    },
    '1uppvxz7': {
      'en': 'Option 1',
      'es': '',
      'fr': '',
    },
    'xpjb70y6': {
      'en': 'Please select...',
      'es': '',
      'fr': '',
    },
    'uekpeed3': {
      'en': 'Search for an item...',
      'es': '',
      'fr': '',
    },
    'xudy4eqs': {
      'en': 'Country',
      'es': '',
      'fr': '',
    },
    'tooljh9i': {
      'en': 'Please select...',
      'es': '',
      'fr': '',
    },
    'w5y2lss2': {
      'en': 'Search for an item...',
      'es': '',
      'fr': '',
    },
    'ezpg5un2': {
      'en': 'Region',
      'es': '',
      'fr': '',
    },
    '0497p2l1': {
      'en': 'Option 1',
      'es': '',
      'fr': '',
    },
    'i4azc1hw': {
      'en': 'Please select...',
      'es': '',
      'fr': '',
    },
    'nqhhcvhf': {
      'en': 'Search for an item...',
      'es': '',
      'fr': '',
    },
    'ooq9h1dg': {
      'en': 'Project Life Estimated ACUs',
      'es': '',
      'fr': '',
    },
    'e21hfh7k': {
      'en': 'All Time ACUs',
      'es': '',
      'fr': '',
    },
    'ocemypkz': {
      'en': 'Price /ACU ',
      'es': '',
      'fr': '',
    },
    'i2en7132': {
      'en': 'APT /ACU',
      'es': '',
      'fr': '',
    },
    '3b54yd1k': {
      'en': 'VCS Project Validator',
      'es': '',
      'fr': '',
    },
    'vntjx9fa': {
      'en': 'Option 1',
      'es': '',
      'fr': '',
    },
    't0qu4af3': {
      'en': 'Please select...',
      'es': '',
      'fr': '',
    },
    'rocmck8m': {
      'en': 'Search for an item...',
      'es': '',
      'fr': '',
    },
    'u70o5dgs': {
      'en': 'Next',
      'es': '',
      'fr': '',
    },
    'orfvoevg': {
      'en': 'Step 3',
      'es': '',
      'fr': '',
    },
    'nqtj2rpn': {
      'en': 'VCS PIPELINE DOCUMENTS',
      'es': '',
      'fr': '',
    },
    'alhyjr0g': {
      'en': 'Upload PDF',
      'es': '',
      'fr': '',
    },
    'nd5a0f62': {
      'en': 'Al Multaqa_Issuance-Representation-Single-PP-v4.3.pdf',
      'es': '',
      'fr': '',
    },
    'csyzae8d': {
      'en': 'VCS REGISTRATION DOCUMENTS',
      'es': '',
      'fr': '',
    },
    'pp08z2vw': {
      'en': 'Upload PDF',
      'es': '',
      'fr': '',
    },
    '77an561u': {
      'en': 'Al Multaqa_Issuance-Representation-Single-PP-v4.3.pdf',
      'es': '',
      'fr': '',
    },
    'dnol3e8q': {
      'en': 'VCS ISSUANCE DOCUMENTS',
      'es': '',
      'fr': '',
    },
    'dqfg5p31': {
      'en': 'Upload PDF',
      'es': '',
      'fr': '',
    },
    'ew2xq2q6': {
      'en': 'Al Multaqa_Issuance-Representation-Single-PP-v4.3.pdf',
      'es': '',
      'fr': '',
    },
    '9u2zbw2z': {
      'en': 'VCS OTHER DOCUMENTS',
      'es': '',
      'fr': '',
    },
    'n746kjet': {
      'en': 'Upload PDF',
      'es': '',
      'fr': '',
    },
    'ya53dthx': {
      'en': 'Al Multaqa_Issuance-Representation-Single-PP-v4.3.pdf',
      'es': '',
      'fr': '',
    },
    'skrqkd56': {
      'en': 'Next',
      'es': '',
      'fr': '',
    },
    '8vcv8uz3': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '85gklng2': {
      'en': 'Petra Address',
      'es': '',
      'fr': '',
    },
    'ulqmj95a': {
      'en': 'Validate your project within 24H after your submission',
      'es': '',
      'fr': '',
    },
    'i3w68mus': {
      'en': 'Premium Publish',
      'es': '',
      'fr': '',
    },
    'a0c517bd': {
      'en': 'Cancel Premium Publish',
      'es': '',
      'fr': '',
    },
    '7mp85xqt': {
      'en': 'Review Express',
      'es': '',
      'fr': '',
    },
    'ss5uqrdq': {
      'en': '\$',
      'es': '',
      'fr': '',
    },
    'hkpqbcsd': {
      'en': '19.9',
      'es': '',
      'fr': '',
    },
    'y4fh0150': {
      'en': 'Registration cost',
      'es': '',
      'fr': '',
    },
    'vi9rbhbg': {
      'en': '\$',
      'es': '',
      'fr': '',
    },
    'uiu492u7': {
      'en': '99.9',
      'es': '',
      'fr': '',
    },
    'mjeoh5vi': {
      'en': 'Total',
      'es': '',
      'fr': '',
    },
    'fdl4oa1f': {
      'en': '\$',
      'es': '',
      'fr': '',
    },
    'guxxiufp': {
      'en': ' 119.8',
      'es': '',
      'fr': '',
    },
    'n2lnoqx9': {
      'en': 'Total',
      'es': '',
      'fr': '',
    },
    '57ic42v4': {
      'en': '\$',
      'es': '',
      'fr': '',
    },
    'x54k6pk4': {
      'en': '99.9',
      'es': '',
      'fr': '',
    },
    'whke5ts1': {
      'en': 'Submit For Review',
      'es': '',
      'fr': '',
    },
    '8jladhbp': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // registerSuccess_modal
  {
    'vkxriblo': {
      'en': 'Register Success',
      'es': 'Registro exitoso',
      'fr': 'Inscription réussie',
    },
    'h2xdozlk': {
      'en':
          'Congratulation! your account already created.\nPlease check your inbox and follow the instructions to confirm your account.',
      'es':
          '¡Felicitaciones! su cuenta ya creada.\nInicie sesión para obtener una experiencia increíble.',
      'fr':
          'Félicitation ! votre compte déjà créé.\nVeuillez vous connecter pour vivre une expérience incroyable.',
    },
    't4tt10im': {
      'en': 'Login',
      'es': 'Ir a casa',
      'fr': 'Aller à la maison',
    },
  },
  // ForgotPasswordPopup
  {
    '68da8o48': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
    },
    't0wp5kyz': {
      'en': 'Enter youe mail or phone number',
      'es': 'Ingrese su correo o número de teléfono',
      'fr': 'Entrez votre mail ou votre numéro de téléphone',
    },
    'laq1e1na': {
      'en': 'Email or Phone Number',
      'es': 'Correo electrónico o número de teléfono',
      'fr': 'E-mail ou numéro de téléphone',
    },
    '4wi8kjyp': {
      'en': 'Enter your email or phone number',
      'es': 'Introduce tu correo electrónico o número de teléfono',
      'fr': 'Entrez votre email ou votre numéro de téléphone',
    },
    '4ligppz0': {
      'en': 'Send Code',
      'es': 'Enviar código',
      'fr': 'Envoyer le code',
    },
  },
  // newPassword_modal
  {
    'rkilnmjw': {
      'en': 'Update Password',
      'es': 'Crear nueva contraseña',
      'fr': 'Créer un nouveau mot de passe',
    },
    '96yt5u83': {
      'en': 'Current Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    '6xsz8kht': {
      'en': 'enter  your Current password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    'w8i0tlah': {
      'en': 'New Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    '667e4ujp': {
      'en': 'Create your password',
      'es': 'Crea tu contraseña',
      'fr': 'Créez votre mot de passe',
    },
    'ucakz1il': {
      'en': 'Change Password',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
  },
  // HotDealsCardItem
  {
    '5fyms2xp': {
      'en': '4.5',
      'es': '4.5',
      'fr': '4.5',
    },
    'dxto6avb': {
      'en': 'Roast beef with black pepper',
      'es': 'Carne asada con pimienta negra',
      'fr': 'Rôti de boeuf au poivre noir',
    },
    '0i4n5ela': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'wsxtfrt1': {
      'en': '9.67',
      'es': '9.67',
      'fr': '9.67',
    },
  },
  // FilterPopup
  {
    '8jo71kve': {
      'en': 'area',
      'es': 'San Diego, California, EE.UU.',
      'fr': 'San Diego, Californie',
    },
    'sbjs4wii': {
      'en': 'Option 1',
      'es': '',
      'fr': '',
    },
    'nw1ilqi7': {
      'en': 'Please select...',
      'es': '',
      'fr': '',
    },
    'vfl3q1vq': {
      'en': 'Search for an item...',
      'es': '',
      'fr': '',
    },
    'sa3k8ysn': {
      'en': 'Option 1',
      'es': '',
      'fr': '',
    },
    'w7xh88d7': {
      'en': 'Please select...',
      'es': '',
      'fr': '',
    },
    'rjnu2hx6': {
      'en': 'Search for an item...',
      'es': '',
      'fr': '',
    },
    'hnv04kes': {
      'en': 'Apply Filter',
      'es': 'Aplicar filtro',
      'fr': 'Appliquer le filtre',
    },
  },
  // NearestLocationItem
  {
    'msl8hzk9': {
      'en': 'Delaska RIsaka',
      'es': 'Delaska RIsaka',
      'fr': 'Delaska RIsaka',
    },
    '5kn33zd0': {
      'en': '4.8',
      'es': '4.8',
      'fr': '4.8',
    },
    '0lvbcm6x': {
      'en': 'Close 10.45 PM',
      'es': 'Cierre 22:45',
      'fr': 'Fermeture à 22h45',
    },
  },
  // confirm_modal
  {
    'wss38bpn': {
      'en': 'Are you sure you want to activate your location?',
      'es': '¿Estás seguro de que quieres activar tu ubicación?',
      'fr': 'Etes-vous sûr de vouloir activer votre localisation ?',
    },
    '29xlhpns': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'zuga39cj': {
      'en': 'Yes, Enable',
      'es': 'Sí, habilitar',
      'fr': 'Oui, activer',
    },
  },
  // addToCard_modal
  {
    'lqsllr27': {
      'en': 'Noodles',
      'es': 'Fideos',
      'fr': 'Nouilles',
    },
    'a2p37cxh': {
      'en': 'Fried grill noodles with egg special',
      'es': 'Fideos fritos a la parrilla con huevo especial',
      'fr': 'Nouilles grillées frites avec œuf spécial',
    },
    'fa7ttb41': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    '2h9d34og': {
      'en': '6,17',
      'es': '6,17',
      'fr': '6,17',
    },
    '4qzgey7i': {
      'en': 'Add Extra Ingredients',
      'es': 'Agregue ingredientes adicionales',
      'fr': 'Ajouter des ingrédients supplémentaires',
    },
    'akeff4oi': {
      'en': 'Mustard',
      'es': 'Mostaza',
      'fr': 'Moutarde',
    },
    '03fv0zz3': {
      'en': '1 Grm',
      'es': '1 gr',
      'fr': '1 gramme',
    },
    'k9ldv5en': {
      'en': 'Onion',
      'es': 'Cebolla',
      'fr': 'Oignon',
    },
    'jv08oelk': {
      'en': '1 Clove',
      'es': '1 diente',
      'fr': '1 clou de girofle',
    },
    'fas1uqhn': {
      'en': 'Note',
      'es': 'Nota',
      'fr': 'Note',
    },
    'cchz1fp1': {
      'en': 'Write your note here',
      'es': 'Escribe tu nota aquí',
      'fr': 'Écrivez votre note ici',
    },
    '2afi00zd': {
      'en': 'Add to cart',
      'es': 'Añadir a la cesta',
      'fr': 'Ajouter au panier',
    },
  },
  // AddToCartItem
  {
    'u3pgx5vv': {
      'en': 'Noodles',
      'es': 'Fideos',
      'fr': 'Nouilles',
    },
    'uxac6ovs': {
      'en': 'Fried grill noodles with egg special',
      'es': 'Fideos fritos a la parrilla con huevo especial',
      'fr': 'Nouilles grillées frites avec œuf spécial',
    },
    '6ov4bl4b': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'bw669zmp': {
      'en': '6,17',
      'es': '6,17',
      'fr': '6,17',
    },
  },
  // AddExtraItem
  {
    '4wms16ni': {
      'en': 'Beef',
      'es': 'Carne de res',
      'fr': 'Bœuf',
    },
    'ejo6z1g1': {
      'en': '1 Slice',
      'es': '1 rebanada',
      'fr': '1 tranche',
    },
  },
  // MyCartItem
  {
    'acxq8c0g': {
      'en': 'Fresh prawns fried with extra onions',
      'es': 'Gambas frescas fritas con extra de cebolla',
      'fr': 'Crevettes fraîches frites avec des oignons supplémentaires',
    },
    'z0atyn19': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'bkk2t9yp': {
      'en': '6.17',
      'es': '6.17',
      'fr': '6.17',
    },
  },
  // SelectLocationItem
  {
    '3u9ubti5': {
      'en': 'Los Angeles',
      'es': 'los Angeles',
      'fr': 'Los Angeles',
    },
    'wu7s1swt': {
      'en': 'Los Angeles, United States',
      'es': 'Los Ángeles, Estados Unidos',
      'fr': 'Los Angeles, États-Unis',
    },
  },
  // SelectLocationItemCopy
  {
    'dcr5y2g6': {
      'en': 'Los Angeles',
      'es': 'los Angeles',
      'fr': 'Los Angeles',
    },
    'd3k2dpgt': {
      'en': 'Los Angeles, United States',
      'es': 'Los Ángeles, Estados Unidos',
      'fr': 'Los Angeles, États-Unis',
    },
  },
  // changePaymentMethod_modal
  {
    'vdt5chjy': {
      'en': 'Payment Method',
      'es': 'Método de pago',
      'fr': 'Mode de paiement',
    },
    'zt4sy9vi': {
      'en': 'Paypall',
      'es': 'pago',
      'fr': 'Paypal',
    },
    'omu8rwmb': {
      'en': 'sask****@mail.com',
      'es': 'sask****@mail.com',
      'fr': 'sask****@mail.com',
    },
    '4ujur370': {
      'en': 'Add Payment Method',
      'es': 'Añadir método de pago',
      'fr': 'Ajouter un mode de paiement',
    },
    'yx6c24gu': {
      'en': 'Upply the payment method',
      'es': 'Subir el método de pago',
      'fr': 'Ajouter le mode de paiement',
    },
  },
  // PaymentMethodItem
  {
    'clpxilmk': {
      'en': 'Mastercard',
      'es': 'Tarjeta MasterCard',
      'fr': 'MasterCard',
    },
    '7547er0v': {
      'en': '4827 8472 7424 ****',
      'es': '4827 8472 7424 ****',
      'fr': '4827 8472 7424 ****',
    },
  },
  // VerificationSuccess_modal
  {
    'ai8qoftl': {
      'en': 'Verified Successfully',
      'es': 'Ordene con éxito',
      'fr': 'Commandez avec succès',
    },
    '8w3ex41n': {
      'en':
          'Thank you for the review! The assigned project has been verified successfully!. Now you can aappend new ACU crediting periods',
      'es':
          '¡Feliz! Su comida se preparará inmediatamente y la enviaremos una vez que el mensajero la haya terminado, espere un momento.',
      'fr':
          'Heureux! Votre nourriture sera préparée immédiatement et nous l\'enverrons une fois terminée par le coursier, veuillez patienter un instant.',
    },
    'znwujg1g': {
      'en': 'Done',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
  },
  // MyOrderItem
  {
    '0kkxg04l': {
      'en': 'Delinas Resto',
      'es': 'Delinas Resto',
      'fr': 'Délinas Resto',
    },
    'ul6qwuuh': {
      'en': 'Date',
      'es': 'Fecha',
      'fr': 'Date',
    },
    '7sa1sgoe': {
      'en': '29 Desc 2022',
      'es': '29 dic 2022',
      'fr': '29 décembre 2022',
    },
    'v2q7ytxk': {
      'en': 'Price',
      'es': 'Precio',
      'fr': 'Prix',
    },
    '7ps520k7': {
      'en': '\$35.05',
      'es': '\$35.05',
      'fr': '35,05 \$',
    },
    'p1ci0hje': {
      'en': 'Detail',
      'es': 'Reclame el descuento',
      'fr': 'Réclamez la réduction',
    },
    'qj8muj7x': {
      'en': 'Tracking',
      'es': 'Seguimiento',
      'fr': 'Suivi',
    },
  },
  // ButtonOrderStatus
  {
    'eh2zj9q4': {
      'en': 'On Progress',
      'es': 'En progreso',
      'fr': 'En progrès',
    },
  },
  // FavoriteItem
  {
    '10hcqqzp': {
      'en': 'Premium vegetable salad',
      'es': 'Ensalada de verduras premium',
      'fr': 'Salade de légumes haut de gamme',
    },
    '3ipz56iu': {
      'en': '4.4',
      'es': '4.4',
      'fr': '4.4',
    },
    'h937j6qa': {
      'en': '12 Minute',
      'es': '12 minutos',
      'fr': '12 minutes',
    },
    't8839z31': {
      'en': '\$ ',
      'es': 'ps',
      'fr': '\$',
    },
    'vr8mv808': {
      'en': '6.17',
      'es': '6.17',
      'fr': '6.17',
    },
  },
  // logOut_modal
  {
    '38q11wq9': {
      'en': 'Are you sure you want to logout?',
      'es': '¿Está seguro de que desea cerrar sesión?',
      'fr': 'Êtes-vous sûr de vouloir vous déconnecter?',
    },
    'mpj8eknt': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'p19zdwc8': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
  },
  // navigator
  {
    'w4ui9cw8': {
      'en': 'Pages',
      'es': 'paginas',
      'fr': 'Pages',
    },
    'r9x56x9c': {
      'en': 'Add New payment method',
      'es': 'Agregar nuevo método de pago',
      'fr': 'Ajouter un nouveau mode de paiement',
    },
    '74gdmugu': {
      'en': 'Address',
      'es': 'DIRECCIÓN',
      'fr': 'Adresse',
    },
    '3kzxsnf1': {
      'en': 'Shopping Cart',
      'es': 'Carro de la compra',
      'fr': 'Panier',
    },
    'i3gyatzv': {
      'en': 'Change Password',
      'es': 'Cambiar la contraseña',
      'fr': 'Changer le mot de passe',
    },
    'sjrrg2g9': {
      'en': 'Checkout',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    'rtio6ax8': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    '1imgxewf': {
      'en': 'Details',
      'es': 'Detalles',
      'fr': 'Détails',
    },
    's2m6hsyu': {
      'en': 'Detail Two',
      'es': 'Detalle dos',
      'fr': 'Détail deux',
    },
    '5df5wb6d': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'sfo0wzam': {
      'en': 'Favorite',
      'es': 'Favorito',
      'fr': 'Préféré',
    },
    'cau894re': {
      'en': 'Help and Support',
      'es': 'Ayuda y apoyo',
      'fr': 'Aide et soutien',
    },
    'hu2inqjs': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
    'z0q5il1b': {
      'en': 'Home Two',
      'es': 'Hogar dos',
      'fr': 'Maison Deux',
    },
    'cryv162n': {
      'en': 'Change Language',
      'es': 'Cambiar idioma',
      'fr': 'Changer de langue',
    },
    'ubk0apu5': {
      'en': 'Policies',
      'es': 'Políticas',
      'fr': 'Stratégies',
    },
    'we3ke45m': {
      'en': 'Location',
      'es': 'Ubicación',
      'fr': 'Emplacement',
    },
    'hhdryzkt': {
      'en': 'Login',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    'm70he3lc': {
      'en': 'My Order',
      'es': 'Mi pedido',
      'fr': 'Ma commande',
    },
    '2lq6kli6': {
      'en': 'Notifications',
      'es': 'Notificaciones',
      'fr': 'Notifications',
    },
    'gnn9z841': {
      'en': 'Notification Setting',
      'es': 'Notificación de configuración',
      'fr': 'Paramètre de notification',
    },
    'tl1qab9r': {
      'en': 'Onboarding',
      'es': 'Inducción',
      'fr': 'Intégration',
    },
    'w4d6l0xg': {
      'en': 'Security',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    '6vbi0byh': {
      'en': 'Setting',
      'es': 'Configuración',
      'fr': 'Paramètre',
    },
    '3wz6lqp1': {
      'en': 'Verification',
      'es': 'Verificación',
      'fr': 'Vérification',
    },
    'cu78oruw': {
      'en': 'Voucher',
      'es': 'Vale',
      'fr': 'Bon',
    },
    'oj3cf9cd': {
      'en': 'Modals',
      'es': 'modales',
      'fr': 'Modaux',
    },
    'uv5rjs14': {
      'en': 'Add to cart',
      'es': 'Añadir a la cesta',
      'fr': 'Ajouter au panier',
    },
    '6vf2cznr': {
      'en': 'Change payment method',
      'es': 'Cambiar método de pago',
      'fr': 'Changer la méthode de paiement',
    },
    '5o9cd5e2': {
      'en': 'Confirm',
      'es': 'Confirmar',
      'fr': 'Confirmer',
    },
    'c2evnsw5': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    '8l5zbjdz': {
      'en': 'New Password',
      'es': 'Nueva contraseña',
      'fr': 'nouveau mot de passe',
    },
    'askd0uki': {
      'en': 'Order Success',
      'es': 'Orden exitosa',
      'fr': 'Succès de la commande',
    },
    'kwl7igml': {
      'en': 'Register Success',
      'es': 'Registro exitoso',
      'fr': 'Inscription réussie',
    },
    '1z4hfai6': {
      'en': 'About Template',
      'es': 'Acerca de la plantilla',
      'fr': 'À propos du modèle',
    },
    '86o94vt0': {
      'en': 'Builderking',
      'es': 'constructor',
      'fr': 'Construction',
    },
  },
  // comfirm_account_alert
  {
    'gxt2olgu': {
      'en': 'your account is not verified !',
      'es': '',
      'fr': '',
    },
    'cewuwz3s': {
      'en': 'Verified Now',
      'es': '',
      'fr': '',
    },
    'isg03xz5': {
      'en': 'cancel',
      'es': '',
      'fr': '',
    },
  },
  // update_profile_image_bottom_sheet
  {
    'pn9mh8t9': {
      'en': 'Update profile picture',
      'es': '',
      'fr': '',
    },
    'r81jwc0s': {
      'en': 'Cancel',
      'es': '',
      'fr': '',
    },
  },
  // send_comfirm_mail
  {
    '5mxyrmpn': {
      'en': 'Email Sent Successfully.',
      'es': '',
      'fr': '',
    },
    '74uv9ca5': {
      'en':
          'An email has been sent to your email address. Please check your inbox and follow the instructions.',
      'es': '',
      'fr': '',
    },
    'cmsp7qdm': {
      'en': 'OK',
      'es': '',
      'fr': '',
    },
  },
  // AddProjectSuccess_modal
  {
    '2tzc6oyn': {
      'en': 'Added Successfully',
      'es': '',
      'fr': '',
    },
    '1e5ofouh': {
      'en':
          'Thank you for your contribution within our app! Your project is now under review and we will keep you in touch for the result.',
      'es': '',
      'fr': '',
    },
    'gzrh2mxn': {
      'en': 'Done',
      'es': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'b3u7as3r': {
      'en': 'Create Account',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    'ctqamqlc': {
      'en': 'Create your username',
      'es': 'Crea tu nombre de usuario',
      'fr': 'Créez votre nom d\'utilisateur',
    },
    'umpm3yh5': {
      'en': 'Sign Up with Google',
      'es': 'Verificar',
      'fr': 'Vérifier',
    },
    'u17s3o3i': {
      'en': 'Let\'s find the food you like',
      'es': 'Busquemos la comida que te gusta.',
      'fr': 'Trouvons la nourriture que vous aimez',
    },
    'm470nw6c': {
      'en': 'San Diego, CA',
      'es': 'San Diego, California, EE.UU.',
      'fr': 'San Diego, Californie',
    },
    'tkq1nhez': {
      'en': 'Recommended',
      'es': 'Recomendado',
      'fr': 'Recommandé',
    },
    'amak33fx': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
    '5hctr45y': {
      'en': 'Add to Cart',
      'es': 'añadir a la cesta',
      'fr': 'Ajouter au panier',
    },
    'fazi37bo': {
      'en': 'Get Discount',
      'es': 'Reclame el descuento',
      'fr': 'Réclamez la réduction',
    },
    '6on3f8zv': {
      'en': 'Enter voucher code',
      'es': 'Ingrese código de descuento',
      'fr': 'Entrer le code du bon',
    },
    'vc3k7k6z': {
      'en': 'Hamburgers',
      'es': 'hamburguesas',
      'fr': 'Hamburgers',
    },
    'cvmlykt8': {
      'en': 'On Progress',
      'es': 'En progreso',
      'fr': 'En progrès',
    },
    'ogz0ss6o': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
    },
    'j42bxbzx': {
      'en': 'Create your username',
      'es': 'Crea tu nombre de usuario',
      'fr': 'Créez votre nom d\'utilisateur',
    },
    '2rn10vbf': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '02edt2xf': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'cpbcsw9m': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'zi2yt9e7': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'vnau18bv': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'lktg3dy4': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'fjabeg9r': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '7yw004o2': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'xsjq375t': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'xiyzhulx': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'm3u1mw7e': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '9zycfqbc': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'hr8de7xd': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'dvzeat75': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '4bdekwbm': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'rvm9rdle': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '3uxb43tw': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'g8ay9flm': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '0raeaqd3': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'j3d762mc': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'jzepjy1z': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'dlctomaa': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'fdy7k4vs': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'o37sr5xj': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'v8s1znh7': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'jg3a7edz': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'pcwstkno': {
      'en': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
