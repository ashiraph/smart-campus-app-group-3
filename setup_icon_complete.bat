@echo off
echo ========================================
echo MUST Smart Campus - Complete Icon Setup
echo ========================================
echo.

echo Step 1: Checking for icon file...
if exist "lib\assets\icons\app_icon.png" (
    echo [OK] Icon file found: lib\assets\icons\app_icon.png
    echo.
) else (
    echo [ERROR] Icon file NOT found!
    echo.
    echo PLEASE DO THIS FIRST:
    echo ================================
    echo 1. Open: create_app_icon.html in your browser
    echo 2. Click: "Download Icon (1024x1024)" button
    echo 3. Save as: app_icon.png
    echo 4. Move to: lib\assets\icons\app_icon.png
    echo.
    echo Then run this script again.
    echo.
    pause
    exit /b 1
)

cd ..

echo Step 2: Installing icon generator package...
call flutter pub get
echo.

echo Step 3: Generating app icons for Android and iOS...
call flutter pub run flutter_launcher_icons
echo.

echo Step 4: Cleaning previous builds...
call flutter clean
echo.

echo Step 5: Building APK with new icon...
call flutter build apk --release
echo.

echo ========================================
echo ICON SETUP COMPLETE!
echo ========================================
echo.
echo Your app now has a custom campus navigation icon!
echo.
echo Icon Features:
echo [+] Campus building
echo [+] Location pin
echo [+] Navigation compass
echo [+] Blue professional colors
echo.
echo APK Location:
echo build\app\outputs\flutter-apk\app-release.apk
echo.
echo IMPORTANT - TO SEE THE NEW ICON:
echo ================================
echo 1. COMPLETELY UNINSTALL the old app
echo 2. RESTART your device
echo 3. Install the new APK
echo 4. The new icon will appear on your home screen!
echo.
echo Note: The icon won't change if you just update the app.
echo You MUST uninstall the old app first!
echo.
pause
