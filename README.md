# 🛒 Meal Planning App

A **Flutter** application built with **Clean Architecture** that helps users plan their meals, manage grocery lists, and explore suggested recipes.  
It integrates with **Firebase** for authentication and data storage and **TheMealDB API** for fetching suggested meals.

---

## 🚀 Features

### 🏁 Splash Screen
- A beautiful animated **Splash View** that introduces the app.
- Checks user authentication state:
  - If logged in → navigates to Home.
  - If not → navigates to Onboarding or Login screen.
- Built with **Cubit** for state handling and navigation control.

### 🧭 Onboarding
- A smooth onboarding experience introducing the app’s main features.  

### 🧾 Grocery Module
- Fetch grocery items categorized by type from **Firestore**.
- Each item supports:
  - ✅ Add to Cart
  - ❤️ Mark as Favorite
- All actions are synced with **Firebase** collections based on the logged-in user’s ID.

### 🍽 Suggested Meals
- Fetch meals dynamically from **TheMealDB API**.
- Displays a curated list of meal suggestions for inspiration.

### 🛍 Cart Management
- Items can be added/removed from the cart.
- Cart items are stored in a dedicated Firestore collection under the current user’s ID.
- Real-time updates and state management handled using **Cubit (Bloc)**.

### ❤️ Favorites
- Users can mark grocery items as favorites.
- Stored in a user-specific Firestore collection.
- Easily accessible in the Favorites view.

### 👤 Authentication
- Firebase Authentication integrated.
- Supports:
  - 📧 Email/Password Login
  - 🔵 Google Login
  - 🔵 Facebook Login
- Securely handles user sessions and data isolation.

## 🧩 Architecture

This app follows the **Clean Architecture pattern**, ensuring maintainability, scalability, and separation of concerns.

📦 **lib/**  
 ┣ 📂 **core/**  
 ┃ ┣ 📂 constants/  
 ┃ ┣ 📂 utils/  
 ┃ ┣ 📂 widgets/  
 ┃ ┗ 📂 manager/  
 ┃  
 ┣ 📂 **features/**  
 ┃ ┣ 📂 auth/  
 ┃ ┃ ┣ 📂 domain/  
 ┃ ┃ ┣ 📂 data/  
 ┃ ┃ ┗ 📂 presentation/  
 ┃ ┃  
 ┃ ┣ 📂 home/  
 ┃ ┃ ┣ 📂 domain/  
 ┃ ┃ ┣ 📂 data/  
 ┃ ┃ ┗ 📂 presentation/  
 ┃ ┃  
 ┃ ┣ 📂 onboarding/  
 ┃ ┃ ┗ 📂 presentation/  
 ┃ ┃  
 ┃ ┗ 📂 splash/  
 ┃ ┃ ┗ 📂 presentation/  
 ┃  
 ┗ 📄 main.dart  

Each feature includes:
- `data/` → repositories, Firebase/HTTP logic  
- `domain/` → models and business logic  
- `presentation/` → UI and Cubits for state management
---

## 🧠 State Management
The project uses **Bloc/Cubit** from `flutter_bloc` for:
- Authentication flow
- Data fetching (Firestore / APIs)
- Cart and favorites updates
- UI states (loading, success, error)
- Splash navigation and initial route handling

---

## 🗄 Tech Stack

| Category | Technology |
|-----------|-------------|
| **Frontend** | Flutter (Dart) |
| **State Management** | Bloc / Cubit |
| **Backend** | Firebase Firestore |
| **Authentication** | Firebase Auth (Google, Facebook) |
| **API** | TheMealDB API |
| **Architecture** | Clean Architecture |
| **Design Pattern** | Repository Pattern |

---

## 📸 Screenshots

### 🖼 App Preview

| Splash | Onboarding 1 | Onboarding 2 | Onboarding 3 | Onboarding 4 |
|:---------:|:------------:|:------------:|:------------:|:------------:|
| ![Splash](assets/screens/splash.jpg) | ![Onboarding1](assets/screens/onboarding1.jpg) | ![Onboarding2](assets/screens/onboarding2.jpg) | ![Onboarding3](assets/screens/onboarding3.jpg) | ![Onboarding4](assets/screens/onboarding4.jpg) |

---

| Login 1 | Login 2 | Cart | Favorites |
|:-------:|:-------:|:----:|:---------:|
| ![Login1](assets/screens/login1.jpg) | ![Login2](assets/screens/login2.jpg) | ![Cart](assets/screens/cart.jpg) | ![Favorites](assets/screens/favorites.jpg) |

---

| Grocery 1 | Grocery 2 | Grocery 3 | Grocery 4 | Grocery 5 |
|:---------:|:---------:|:---------:|:---------:|:---------:|
| ![Grocery1](assets/screens/grocery1.jpg) | ![Grocery2](assets/screens/grocery2.jpg) | ![Grocery3](assets/screens/grocery3.jpg) | ![Grocery4](assets/screens/grocery4.jpg) | ![Grocery5](assets/screens/grocery5.jpg) |
