@echo off
echo ========================================
echo MUST Smart Campus - Rebuild Script
echo ========================================
echo.

echo [1/5] Cleaning previous builds...
call flutter clean
echo.

echo [2/5] Getting dependencies...
call flutter pub get
echo.

echo [3/5] Building APK (Release)...
call flutter build apk --release
echo.

echo [4/5] Checking if device is connected...
adb devices
echo.

echo [5/5] Installing APK...
echo Uninstalling old app...
adb uninstall com.example.must_smart_campus
echo.
echo Installing new app...
adb install build\app\outputs\flutter-apk\app-release.apk
echo.

echo ========================================
echo Build Complete!
echo ========================================
echo.
echo Your app has been rebuilt with:
echo - Student Registration Page
echo - Updated Routes
echo - All new features
echo.
echo The new APK is located at:
echo build\app\outputs\flutter-apk\app-release.apk
echo.
pause
