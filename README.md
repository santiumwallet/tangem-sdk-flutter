[![Twitter](https://img.shields.io/twitter/follow/tangem?style=flat)](http://twitter.com/tangem)

# Welcome to Tangem

The Tangem card is a self-custodial hardware wallet that works via NFC. The main functions of Tangem cards are to securely create and store a private key and sign data.

Tangem SDK is needed to facilitate support for Tangem cards in third-party applications.

Supported platforms: [iOS](https://github.com/tangem/tangem-sdk-ios) | [Android](https://github.com/tangem/tangem-sdk-android) | [JVM](https://github.com/tangem/tangem-sdk-android) | **Flutter** | [React Native ](https://github.com/tangem/tangem-sdk-react-native) | [Cordova](https://github.com/tangem/tangem-sdk-cordova) | [Capacitor](https://github.com/tangem/tangem-sdk-cordova)

# Documentation

For exhaustive documentation, see [Tangem Developers Portal](https://developers.tangem.com).

To kick off the development process you can start with [Getting started](https://developers.tangem.com/getting-started/flutter) page.

# Installation

## Android Setup

Add the following to your app's `android/build.gradle` file in the `allprojects.repositories` block:

```gradle
allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url 'https://jitpack.io' }
        // Required: Local Maven repository for tangem-sdk (bundled with plugin)
        maven { url = uri("$rootDir/../tangem-sdk-flutter/android/repo") }
    }
}
```

> **Note:** The path to the `repo` directory depends on where the plugin is located relative to your project. If you're using the plugin from pub.dev or as a Git dependency, adjust the path accordingly. For example:
> - Git dependency: `maven { url = uri("${rootProject.projectDir}/../../android/repo") }`
> - Path dependency: Adjust based on your local path

### Why is this needed?

The Tangem Android SDK is currently built from source and bundled as a local Maven repository within this plugin. This is a temporary measure while the official JitPack build is unavailable. Once JitPack publishes the SDK, this requirement will be removed.

## iOS Setup

No additional setup required for iOS.

# License

Tangem SDK is available under the MIT license. See the [LICENSE](LICENSE) file for more info.