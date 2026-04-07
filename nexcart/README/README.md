# NexCart

# Features
1. Auth
Login
Token (even if fake)

2. Catalog
Products list
Product details
Search

3. Cart
Local cart (since API may not fully support cart)
Optimistic updates

4. Orders (NEW instead of user)
Get user orders
View single order

5. Core (cross-cutting)
Connectivity
DB (sqflite)
Network

# Typography used
<img src="assets/fonts_typography.png" width="300" />

Font family used : Poppins

# Usage of Either
    dart_either is used across all layers including domain. While purist Clean Architecture avoids external dependencies in domain, dart_either is a pure Dart utility with no framework coupling, making this an acceptable pragmatic tradeoff.