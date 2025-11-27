import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'auth/login_page.dart';
import 'auth/student_registration_page.dart';
import 'auth/lecturer_registration_page.dart';
import 'auth/registration_selection_page.dart';
import 'auth/student_login_page.dart';
import 'student/home_page.dart';
import 'student/profile_page.dart';
import 'student/timetable_page.dart';
import 'student/myCourse_page.dart';
import 'student/announcements_page.dart';
import 'student/assignments_page.dart';
import 'student/lecturers_page.dart';
import 'student/events_page.dart';
import 'student/navigation_page.dart';
import 'academic_registrar/academic_registrar_home.dart';
import 'academic_registrar/student_management.dart';
import 'academic_registrar/lecturer_management.dart';
import 'lecturers/lecturer_home.dart';
import 'system_admin/system_admin_home.dart';
import 'visitors/VisitorHomePage.dart';
import 'visitors/campus_map_page.dart';
import 'visitors/welcome_page.dart';
import 'public_relations/pro_home.dart';
import 'services/global_settings_provider.dart';
import 'services/push_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _getThemeData(String themePreference) {
    switch (themePreference) {
      case 'Dark':
        return ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        );
      case 'Auto':
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        );
      case 'Light':
      default:
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalSettingsProvider()),
        ChangeNotifierProvider(create: (_) => PushNotificationService()),
      ],
      child: MaterialApp(
        title: 'MUST Smart Campus',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const MainHomePage(),
        routes: {
          '/login': (context) => const LoginPage(),
          '/student-login': (context) => const StudentLoginPage(),
          '/student-register': (context) => const StudentRegistrationPage(),
          '/lecturer-register': (context) => const LecturerRegistrationPage(),
          '/register': (context) => const RegistrationSelectionPage(),
          '/visitor': (context) => const WelcomePage(),
          '/visitor-map': (context) => const VisitorHomePage(),
          '/campus-map': (context) =>
              const VisitorHomePage(), // Point to the real map
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/timetable': (context) => const TimetablePage(),
          '/courses': (context) => const MyCoursesPage(),
          '/announcements': (context) => const AnnouncementsPage(),
          '/assignments': (context) => const AssignmentsPage(),
          '/lecturers': (context) => const LecturersPage(),
          '/events': (context) => const EventsPage(),
          '/navigation': (context) => const NavigationPage(),
          '/academic-registrar': (context) => const AcademicRegistrarHome(),
          '/students-list': (context) => const StudentManagement(),
          '/lecturers-list': (context) => const LecturerManagement(),
          '/pro': (context) => const PublicRelationsHome(),
          '/lecturer': (context) => const LecturerHome(),
          '/system-admin': (context) => const SystemAdminHome(),
        },
      ),
    );
  }
}

class MaintenanceModeScreen extends StatelessWidget {
  const MaintenanceModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.build_circle, size: 80, color: Colors.orange),
              const SizedBox(height: 24),
              const Text(
                'System Maintenance',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Consumer<GlobalSettingsProvider>(
                builder: (context, settingsProvider, child) {
                  return Text(
                    settingsProvider.getMaintenanceMessage(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  );
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Refresh settings to check if maintenance is over
                  context.read<GlobalSettingsProvider>().refreshSettings();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                child: const Text('Check Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text("Something went wrong. Please restart the app."),
            ),
          );
        }

        if (snapshot.hasData) {
          return const RoleBasedHomePage();
        }
        return const LoginPage();
      },
    );
  }
}

class RoleBasedHomePage extends StatefulWidget {
  const RoleBasedHomePage({super.key});

  @override
  State<RoleBasedHomePage> createState() => _RoleBasedHomePageState();
}

class _RoleBasedHomePageState extends State<RoleBasedHomePage> {
  late Future<String> _userRoleFuture;
  static String? _cachedUserRole;
  static String? _cachedUserId;

  @override
  void initState() {
    super.initState();
    _userRoleFuture = _getUserRole();
  }

  Future<String> _getUserRole() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return 'visitor';

      debugPrint('Getting role for user: ${user.email}');

      // Always fetch from Firestore to ensure correct role
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      String role;
      if (userDoc.exists) {
        role = userDoc.data()?['role'] ?? 'student';
        debugPrint('Role from Firestore: $role');
      } else {
        // If user document doesn't exist, determine role from email
        role = _determineRoleFromEmail(user.email);
        debugPrint('Role from email fallback: $role');
      }

      // Update cache
      _cachedUserId = user.uid;
      _cachedUserRole = role;

      return role;
    } catch (e) {
      debugPrint('Error getting user role: $e');
      return 'student';
    }
  }

  String _determineRoleFromEmail(String? email) {
    if (email == null) return 'student';

    debugPrint('Determining role from email: $email');

    if (email.endsWith('@std.must.ac.ug')) {
      debugPrint('Email ends with @std.must.ac.ug -> student');
      return 'student';
    } else if (email.endsWith('@ar.must.ac.ug')) {
      debugPrint('Email ends with @ar.must.ac.ug -> academic_registrar');
      return 'academic_registrar';
    } else if (email.endsWith('@pro.must.ac.ug')) {
      debugPrint('Email ends with @pro.must.ac.ug -> pro');
      return 'pro';
    } else if (email.endsWith('@admin.must.ac.ug')) {
      debugPrint('Email ends with @admin.must.ac.ug -> system_admin');
      return 'system_admin';
    } else if (email.endsWith('@must.ac.ug')) {
      debugPrint('Email ends with @must.ac.ug -> lecturer');
      return 'lecturer';
    } else {
      debugPrint('Email does not match any domain -> student');
      return 'student';
    }
  }

  Widget _buildHomePageForRole(String role) {
    switch (role) {
      case 'academic_registrar':
        return const AcademicRegistrarHome();
      case 'pro':
        return const PublicRelationsHome();
      case 'lecturer':
        return const LecturerHome();
      case 'system_admin':
        return const SystemAdminHome();
      case 'student':
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _userRoleFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text(
                    'Loading your dashboard...',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 20),
                  const Text(
                    'Error loading your account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    snapshot.error.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _userRoleFuture = _getUserRole();
                      });
                    },
                    child: const Text('Try Again'),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacementNamed(context, '/visitor');
                    },
                    child: const Text('Sign Out'),
                  ),
                ],
              ),
            ),
          );
        }

        final role = snapshot.data ?? 'student';
        return _buildHomePageForRole(role);
      },
    );
  }
}

void navigateToRoleHomePage(BuildContext context, String role) {
  switch (role) {
    case 'academic_registrar':
      Navigator.pushReplacementNamed(context, '/academic-registrar');
      break;
    case 'pro':
      Navigator.pushReplacementNamed(context, '/pro');
      break;
    case 'lecturer':
      Navigator.pushReplacementNamed(context, '/lecturer');
      break;
    case 'system_admin':
      Navigator.pushReplacementNamed(context, '/system-admin');
      break;
    case 'student':
    default:
      Navigator.pushReplacementNamed(context, '/home');
      break;
  }
}

Future<String> getUserRoleForNavigation() async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return 'visitor';

    // Always fetch from Firestore to ensure correct role
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    String role;
    if (userDoc.exists) {
      role = userDoc.data()?['role'] ?? 'student';
    } else {
      // Fallback to email-based role detection
      if (user.email?.endsWith('@ar.must.ac.ug') ?? false)
        return 'academic_registrar';
      if (user.email?.endsWith('@pro.must.ac.ug') ?? false) return 'pro';
      if (user.email?.endsWith('@admin.must.ac.ug') ?? false)
        return 'system_admin';
      if (user.email?.endsWith('@must.ac.ug') ?? false) return 'lecturer';
      role = 'student';
    }

    // Update cache
    _RoleBasedHomePageState._cachedUserId = user.uid;
    _RoleBasedHomePageState._cachedUserRole = role;

    return role;
  } catch (e) {
    debugPrint('Error in getUserRoleForNavigation: $e');
    return 'student';
  }
}
