# MUST Smart Campus - Timetable Module

This module provides a comprehensive timetable viewing system for the MUST Smart Campus application.

## Features

- **Program Selection**: Choose from available academic programs
- **Search Functionality**: Search through programs to quickly find the desired one
- **Interactive Timetable**: Tap on classes to view detailed information
- **Responsive Design**: Works on different screen sizes
- **Fallback Data**: Includes fallback data in case the JSON file is not accessible

## Files Structure

```
student/
├── timetable_page.dart          # Main timetable page widget
├── timetable_example.dart       # Usage examples
services/
├── json_timetable_service.dart  # Service for loading and parsing JSON data
├── timetables.json             # Timetable data in JSON format
```

## Usage

### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'student/timetable_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimetablePage(),
    );
  }
}
```

### Integration with Navigation

```dart
// In your main navigation
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => TimetablePage(),
  ),
);
```

### Using the Service Directly

```dart
import 'services/json_timetable_service.dart';

// Get all programs
List<String> programs = await JsonTimetableService.getPrograms();

// Get timetable for a specific program
List<List<String>> timetable = await JsonTimetableService.getProgramTimetable('MBR I');

// Get course codes for a program
Set<String> courseCodes = await JsonTimetableService.getCourseCodes('MBR I');

// Parse a timetable cell
Map<String, String> parsed = JsonTimetableService.parseCell('MBR I ANA1122 Histology Nalugo Halima IMSG01');
```

## JSON Data Format

The timetable data should be in the following format:

```json
{
  "programs": [
    "MBR I",
    "PHA I",
    "BNS I"
  ],
  "timetables": {
    "MBR I": [
      ["08:00-9:00", "Class 1", "Class 2", "", "", "", "", ""],
      ["09:00-10:00", "", "", "Class 3", "", "", "", ""]
    ]
  }
}
```

### Timetable Array Structure

Each program's timetable is a 2D array where:
- First dimension: Time slots (rows)
- Second dimension: Days of the week (columns)
- Index 0: Time slot (e.g., "08:00-9:00")
- Index 1-7: Monday through Sunday

### Cell Content Format

Each cell can contain class information in the format:
`[Programs] [Course Code] [Course Name] [Lecturer] [Location]`

Example: `"MBR I ANA1122 Histology & Cytology I Nalugo Halima IMSG01"`

## Customization

### Colors

The timetable uses color coding for different courses. Colors are automatically assigned based on course codes. You can modify the color scheme in the `_getColorForCourse` method.

### Layout

The timetable layout can be customized by modifying the `_buildTimetableGrid` method. You can adjust:
- Cell sizes
- Spacing
- Border styles
- Typography

### Search Functionality

The search functionality can be extended by modifying the `_filterPrograms` method to include additional search criteria.

## Error Handling

The module includes comprehensive error handling:

1. **File Loading**: Multiple fallback methods for loading the JSON data
2. **Data Parsing**: Graceful handling of malformed data
3. **UI Feedback**: Clear error messages and loading states
4. **Fallback Data**: Built-in sample data when external data is unavailable

## Performance Considerations

- **Caching**: The JSON data is cached after first load
- **Lazy Loading**: Timetables are loaded only when selected
- **Efficient Rendering**: Uses efficient Flutter widgets for large datasets

## Dependencies

The module uses standard Flutter packages:
- `flutter/material.dart` - UI components
- `flutter/services.dart` - Asset loading
- `dart:convert` - JSON parsing
- `dart:io` - File operations

## Setup Instructions

1. **Add JSON File**: Place your `timetables.json` file in the `services/` directory

2. **Update pubspec.yaml** (if using assets):
```yaml
flutter:
  assets:
    - services/timetables.json
```

3. **Import and Use**:
```dart
import 'student/timetable_page.dart';

// Use in your app
TimetablePage()
```

## Troubleshooting

### Common Issues

1. **JSON File Not Found**
   - Ensure the file is in the correct location
   - Check file permissions
   - Verify the file is properly formatted JSON

2. **Empty Timetable**
   - Check if the program name exists in the JSON data
   - Verify the timetable data structure
   - Check for typos in program names

3. **Performance Issues**
   - Clear cache using `JsonTimetableService.clearCache()`
   - Reduce the number of programs or timetable entries
   - Optimize the JSON file size

### Debug Mode

Enable debug prints by adding this to your main function:
```dart
void main() {
  debugPrint('Timetable module loaded');
  runApp(MyApp());
}
```

## Future Enhancements

Potential improvements for the timetable module:

1. **Offline Support**: Cache data locally for offline viewing
2. **Push Notifications**: Notify users of upcoming classes
3. **Calendar Integration**: Export to device calendar
4. **Conflict Detection**: Highlight scheduling conflicts
5. **Lecturer View**: Show timetables from lecturer perspective
6. **Room Booking**: Integration with room booking system
7. **Real-time Updates**: Live updates from server
8. **Accessibility**: Enhanced accessibility features

## Contributing

When contributing to the timetable module:

1. Follow Flutter best practices
2. Add appropriate documentation
3. Include error handling
4. Test with different data sets
5. Ensure responsive design
6. Add unit tests for service methods

## License

This module is part of the MUST Smart Campus project and follows the same licensing terms.