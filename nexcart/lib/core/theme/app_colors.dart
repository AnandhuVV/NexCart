import 'package:flutter/material.dart';
import 'package:nexcart/core/theme/theme_extension.dart';

const nexLightColors = NexColors(
  // Actions
  primaryAction: Color(0xFF0C83DC),    // Strong brand blue for high-visibility actions
  secondaryAction: Colors.white,       // Clean white for secondary or ghost buttons

  // Backgrounds
  background: Color(0xFFF2F6FA),       // Very soft blue-tinted grey to reduce "stark white" glare
  surface: Colors.white,               // Pure white to make cards and containers "pop"
  surfaceTint: Color(0xFFECECEE),      // Subtle grey for dividers or inactive input backgrounds
  shimmerBase: Color(0xFFE0E0E0),      // Light grey for shimmer base
  shimmerHighlight: Color(0xFFF5F5F5), // Slightly lighter

  // Text
  textPrimary: Color(0xFF151829),      // Deep navy-black for maximum readability
  textSecondary: Color(0xFF616370),    // Muted slate for captions and less important info
  onPrimary: Colors.white,             // Clean white contrast for text inside primary buttons
  onSurface: Color(0xFF3C73D2),        // Brand blue accent for icons or links on white surfaces

  // States
  success: Color(0xFF66BB6A),          // Vibrant green for positive feedback
  error: Color(0xFFF44336),            // Clear red for critical errors or destructive actions
);

const nexDarkColors = NexColors(
  // Actions
  primaryAction: Color(0xFF1F7AA5),    // Slightly brighter/more saturated blue to pop on dark
  secondaryAction: Color.fromARGB(255, 78, 91, 114),  // Darker surface for subtle buttons

  // Backgrounds
  background: Color(0xFF0F111A),       // Deep "Midnight" blue-black
  surface: Color(0xFF1B1E2B),          // Lighter than background to create elevation
  surfaceTint: Color(0xFF242735),      // Used for dividers or inactive states
  shimmerBase: Color(0xFF2A2A2A),      // Dark grey for shimmer base
  shimmerHighlight: Color(0xFF3A3A3A), // Slightly lighter for shimmer highlight

  // Text
  textPrimary: Color(0xFFECEFF4),      // Off-white for high contrast without "vibration"
  textSecondary: Color(0xFFA0A5B1),    // Muted grey for secondary info
  onPrimary: Colors.white,             // Stays white for contrast on the primary blue
  onSurface: Color(0xFF4C84FF),        // Using the primary blue as an accent on surfaces

  // States
  success: Color(0xFF81C784),          // Desaturated green (easier on eyes in dark mode)
  error: Color(0xFFE57373),            // Desaturated red
);