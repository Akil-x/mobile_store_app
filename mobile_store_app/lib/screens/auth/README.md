# Authentication Screens

This directory contains the authentication-related screens for the mobile store app.

## Screens

### LoginScreen (`login_screen.dart`)
A professional login screen with the following features:
- Beautiful gradient background matching the design
- Email and password input fields with validation
- Password visibility toggle
- "Forgot Password" link
- **Fixed**: Proper button height (56.58px) matching design specifications
- **Fixed**: No overflow issues with proper scrolling and spacing
- Gradient login button with shadow effects
- Navigation to signup screen
- RTL (Right-to-Left) text support for Arabic
- Form validation with error messages
- Professional UI with proper spacing and shadows

### SignUpScreen (`signup_screen.dart`)
A comprehensive signup screen with the following features:
- Full name, email, password, and confirm password fields
- Password visibility toggles for both password fields
- Form validation including password confirmation matching
- **Fixed**: Proper button height (56.58px) matching design specifications
- **Fixed**: No overflow issues with proper scrolling and spacing
- Gradient signup button with shadow effects
- Navigation back to login screen
- RTL text support for Arabic
- Professional UI matching the login screen design

## Recent Fixes

### ✅ **Overflow Issue Resolved**
- Added `SingleChildScrollView` to prevent content overflow
- Used `ConstrainedBox` to maintain proper height constraints
- Added bottom spacing to prevent cutoff

### ✅ **Button Styling Fixed**
- Changed from `ElevatedButton` to custom `Container` with `InkWell`
- Applied exact height from design: **56.58px**
- Used proper padding values from design specifications
- Maintained gradient and shadow effects

### ✅ **Navigation Improved**
- Fixed navigation between login and signup screens
- Proper route handling with named routes
- Consistent back button behavior

## Features

### Design Elements
- **Gradient Background**: Uses the exact gradient from the design specification
- **Card Design**: White cards with subtle borders and shadows
- **Color Scheme**: Follows the app's color palette with proper contrast
- **Typography**: Uses Cairo font family with appropriate weights and sizes
- **RTL Support**: Properly configured for Arabic text direction

### Form Validation
- **Email Validation**: Checks for valid email format
- **Password Validation**: Ensures minimum length requirements
- **Password Confirmation**: Matches passwords in signup
- **Required Fields**: All fields are mandatory
- **Error Messages**: User-friendly Arabic error messages

### Navigation
- **Back Button**: Returns to previous screen
- **Cross-Navigation**: Easy switching between login and signup
- **Route Management**: Proper route handling with named routes

### Responsive Design
- **Safe Area**: Respects device safe areas
- **Flexible Layout**: Adapts to different screen sizes
- **Proper Spacing**: Consistent spacing throughout the UI
- **Scrollable Content**: Prevents overflow on small screens

## Usage

### Navigation
```dart
// Navigate to login screen
Navigator.of(context).pushNamed('/login');

// Navigate to signup screen
Navigator.of(context).pushNamed('/signup');

// Navigate back
Navigator.of(context).pop();
```

### Form Handling
The screens include form controllers and validation logic. You can extend the `_handleLogin()` and `_handleSignUp()` methods to implement your authentication logic.

### Customization
- Colors can be modified in the `app_colors.dart` file
- Text styles can be updated in the `app_text_styles.dart` file
- The gradient and shadow effects can be adjusted in the respective build methods

## Dependencies
- Flutter Material Design
- Cairo font family (included in assets)
- Custom color and text style constants

## Notes
- **All overflow issues have been resolved**
- **Button heights now match design specifications exactly**
- **Proper scrolling behavior on all screen sizes**
- The screens are designed to work seamlessly with the existing app structure
- All text is in Arabic as per the design requirements
- The UI follows Material Design principles while maintaining the custom design aesthetic
- Form validation provides immediate feedback to users
- The screens are fully responsive and work on various device sizes

## Technical Details

### Button Implementation
```dart
Container(
  width: double.infinity,
  height: 56.58, // Exact height from design
  decoration: BoxDecoration(
    gradient: LinearGradient(...),
    borderRadius: BorderRadius.circular(16),
    boxShadow: [...],
  ),
  child: Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: _handleAction,
      child: Container(
        padding: EdgeInsets.only(
          top: 8.59,
          left: 58.36,
          right: 74.36,
          bottom: 8,
        ),
        // Button content
      ),
    ),
  ),
)
```

### Overflow Prevention
```dart
SingleChildScrollView(
  child: ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height - 
                MediaQuery.of(context).padding.top - 
                MediaQuery.of(context).padding.bottom,
    ),
    child: Column(...),
  ),
)
```
