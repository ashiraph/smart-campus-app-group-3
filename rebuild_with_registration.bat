@echo off
echo ========================================
echo MUST Smart Campus - Rebuild with Registration Link
echo ========================================
echo.

echo What's included in this build:
echo [+] Student Registration Page
echo [+] Registration Link on Login Page
echo [+] Email Validation
echo [+] Password Requirements
echo [+] Firebase Integration
echo.

echo [1/4] Cleaning previous builds...
cd ..
call flutter clean
echo.

echo [2/4] Getting dependencies...
call flutter pub get
echo.

echo [3/4] Building APK...
call flutter build apk --release
echo.

echo [4/4] APK Ready!
echo.

echo ========================================
echo Build Complete!
echo ========================================
echo.
echo APK Location:
echo build\app\outputs\flutter-apk\app-release.apk
echo.
echo NEXT STEPS:
echo 1. Uninstall old app from your device
echo 2. Install the new APK
echo 3. On login page, look for "Don't have an account? Register as Student"
echo 4. Click "Register as Student" to open registration form
echo.
echo TEST REGISTRATION:
echo - Full Name: Test Student
echo - Student ID: 2024/TEST/001
echo - Email: test@must.ac.ug
echo - Program: BCS I
echo - Password: TestPass123
echo - Confirm: TestPass123
echo - Check terms box
echo - Click Register
echo.
pause
