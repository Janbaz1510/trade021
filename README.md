# Watchlist Reordering – Flutter Assignment

This project is a simple implementation of a stock watchlist where items can be reordered using drag and drop.

The focus was mainly on keeping the code clean and structured while using BLoC + Clean Architecture, rather than just making the UI work.

## What’s implemented

- Reordering of watchlist items (drag & drop)
- State management using BLoC
- Clean separation between data, domain, and presentation
- Local mock data (no API used)

## How I approached it

Instead of directly managing state in the UI, I went with Clean Architecture to keep things scalable.

- UI only handles rendering + user interaction  
- BLoC handles state changes  
- Domain layer handles business logic  
- Data layer provides the actual data  

For this assignment, data is coming from a local in-memory list, but the structure allows plugging in an API later without changing much.

## Project structure (simplified)

features/
 └── wishlist/
      ├── data/
      │    ├── datasources/
      │    ├── models/
      │    └── repositories/
      │
      ├── domain/
      │    ├── entities/
      │    ├── repositories/
      │    └── usecases/
      │
      └── presentation/
           ├── bloc/
           └── ui/

## Data layer

- WishlistLocalDataSource holds a list of items
- Acts like a fake backend
- Has two methods:
  - get items
  - update order

Reordering just updates this list.

## Domain layer

- WishlistItem → core entity  
- WishlistRepository → contract  

Use cases:
- GetWishlist
- UpdateWishlistOrder

## BLoC logic

Two main events:

- LoadWishlist → loads initial data  
- SaveReorderedWishlist → updates order  

Flow:

1. UI sends reordered list
2. BLoC calls update usecase
3. Data source updates list
4. New state is emitted
5. UI rebuilds

## Things I focused on

- Keeping logic out of UI
- Simple and readable structure
- Avoiding over-engineering
- Making it easy to extend later

## Limitations / assumptions

- Data is static (no API)
- No persistence (resets on restart)
- Prices are strings (just for display)

## What I’d improve if this was a real app

- Add API integration
- Store data locally (Hive/SQLite)
- Add loading/error states in BLoC
- Add unit tests
- Better UI polish + animations

## Run the project

flutter pub get  
flutter run  

## Author

Janbaz Ahmad  
Flutter Developer
