# Payroll App - E-Commerce Application

A modern Flutter e-commerce application built with Firebase backend and clean architecture principles. This app allows users to browse products, manage a shopping cart, place orders, and track their purchases.

## 🎯 Overview

Payroll App is a full-featured e-commerce platform that demonstrates:
- **User Authentication** - Secure sign-in and sign-up with Firebase
- **Product Browsing** - Explore products with search and pagination
- **Shopping Cart** - Add/remove items and manage quantities
- **Checkout & Orders** - Place orders and view order history
- **User Profiles** - Manage user information and preferences
- **Offline Support** - Local database for caching products

---

## 📱 Key Features

### 1. **Authentication**
- Sign In / Sign Up screens with Firebase Authentication
- Splash screen with auto-login for returning users
- Secure user session management
- User profile management with Firestore

### 2. **Product Management**
- Browse products with infinite scrolling
- Search products by name/category with debounced search
- Product filtering with pagination (skip/limit)
- Product images, details, and pricing
- Product quick view with full details

### 3. **Shopping Cart**
- Add/remove products from cart
- Adjust product quantities
- Real-time cart total calculation
- Persistent cart storage using SQLite
- Cart synchronization across app sessions

### 4. **Checkout & Orders**
- Order summary with itemized pricing
- Apply delivery addresses and payment methods
- Place orders with order confirmation
- Order placement with Firebase integration

### 5. **Order Management**
- View order history with order details
- Track order status
- View order items and pricing breakdown
- Order date and timestamps

### 6. **User Profile**
- View user information
- User account preferences
- Profile management

---

## 🏗️ Project Architecture

The app follows **Clean Architecture** with separation of concerns:

```
lib/
├── core/                     # Core utilities and services
│   ├── constant/            # App constants, assets, endpoints, keys
│   ├── database/            # Local SQLite database setup
│   ├── model/              # Shared data models (User, Query params)
│   ├── network/            # API client and error handling
│   ├── service/            # API services
│   ├── theme/              # App theming and styling
│   ├── utility/            # Utilities (logger, debouncer)
│   ├── validators/         # Input validation rules
│   └── widgets/            # Reusable UI components
│
├── feature/                 # Feature modules
│   ├── auth/               # Authentication feature
│   │   ├── data/          # Data layer (repositories)
│   │   ├── domain/        # Domain layer (business logic)
│   │   └── presentation/  # UI layer (screens, controllers)
│   │       ├── binding/   # Dependency injection
│   │       ├── controller/# GetX controllers
│   │       ├── screen/    # Auth screens (Sign In, Sign Up, Splash)
│   │       └── widget/    # Auth-specific widgets
│   │
│   └── home/              # Home/E-commerce feature
│       ├── data/          # Data layer
│       │   ├── local/     # Local database repositories
│       │   ├── model/     # Product models
│       │   ├── repositoryImp/ # Repository implementations
│       │   └── response/  # API response models
│       ├── domain/        # Domain layer
│       │   └── repository/# Abstract repository interfaces
│       └── presentation/  # UI layer
│           ├── binding/   # Dependency injection
│           ├── controller/# GetX controllers
│           ├── screen/    # App screens
│           └── widget/    # Custom widgets & shimmer loaders
│
├── app_router.dart        # Route configuration
├── app.dart              # App initialization
├── main.dart            # Entry point
└── firebase_options.dart # Firebase configuration

```

---

## 🛠️ Core Components

### **Controllers (GetX State Management)**
- `HomeScreenController` - Products listing & search
- `CartController` - Cart management
- `MainController` - Main navigation
- `CheckoutController` - Checkout logic
- `OrderController` - Order history
- `ProfileController` - User profile
- `SignInController` / `SignUpController` - Auth controllers

### **Screens**
| Screen | Purpose |
|--------|---------|
| `SplashScreen` | Initial loading screen |
| `SignInScreen` | User login |
| `SignupScreen` | New user registration |
| `HomeScreen` | Main product listing |
| `MainScreen` | Bottom navigation container |
| `ViewProductPage` | Detailed product view |
| `CartScreen` | Shopping cart management |
| `CheckoutScreen` | Order checkout process |
| `OrderScreen` | Order history |
| `ProfileScreen` | User profile management |
| `ViewOrderPage` | Individual order details |

### **Data Layer**
- **Local Repositories** - SQLite database operations
  - `CartLocalRepo` - Cart data persistence
  - `ProductLocalRepo` - Product caching
  - `OrderLocalRepo` - Order caching
- **Remote Repositories** - Firebase operations
  - `HomeRepositoryImp` - Firestore data fetching

### **Widgets**
- `AppLoader` - Loading indicator
- `SearchBarDelegate` - Custom search functionality
- `Shimmer Loaders` - Skeleton loaders for content
  - `CartShimmer`
  - `ProductShimmer`
  - `OrderShimmer`
  - `ViewOrderShimmer`

---

## 📚 Technology Stack

### **Frontend**
- **Flutter** - UI framework
- **Material Design** - UI design system
- **GetX** - State management & routing

### **Backend & Services**
- **Firebase Authentication** - User authentication
- **Cloud Firestore** - Cloud database
- **Firebase Core** - Firebase initialization

### **Local Storage**
- **SQLite (sqflite)** - Local database

### **UI & Graphics**
- **Flutter SVG** - SVG rendering
- **Lottie** - Animation library
- **Shimmer** - Skeleton loading effects
- **Lucide Icons** - Icon library

### **API & Networking**
- **Dio** - HTTP client
- **JSON Serialization** - Data serialization

---

## 🔄 App Flow

### **User Journey**

1. **Splash Screen** → Auto-login check
2. **Authentication**
   - If logged out → Sign In / Sign Up screens
   - If logged in → Main app
3. **Home Screen**
   - Browse products with infinite scroll
   - Search products with live filtering
   - View user profile
4. **Product Details**
   - View full product information
   - Add to cart
5. **Shopping Cart**
   - Review cart items
   - Adjust quantities
   - Proceed to checkout
6. **Checkout**
   - Review order summary
   - Confirm order placement
   - Order confirmation
7. **Orders**
   - View order history
   - Track order details

---

## 🎨 Theming & Styling

The app implements a consistent design system:

- **Color Scheme** - Custom color palette defined in `AppColorScheme`
- **Typography** - Consistent text styles in `DefaultTextTheme`
- **Components**
  - App Bar Theme - `AppAppBarTheme`
  - Button Theme - `AppButtonTheme`
  - Input Theme - `AppInputTheme`
  - Bottom Nav Theme - `AppBottomNavTheme`
  - Icon Theme - `AppIconTheme`

All styling is centralized in `lib/core/theme/` for easy maintenance.

---

## 🔐 Authentication & Security

- **Firebase Authentication** - Secure user sign-in
- **Session Management** - Automatic session handling
- **Firestore Security** - Database access control
- **User Validation** - Input validation on all forms

---

## 💾 Data Persistence

- **Local SQLite Database** - Cached products, cart, and orders
- **Cloud Firestore** - Master data and user information
- **Hybrid Approach** - Offline-first with cloud sync

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Firebase project setup
- Android/iOS development environment

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd payrollapp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter pub run build_runner build
   ```

4. **Configure Firebase**
   - Update `google-services.json` (Android)
   - Update Firebase options in `firebase_options.dart`

5. **Run the app**
   ```bash
   flutter run
   ```

---

## 📁 Important Files

| File | Purpose |
|------|---------|
| `main.dart` | App entry point, Firebase initialization |
| `app.dart` | Root widget configuration |
| `app_router.dart` | Route definitions |
| `lib/core/constant/app_keys.dart` | Firestore collection keys |
| `lib/core/constant/app_endpoints.dart` | API endpoints |
| `pubspec.yaml` | Dependencies and assets |

---

## 🔄 State Management with GetX

The app uses **GetX** for:
- **State Management** - Reactive variables (.obs)
- **Dependency Injection** - Bindings
- **Navigation** - Named routes
- **Lifecycle Management** - Controllers with onInit, onReady, onClose

Example Controller Pattern:
```dart
class HomeScreenController extends GetxController {
  // Reactive state
  RxList<ProductModel> items = <ProductModel>[].obs;
  RxBool isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    loadData();
  }
  
  void update() {
    // Automatically notifies listeners
  }
}
```

---

## 📊 Database Schema

### Local SQLite Database
- **Products Table** - Cached product information
- **Cart Table** - User's shopping cart items
- **Orders Table** - User's order history

### Cloud Firestore Collections
- **users** - User profiles and information
- **products** - Product catalog
- **orders** - Order records

---

## 🐛 Error Handling

The app implements comprehensive error handling:
- **API Error Handling** - Custom error classes in `AppError`
- **API Call Handler** - Response handling wrapper
- **Network Error Recovery** - Retry mechanisms
- **User-friendly Messages** - Error dialogs and messages

---

## 🎯 Best Practices Implemented

✅ Clean Architecture separation
✅ SOLID principles
✅ DRY (Don't Repeat Yourself)
✅ Responsive UI design
✅ Proper error handling
✅ Code reusability through widgets
✅ Performance optimization (pagination, infinite scroll)
✅ Search debouncing for API efficiency
✅ Localized constants and resources
✅ Theme consistency

---

## 📝 Notes for Developers

- **Dependency Injection**: Use Bindings for GetX controllers
- **Database**: Always use repositories for data access
- **Navigation**: Use named routes defined in `AppRouter`
- **Styling**: Use theme variables from `AppTheme` and `AppColors`
- **Validation**: Use `AppValidator` for input validation
- **Logging**: Use `AppLogger` for debug information

---

## 🔗 Related Documentation

- [Flutter Documentation](https://flutter.dev/docs)
- [Firebase Documentation](https://firebase.google.com/docs)
- [GetX Documentation](https://pub.dev/packages/get/versions)
- [Firestore Best Practices](https://firebase.google.com/docs/firestore/best-practices)

---

## 📄 License

This project is private and not licensed for public distribution.

---

**Happy coding! 🎉**

