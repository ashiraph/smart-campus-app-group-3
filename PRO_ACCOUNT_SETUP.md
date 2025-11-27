# Public Relations Officer (PRO) Account Setup Guide

## Overview
This guide explains how to create and manage PRO accounts for the MUST Smart Campus app.

## PRO Account Email Format
All PRO accounts must use the email format: `username@pro.must.ac.ug`

Example: `john.doe@pro.must.ac.ug`

---

## Method 1: Using Firebase Console (Recommended)

### Step 1: Access Firebase Console
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your MUST Smart Campus project
3. Click on "Authentication" in the left sidebar
4. Click on the "Users" tab

### Step 2: Create PRO User
1. Click the "Add User" button
2. Enter the PRO email address (e.g., `pro@pro.must.ac.ug`)
3. Enter a secure password (minimum 6 characters)
4. Click "Add User"

### Step 3: Verify User Creation
1. The new user should appear in the users list
2. Note the User UID (you'll need this for the next step)

### Step 4: Create User Document in Firestore
1. Click on "Firestore Database" in the left sidebar
2. Navigate to the `users` collection
3. Click "Add Document"
4. Set Document ID to the User UID from Step 3
5. Add the following fields:
   ```
   uid: [User UID]
   email: pro@pro.must.ac.ug
   role: pro
   name: Public Relations Officer
   createdAt: [Current timestamp]
   lastLogin: [Current timestamp]
   ```
6. Click "Save"

### Step 5: Test Login
1. Open the MUST Smart Campus app
2. Click "Login"
3. Enter the PRO email and password
4. You should be redirected to the PRO dashboard

---

## Method 2: Using the Script

### Prerequisites
- Flutter SDK installed
- Firebase project configured
- Terminal/Command Prompt access

### Step 1: Update Script
1. Open `lib/scripts/create_pro_account.dart`
2. Update these variables:
   ```dart
   const String email = 'your.name@pro.must.ac.ug';
   const String password = 'YourSecurePassword123!';
   const String name = 'Your Full Name';
   ```

### Step 2: Run Script
```bash
cd lib
dart run scripts/create_pro_account.dart
```

### Step 3: Verify Creation
The script will output:
- ✓ User created in Authentication
- ✓ User document created in Firestore
- ✓ PRO profile created
- ✅ PRO account created successfully!

---

## Method 3: Manual Registration (Future Enhancement)

A PRO registration page can be created for self-service account creation with admin approval.

---

## Default PRO Account

For testing purposes, you can create a default PRO account:

**Email:** `pro@pro.must.ac.ug`  
**Password:** `ProPassword123!`

⚠️ **Important:** Change this password immediately after first login!

---

## PRO Account Permissions

PRO accounts have access to:

### ✅ Allowed Actions
- Create, edit, and delete announcements
- Create, edit, and delete events
- Target announcements to specific audiences (Students, Lecturers, All)
- View all posted announcements and events
- Access PRO dashboard and statistics

### ❌ Restricted Actions
- Cannot access student records
- Cannot modify timetables
- Cannot access lecturer information
- Cannot perform system administration tasks

---

## Troubleshooting

### Issue: "Invalid email address"
**Solution:** Ensure the email ends with `@pro.must.ac.ug`

### Issue: "Email already in use"
**Solution:** This email is already registered. Use a different email or reset the password.

### Issue: "User not found" after login
**Solution:** Ensure the user document was created in Firestore with the correct role field set to 'pro'.

### Issue: Redirected to visitor page after login
**Solution:** Check that:
1. The email ends with `@pro.must.ac.ug`
2. The user document in Firestore has `role: 'pro'`
3. The app has been restarted after code changes

### Issue: Cannot see announcements/events
**Solution:** 
1. Check Firestore rules allow PRO to read/write
2. Verify the PRO is logged in (check Authentication tab)
3. Check browser console for errors

---

## Security Best Practices

1. **Strong Passwords:** Use passwords with at least 12 characters, including uppercase, lowercase, numbers, and symbols
2. **Unique Emails:** Each PRO should have their own unique email address
3. **Regular Updates:** Change passwords regularly (every 90 days recommended)
4. **Secure Storage:** Never share passwords via email or unsecured channels
5. **Account Monitoring:** Regularly review PRO account activity in Firebase Console

---

## Firestore Security Rules

Ensure your Firestore rules allow PRO accounts to manage announcements and events:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Announcements - PRO can create, read, update, delete
    match /announcements/{announcementId} {
      allow read: if true; // Everyone can read
      allow create, update, delete: if request.auth != null && 
        (get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'pro' ||
         get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'admin');
    }
    
    // Events - PRO can create, read, update, delete
    match /events/{eventId} {
      allow read: if true; // Everyone can read
      allow create, update, delete: if request.auth != null && 
        (get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'pro' ||
         get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'admin');
    }
    
    // Users collection
    match /users/{userId} {
      allow read: if request.auth != null;
      allow write: if request.auth.uid == userId;
    }
  }
}
```

---

## Multiple PRO Accounts

You can create multiple PRO accounts for different staff members:

- `john.doe@pro.must.ac.ug` - John Doe
- `jane.smith@pro.must.ac.ug` - Jane Smith
- `communications@pro.must.ac.ug` - Communications Team

Each account will have full access to the PRO dashboard and can manage all announcements and events.

---

## Support

For technical assistance:
- Contact System Administrator
- Email: admin@must.ac.ug
- Check Firebase Console logs for errors

---

## Quick Reference

| Action | Email Format | Role |
|--------|-------------|------|
| PRO Login | username@pro.must.ac.ug | pro |
| Student Login | username@std.must.ac.ug | student |
| Lecturer Login | username@must.ac.ug | lecturer |
| Academic Registrar | username@ar.must.ac.ug | academic_registrar |
| System Admin | username@admin.must.ac.ug | system_admin |

---

## Next Steps

After creating a PRO account:

1. ✅ Test login with the new credentials
2. ✅ Create a test announcement
3. ✅ Create a test event
4. ✅ Verify announcements appear in student/lecturer feeds
5. ✅ Change the default password
6. ✅ Document the credentials securely

---

**Last Updated:** November 2025  
**Version:** 1.0
