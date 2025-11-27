@echo off
echo ========================================
echo MUST Smart Campus - Icon Setup
echo ========================================
echo.

echo Checking for icon file...
if exist "lib\assets\icons\app_icon.png" (
    echo [OK] Icon file found!
    echo.
) else (
    echo [ERROR] Icon file not found!
    echo.
    echo Please create an icon file:
    echo 1. Go to https://icon.kitchen/ or https://svgtopng.com/
    echo 2. Create/convert a 1024x1024 PNG image
    echo 3. Save it as: lib\assets\icons\app_icon.png
    echo.
    echo Then run this script again.
    echo.
    pause
    exit /b 1
)

echo [1/4] Getting dependencies...
cd ..
call flutter pub get
echo.

echo [2/4] Generating app icons...
call flutter pub run flutter_launcher_icons
echo.

echo [3/4] Cleaning previous builds...
call flutter clean
echo.

echo [4/4] Building APK with new icon...
call flutter build apk --release
echo.

echo ========================================
echo Icon Setup Complete!
echo ========================================
echo.
echo Your app now has a custom icon!
echo.
echo APK location:
echo build\app\outputs\flutter-apk\app-release.apk
echo.
echo IMPORTANT:
echo - Uninstall the old app from your device
echo - Install the new APK
echo - The new icon will appear on your home screen
echo.
pause
