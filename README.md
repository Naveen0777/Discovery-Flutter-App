Overview -
Discovery App is a mobile application developed using Flutter framework, aimed at showcasing a list of items fetched from a mock API. It features pagination with unlimited scroll until the API returns empty data, a visually appealing UI, smooth animations, error handling, and clean code structure.

Features -
Discovery Page: Displays cards representing items fetched from a mock API. Each card provides relevant information about the item, including title, description, and image if available. API Integration: Utilizes the mock API endpoint to fetch data. Implements pagination with query parameters for page and limit to control the number of items retrieved per request. Pagination: Implements pagination for loading more items as the user scrolls. Continuously loads additional items when the user reaches the bottom of the list, stopping only when the               API returns an empty response indicating the end of the list. 
UI/UX: Designed with a visually appealing and user-friendly interface. Smooth animations and transitions enhance the user experience, especially during loading and scrolling. 
Error Handling: Gracefully handles potential errors, such as network failures or API errors. Displays appropriate error messages to the user when necessary, ensuring a seamless         
                experience. 
Testing: Ensures the app functions correctly under various scenarios, including edge cases, to guarantee reliability and stability.

Installation -
To run the Discovery App locally, follow these steps: 
1. Make sure you have Flutter installed on your development machine. If not, follow the official installation guide.
2. Clone the repository to your local machine from here.
3. Navigate to the project directory: { cd assignment }
4. Run the app on a connected device or emulator: { flutter run }
5. The direct link to apk is here - ( https://drive.google.com/file/d/17zAqrybmBBiJn9BHKdRYs540_zJfA-HZ/view?usp=sharing )

Code Structure -
The project directory structure is organized as follows: 
1. lib: Contains the Dart source code files for the Flutter app.
   - main.dart: Entry point of the application.
   - discovery_page.dart: Implements the discovery page displaying items fetched   
       from the API.
   - user_detail_page.dart: Displays detailed information about a selected user.
2. pubspec.yaml: Configuration file that defines the dependencies and assets used in the app.
3. android: Contains configuration files for the Android platform.
4. ios: Contains configuration files for the iOS platform.

Dependencies -
The following dependencies are used in the project: 
1. http: Used for making HTTP requests to fetch data from the API.
2. flutter/material.dart: Provides Flutter widgets and material design components for building the UI.
3. flutter/cupertino.dart: Provides Cupertino-style widgets for iOS-specific UI elements.

Contributing -
Contributions to the Discovery App are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request on the GitHub repository.

License -
This project is licensed under the MIT License.

