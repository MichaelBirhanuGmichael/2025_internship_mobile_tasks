# E-Commerce Mobile App

## Architecture
The app follows Clean Architecture principles with three main layers:

1. **Presentation Layer**: Contains UI components and BLoCs
2. **Domain Layer**: Contains business logic, entities, and use cases
3. **Data Layer**: Handles data sources and repositories

## Data Flow
1. UI triggers an event (e.g., loading products)
2. BLoC processes the event and calls the appropriate use case
3. Use case coordinates with repository
4. Repository decides data source (remote or local)
5. Data returned through the same chain back to UI

## Key Features
- Product CRUD operations
- Network-aware data fetching
- Local caching for offline support
- Clean separation of concerns

## Testing
- Unit tests for models, use cases, and repositories
- Mock implementations for testing
- Test coverage for all critical paths