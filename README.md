<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## About
This is an unofficial package of VPNAPI.io. This package helps you to fight against IP fraud & much more. This app uses an API from VPNAPI.io to stop illegal actions on apps.

## Features
VPNAPI.io collects data across the web, where their algorithm detects proxies, VPN, and Tor nodes. It gives developers and businesses peace of mind. When it comes to - detecting and blocking IP addresses associated with proxies, VPNs, and Tor nodes. So far, they have worked with developers from all around the world, where they use their API to enforce geo-blocking, prevent shopping or click fraud, reduce fake accounts and spam, prevent bots and malware, and more!

## Prerequisites
Sign up on the website to get access to the API Key.

https://vpnapi.io/signup 

So now, in the Dashboard, in the Account Details section, you can see the API Key. Copy that key and store it somewhere.

## Installation:
Run this command with Flutter:
```console
flutter pub add url_launcher
```

OR

This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):
```yaml
dependencies:
  check_vpn: ^0.0.1
```

## Getting started
Now in your Dart code, you can use:
```dart
import "package:check_vpn/check_vpn.dart";
```

```dart
await CheckVPN.instance.getInfo(
  apiKey: "YOUR KEY HERE",
  onSuccessResult: (res) {
    // Success Result
  },
  onFailureResult: (err) {
    // Failure Result
  },
);
```

## Usage
```dart
// This is a base class it has sub-classes: Security, Location, Network & etc.
SuccessResult successResult = SuccessResult();
// This is a base class it does not have any sub-classes, except one variable.
FailureResult failureResult = FailureResult();

await CheckVPN.instance.getInfo(
  apiKey: "YOUR KEY HERE",
  onSuccessResult: (res) {
    // Assigning res to our local variable
    successResult = res;
  },
  onFailureResult: (err) {
    // Assigning err to our local variable
    failureResult = err;
  },
);

// Access SuccessResult:
print(successResult.ip);               // Displays the current alloc IP address
print(successResult.security?.vpn);    // Determines if VPN is connected or not
print(successResult.location?.city);   // Display the city name from IP address
print(successResult.network?.network); // Displays which network the IP belongs

// Access FailureResult:
print(failureResult.message);         // Displays what goes wrong with package
```

## Additional information
The data type of onSuccessResult is SuccessResult. In this class, you can extract information about the IP Address, Security, Location, Network (ISP), etc.

The data type of onFailureResult is FailureResult. In this class, you can look up information for the cause of failure (when you don't supply any API Key, etc.).

## Preview
![alt text](https://i.postimg.cc/fRGS0YKB/Screenshot-2023-08-26-at-11-39-46-AM.png "img")

## Example
For more information, please checkout the example folder. https://github.com/dharambudh1/check_vpn/tree/main/example

## Issues
Found any bugs or issues? Please inform at the GitHub issues screen. https://github.com/dharambudh1/check_vpn/issues
