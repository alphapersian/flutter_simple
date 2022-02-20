# Deeplink

this is how to add deep link into page 

***
### Enable deep linking on Android 
#### add this code to `AndroidManifest.xml`  inside the `<activity>`
replace flutterbooksample.com with your domain 

```xml
<!-- Deep linking -->
<meta-data android:name="flutter_deeplinking_enabled" android:value="true" />
<intent-filter android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="http" android:host="flutterbooksample.com" />
    <data android:scheme="https" />
</intent-filter>
```

***
### Enable deep linking on IOS
#### add this code to `Info.plist`
replace flutterbooksample.com with your domain

```xml
<key>FlutterDeepLinkingEnabled</key>
<true/>
<key>CFBundleURLTypes</key>
<array>
    <dict>
    <key>CFBundleTypeRole</key>
    <string>Editor</string>
    <key>CFBundleURLName</key>
    <string>flutterbooksample.com</string>
    <key>CFBundleURLSchemes</key>
    <array>
    <string>customscheme</string>
    </array>
    </dict>
</array>
```


***
###  Test deeplink in android and ios

#### Android 
```shell
adb shell am start -a android.intent.action.VIEW \
-c android.intent.category.BROWSABLE \
-d "http://flutterbooksample.com/book/1"
```


#### IOS
```shell
xcrun simctl openurl booted customscheme://flutterbooksample.com/book/1
```


***
###  Handle incoming link on device
in your `main` handle the routes like this 


```dart
initialRoute: "/",
      onGenerateRoute: (setting) {
        if (setting.name == "/") {
          return MaterialPageRoute(
            builder: (_) => Splash("splash"),
          );
        } else if(setting.name == "/pay") {
          return MaterialPageRoute(
            builder: (_) => PayResult(),
          );
        }else{
          return MaterialPageRoute(
            builder: (_) => ElsePage(),
          );
        }
        // print(setting.name);
        // print(setting.arguments);
      },
```

