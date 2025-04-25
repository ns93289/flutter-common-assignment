## Features Implemented in the App

1. User List Screen: Displays a paginated list of users, including their images and names.
2. Movie List Screen: Shows a grid view of movies with pagination, using the TMDB API.
3. Movie Details Screen: Displays movie title, poster, release date, and description.
4. Add User: Allows adding a user with name and job details, using the provided API.

## Features Not Included

Due to a lack of familiarity with the Flutter `workmanager` plugin, local data storage for offline use and synchronization when the device comes online has not been implemented.  
This feature would require additional time to learn and integrate background task handling and data syncing.

## Libraries and Plugins Used

- `flutter_screenutil`: For responsive UI design based on screen size.
- `google_fonts`: Roboto font used consistently across the app.
- `dio`: API calling library.
- `rxdart`: Used for state management with a custom BLoC architecture to dynamically update the UI.
- `infinite_scroll_pagination`: Handles list/grid pagination.
- `cached_network_image`: Loads images and caches them for faster reloads.
- `shimmer`: Displays a shimmer loader while waiting for API responses.

## Project Structure and Directories

- `bloc`: Contains custom BLoC classes that handle the business logic for different screens.
- `constants`: Currently contains color constants used throughout the app.
- `utils`: Contains utility functions and helper tools.
- `customWidgets`: Includes reusable custom widgets with consistent design across the app.
- `network`: Manages all API-related logic, including constants, URLs, response types, helper classes, and repositories.
- `screens`: Each screen is organized into its own subdirectory under this main directory.