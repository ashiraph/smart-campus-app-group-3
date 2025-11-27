@echo off
echo ========================================
echo MUST Smart Campus - Create PRO Account
echo ========================================
echo.
echo This script will help you create a Public Relations Officer account.
echo.
echo PRO Email Format: username@pro.must.ac.ug
echo.
echo ========================================
echo INSTRUCTIONS:
echo ========================================
echo.
echo 1. Go to Firebase Console: https://console.firebase.google.com/
echo 2. Select your MUST Smart Campus project
echo 3. Click "Authentication" in the left sidebar
echo 4. Click "Add User" button
echo 5. Enter email: pro@pro.must.ac.ug (or your custom email)
echo 6. Enter password: ProPassword123! (or your custom password)
echo 7. Click "Add User"
echo.
echo 8. Go to "Firestore Database"
echo 9. Navigate to "users" collection
echo 10. Click "Add Document"
echo 11. Set Document ID to the User UID from Authentication
echo 12. Add these fields:
echo     - uid: [User UID]
echo     - email: pro@pro.must.ac.ug
echo     - role: pro
echo     - name: Public Relations Officer
echo     - createdAt: [Current timestamp]
echo     - lastLogin: [Current timestamp]
echo 13. Click "Save"
echo.
echo ========================================
echo TEST LOGIN:
echo ========================================
echo.
echo 1. Open MUST Smart Campus app
echo 2. Click "Login"
echo 3. Enter PRO email and password
echo 4. You should see the PRO Dashboard
echo.
echo ========================================
echo.
pause
