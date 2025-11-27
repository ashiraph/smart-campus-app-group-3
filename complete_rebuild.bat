@echo off
echo ========================================
echo MUST Smart Campus - COMPLETE REBUILD
echo ========================================
echo.
echo This will do a COMPLETE clean rebuild to ensure
echo all changes are included in the APK.
echo.
pause

cd ..

echo [1/7] Stopping any running Flutter processes...
taskkill /F /IM dart.exe 2>nul
taskkill /F /IM flutter.exe 2>nul
echo.

echo [2/7] Deleting build folder...
if exist build rmdir /s /q build
echo Build folder deleted.
echo.

echo [3/7] Deleting .dart_tool folder...
if exist .dart_tool rmdir /s /q .dart_tool
echo .dart_tool folder deleted.
echo.

echo [4/7] Running flutter clean...
call flutter clean
echo.

echo [5/7] Getting dependencies...
call flutter pub get
echo.

echo [6/7] Building APK (this may take 3-5 minutes)...
call flutter build apk --release
echo.

echo [7/7] Checking build result...
if exist "build\app\outputs\flutter-apk\app-release.apk" (
    echo.
    echo ========================================
    echo BUILD SUCCESSFUL!
    echo ========================================
    echo.
    echo APK Location:
    echo build\app\outputs\flutter-apk\app-release.apk
    echo.
    echo File size:
    for %%A in ("build\app\outputs\flutter-apk\app-release.apk") do echo %%~zA bytes
    echo.
    echo IMPORTANT - INSTALLATION STEPS:
    echo ================================
    echo.
    echo 1. COMPLETELY UNINSTALL the old app from your device
    echo    - Go to Settings ^> Apps ^> MUST Smart Campus
    echo    - Click Uninstall
    echo    - Clear all data
    echo.
    echo 2. RESTART your device (important!)
    echo.
    echo 3. Install the new APK:
    echo    - Copy build\app\outputs\flutter-apk\app-release.apk to phone
    echo    - Open and install
    echo.
    echo OR use ADB:
    echo    adb uninstall com.example.must_smart_campus
    echo    adb install build\app\outputs\flutter-apk\app-release.apk
    echo.
    echo WHAT'S INCLUDED:
    echo ================
    echo [+] Registration link on login page
    echo [+] Student registration form
    echo [+] Email validation
    echo [+] Password requirements
    echo [+] All 106 timetables
    echo.
    echo WHERE TO FIND REGISTRATION:
    echo ===========================
    echo 1. Open the app
    echo 2. On login page, scroll down
    echo 3. Look for: "Don't have an account? Register as Student"
    echo 4. Click "Register as Student" (blue underlined text)
    echo.
) else (
    echo.
    echo ========================================
    echo BUILD FAILED!
    echo ========================================
    echo.
    echo Please check the error messages above.
    echo.
)

pause
