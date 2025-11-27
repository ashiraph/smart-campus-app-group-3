import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

void main() async {
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firestore = FirebaseFirestore.instance;

  // Sample facilities data
  final facilities = [
    {
      'name': 'Main Library Computers',
      'type': 'equipment',
      'locationId': 'lib_main_001', // You'll need to match with actual location IDs
      'status': 'operational',
      'lastSeen': DateTime.now().toIso8601String(),
      'lastUpdated': DateTime.now().toIso8601String(),
      'trackerId': 'LIB_PC_001',
    },
    {
      'name': 'Science Lab Equipment',
      'type': 'equipment',
      'locationId': 'sci_lab_201',
      'status': 'maintenance',
      'lastSeen': DateTime.now().toIso8601String(),
      'lastUpdated': DateTime.now().toIso8601String(),
      'trackerId': 'SCI_EQ_001',
    },
    {
      'name': 'Campus Shuttle Bus',
      'type': 'vehicle',
      'locationId': '', // Mobile facility
      'status': 'operational',
      'latitude': -1.234567,
      'longitude': 36.789012,
      'level': 0,
      'lastSeen': DateTime.now().toIso8601String(),
      'lastUpdated': DateTime.now().toIso8601String(),
      'trackerId': 'BUS_001',
    },
    {
      'name': 'Auditorium Projector',
      'type': 'equipment',
      'locationId': 'auditorium_100',
      'status': 'operational',
      'lastSeen': DateTime.now().toIso8601String(),
      'lastUpdated': DateTime.now().toIso8601String(),
      'trackerId': 'AUD_PROJ_001',
    },
    {
      'name': 'Security Patrol Vehicle',
      'type': 'vehicle',
      'locationId': '',
      'status': 'operational',
      'latitude': -1.223456,
      'longitude': 36.778901,
      'level': 0,
      'lastSeen': DateTime.now().toIso8601String(),
      'lastUpdated': DateTime.now().toIso8601String(),
      'trackerId': 'SEC_VEH_001',
    },
    {
      'name': 'Cafeteria Kitchen Equipment',
      'type': 'equipment',
      'locationId': 'cafeteria_main',
      'status': 'out_of_service',
      'lastSeen': DateTime.now().toIso8601String(),
      'lastUpdated': DateTime.now().toIso8601String(),
      'trackerId': 'CAF_EQ_001',
    },
    {
      'name': 'Medical Center Ambulance',
      'type': 'vehicle',
      'locationId': 'medical_center',
      'status': 'operational',
      'latitude': -1.212345,
      'longitude': 36.767890,
      'level': 0,
      'lastSeen': DateTime.now().toIso8601String(),
      'lastUpdated': DateTime.now().toIso8601String(),
      'trackerId': 'AMB_001',
    },
    {
      'name': 'IT Support Personnel',
      'type': 'personnel',
      'locationId': 'it_office_101',
      'status': 'operational',
      'lastSeen': DateTime.now().toIso8601String(),
      'lastUpdated': DateTime.now().toIso8601String(),
      'trackerId': 'IT_SUP_001',
    },
  ];

  // Add facilities to Firestore
  for (final facility in facilities) {
    try {
      final docRef = await firestore.collection('facilities').add(facility);
      print('Added facility: ${facility['name']} with ID: ${docRef.id}');
    } catch (e) {
      print('Error adding facility ${facility['name']}: $e');
    }
  }

  print('Sample facilities added successfully!');
}