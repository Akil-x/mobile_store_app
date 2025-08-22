# Mobile Store App - Project Structure

This Flutter project has been restructured to be more organized, maintainable, and easier to learn.

## 📁 Directory Structure

```
lib/
├── screens/           # Full screen widgets
│   └── home_screen.dart
├── widgets/           # Reusable UI components
│   ├── common/        # Common widgets used across screens
│   │   ├── gradient_background.dart
│   │   └── app_logo.dart
│   ├── buttons/       # Button components
│   │   ├── primary_button.dart
│   │   └── secondary_button.dart
│   ├── cards/         # Card components
│   │   └── feature_card.dart
│   └── text/          # Text components
│       ├── app_title.dart
│       └── app_description.dart
├── constants/         # App-wide constants
│   ├── app_colors.dart
│   ├── app_text_styles.dart
│   └── app_sizes.dart
├── models/            # Data models (for future use)
├── services/          # Business logic and API services (for future use)
├── utils/             # Utility functions (for future use)
└── main.dart          # App entry point
```

## 🎯 Benefits of This Structure

### 1. **Separation of Concerns**
- **Screens**: Handle full-screen layouts and navigation
- **Widgets**: Reusable UI components
- **Constants**: Centralized styling and configuration
- **Models**: Data structures (when you add data)
- **Services**: Business logic and API calls (when you add backend)

### 2. **Reusability**
- Widgets can be used across different screens
- Constants ensure consistent styling
- Easy to maintain and update

### 3. **Scalability**
- Easy to add new screens
- Simple to create new widgets
- Clear organization for team development

### 4. **Learning Benefits**
- Clear separation makes it easier to understand
- Each file has a single responsibility
- Easy to find and modify specific components

## 🚀 How to Use

### Adding a New Screen
1. Create a new file in `lib/screens/`
2. Import the widgets you need from `lib/widgets/`
3. Use the constants from `lib/constants/`

### Creating a New Widget
1. Choose the appropriate subdirectory in `lib/widgets/`
2. Create a new file with a descriptive name
3. Make it reusable by accepting parameters

### Using Constants
```dart
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

// Use colors
color: AppColors.primaryBlue

// Use text styles
style: AppTextStyles.title
```

## 🔧 Current Components

### Screens
- **HomeScreen**: Main landing page with gradient background

### Common Widgets
- **GradientBackground**: Reusable gradient container
- **AppLogo**: App logo with shopping bag icon

### Text Widgets
- **AppTitle**: "متجر كنز" title
- **AppDescription**: App description in Arabic

### Button Widgets
- **PrimaryButton**: White button with blue text
- **SecondaryButton**: Transparent button with white border

### Card Widgets
- **FeatureCard**: Feature buttons (Trending, Featured, Products)

## 📱 Features
- Beautiful gradient background
- Arabic text support
- Responsive design
- Reusable components
- Clean architecture

## 🎨 Styling
- Uses Cairo font family for Arabic text
- Consistent color scheme
- Proper spacing and sizing
- Modern UI design

This structure makes the code more maintainable and easier to understand for both beginners and experienced developers!
