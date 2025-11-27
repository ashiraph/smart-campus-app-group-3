# Announcement System Documentation

## Overview
The announcement system allows different user roles to create and view announcements with proper targeting and categorization.

## Features

### For Lecturers
Lecturers can now:
1. **Post announcements to students** - Share course updates, assignments, and academic information
2. **Post announcements to fellow lecturers** - Communicate with other faculty members
3. **Post announcements to everyone** - Share general information with all users
4. **View university announcements** - See official announcements from the academic registrar
5. **Manage their posts** - View and delete their own announcements

### For Students
Students can:
1. View all announcements targeted to them (from lecturers and university)
2. Filter announcements by category (Academic, Events, Important, General)
3. Search announcements by title or content
4. View detailed announcement information

### For Academic Registrar
The registrar can:
1. Post university-wide announcements
2. Set priority levels (Low, Normal, High, Urgent)
3. Mark announcements as important
4. Manage all university announcements

## Data Structure

### Announcement Document
```dart
{
  'id': String,
  'title': String,
  'content': String,
  'author': String,
  'authorId': String,
  'authorRole': String, // 'lecturer', 'admin', etc.
  'targetAudience': List<String>, // ['students', 'lecturers', 'all']
  'category': String, // 'Academic', 'Events', 'Important', 'General'
  'course': String?, // Optional course code
  'isActive': bool,
  'createdAt': Timestamp,
}
```

## Target Audience Options
- **students**: Only visible to students
- **lecturers**: Only visible to lecturers
- **all**: Visible to everyone (university-wide)

## Categories
- **Academic**: Course-related, academic matters
- **Events**: Campus events, activities
- **Important**: Urgent or critical information
- **General**: General information and updates

## Usage

### Creating an Announcement (Lecturer)
1. Navigate to the Announcements section
2. Click on the "Create" tab
3. Fill in the title and message
4. Select target audience (can select multiple)
5. Choose a category
6. Optionally add a course code
7. Click "POST ANNOUNCEMENT"

### Viewing Announcements
- **My Posts**: View all announcements you've created
- **University**: View official university announcements
- Students see all announcements targeted to them in their announcements page

### Managing Announcements
- Lecturers can delete their own announcements
- Academic registrar can delete university announcements
- Announcements are ordered by creation date (newest first)
