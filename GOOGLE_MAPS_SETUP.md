# Google Maps API Setup Guide

## 🚨 **CRITICAL: Fix the InvalidKeyMapError**

The app is currently showing `InvalidKeyMapError` because Google Maps API keys are not properly configured. Follow these steps to fix it:

---

## 📋 **Step 1: Get Google Maps API Keys**

### **1.1 Create Google Cloud Project**
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select existing one
3. Enable billing (required for Maps API)

### **1.2 Enable Required APIs**
Enable these APIs in your Google Cloud project:
- **Maps JavaScript API** (for web)
- **Maps SDK for Android** (for Android)
- **Maps SDK for iOS** (for iOS)

### **1.3 Create API Keys**
1. Go to "Credentials" in the left sidebar
2. Click "Create Credentials" → "API Key"
3. **Important**: Restrict your API keys for security:
   - **Web API Key**: Restrict to your domain (e.g., `localhost`, your production domain)
   - **Android API Key**: Restrict to your Android app package name
   - **iOS API Key**: Restrict to your iOS bundle ID

---

## 🔧 **Step 2: Configure API Keys in Code**

### **2.1 Web Configuration (`web/index.html`)**
Replace `YOUR_API_KEY` with your **JavaScript API key**:

```html
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_JAVASCRIPT_API_KEY&libraries=places"></script>
```

### **2.2 Android Configuration (`android/app/src/main/AndroidManifest.xml`)**
Replace `YOUR_ANDROID_API_KEY` with your **Android API key**:

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="AIzaSyDXr9lnyRx67rk63DqzM9WrS98JgFxOCrA"/>
```

### **2.3 iOS Configuration (`ios/Runner/Info.plist`)**
Add your **iOS API key** to the Info.plist:

```xml
<key>io.flutter.embedded_views_preview</key>
<string>YES</string>
<!-- Add this key for iOS Maps -->
<key>AIzaSyDXr9lnyRx67rk63DqzM9WrS98JgFxOCrA</key>
<string>YOUR_IOS_API_KEY</string>
```

---

## 🎨 **Step 3: Add Custom Marker Icons (Optional)**

### **3.1 Create Assets Directory**
```bash
# Create assets directory if it doesn't exist
mkdir assets
```

### **3.2 Add Marker Images**
Add these image files to the `assets/` directory:
- `location_pin.png` (48x48px) - for location markers
- `facility_pin.png` (32x32px) - for facility markers
- `must_logo.jpg` - for the app logo

### **3.3 Update pubspec.yaml**
Make sure assets are declared:
```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/
```

---

## 🚀 **Step 4: Test the Setup**

### **4.1 Clear Cache and Restart**
```bash
# Clear Flutter cache
flutter clean

# Get dependencies
flutter pub get

# Run the app
flutter run -d chrome  # For web testing
flutter run -d android  # For Android testing
flutter run -d ios     # For iOS testing
```

### **4.2 Verify Maps Load**
- Maps should load without API key errors
- Markers should appear on the map
- Location services should work
- Campus map management should be functional

---

## 🔒 **Step 5: Security Best Practices**

### **5.1 API Key Restrictions**
- **Web**: Restrict to specific domains
- **Android**: Restrict to package name and SHA-1 fingerprint
- **iOS**: Restrict to bundle ID

### **5.2 Environment Variables**
For production, consider using environment variables:
```dart
// Instead of hardcoding keys
const String googleMapsApiKey = String.fromEnvironment('GOOGLE_MAPS_API_KEY');
```

### **5.3 Monitor Usage**
- Set up billing alerts in Google Cloud
- Monitor API usage in Google Cloud Console
- Restrict APIs to only what's needed

---

## 🐛 **Troubleshooting**

### **"InvalidKeyMapError"**
- Check if API key is correct
- Verify API restrictions match your app
- Ensure Maps JavaScript API is enabled

### **"assets/assets/must_logo.jpg" 404 Error**
- Clear browser cache
- Check if file exists in `assets/` directory
- Verify pubspec.yaml asset declaration

### **Maps Not Loading**
- Check internet connection
- Verify API key has correct permissions
- Check browser console for JavaScript errors

### **Location Permissions**
- Grant location permissions in device settings
- Check AndroidManifest.xml and Info.plist permissions

---

## 💡 **Tips for Development**

### **Development vs Production Keys**
- Use different API keys for development and production
- Development keys can have fewer restrictions
- Production keys should have strict domain/package restrictions

### **Testing Without API Key**
For quick testing, you can temporarily use unrestricted keys, but **never deploy to production** without proper restrictions.

### **API Quotas**
- Google Maps has free quotas, but monitor usage
- Set up billing alerts to avoid unexpected charges
- Consider Maps SDK pricing for high-usage apps

---

## 📞 **Need Help?**

If you continue having issues:

1. Check the [Google Maps Flutter documentation](https://pub.dev/packages/google_maps_flutter)
2. Verify your API key setup in [Google Cloud Console](https://console.cloud.google.com/)
3. Check Flutter doctor: `flutter doctor -v`
4. Clear all caches: `flutter clean && flutter pub get`

---

## ✅ **Expected Result**

After proper setup:
- ✅ Maps load without API key errors
- ✅ Campus map management works perfectly
- ✅ Location markers display correctly
- ✅ Interactive map editing functions
- ✅ Real-time data synchronization
- ✅ All CRUD operations work seamlessly

**The campus map management system is now fully functional with proper Google Maps integration!** 🗺️📍