# SpaceX Project

<p align="center">
  <img src="https://github.com/user-attachments/assets/f7e2222a-553b-46dc-af6e-a252ed1f9d42" width="200" />
  <img src="https://github.com/user-attachments/assets/ee729c9e-059c-4b4e-8982-406533d71c10" width="200" />
  <img src="https://github.com/user-attachments/assets/bdba3085-faa1-4761-bbfd-fc629beea446" width="200" />
  <img src="https://github.com/user-attachments/assets/cf738d31-185d-4a51-89a7-53d3db8f3946" width="200" />
</p>


## About the Project

### Objective:
Create an application to explore information about SpaceX launches and missions.

### Technologies:
- Swift
- UIKit
- URLSession
- Auto Layout
- MVVM architecture

## Key Features

### Upcoming Launches:
- Fetch and display a list of upcoming SpaceX launches.
- Provide detailed information about each launch, including mission name, date, and rocket details.
- Include a countdown timer for the next upcoming launch.

### Past Launches:
- Allow users to browse completed SpaceX launches.
- Include information such as launch success status, payload, and destination.

### Rocket Details:
- Show detailed specifications for each rocket, including height, diameter, mass, and engines.
- Display reusability information for components like boosters.

### Mission Overview:
- Provide in-depth mission data, such as payload type, orbit, and customer.
- Integrate links to mission videos and other related media.

## API Used

### SpaceX API:
- Used to fetch data for launches, rockets, and missions.
- Ensures real-time updates for upcoming and recent missions.

## Architecture

### MVVM (Model-View-ViewModel):
- Adheres to a clean separation of concerns, improving maintainability.

## Design Details

### Main Screen:
- Displays lists of upcoming and past launches in separate sections.
- Includes a search bar to filter launches by keyword or date.

### Detail Screen:
- Presents comprehensive details about the selected launch or rocket.
- Features media previews like mission videos or launch images.

### Favorites Screen:
- Allows users to mark and revisit favorite launches or missions.

## Technical Details

### Networking:
- URLSession used for efficient API requests.
- Asynchronous data handling ensures smooth user experience.

### Modeling:
- Codable protocol used to parse JSON responses.
- Launch, rocket, and mission models defined for structured data handling.

### Local Storage:
- Favorites stored persistently using UserDefaults.

## Challenges and Solutions

### Real-Time Updates:
- Ensured data freshness by periodically fetching updates from the SpaceX API.

### Complex Data Structures:
- Used nested Codable models to simplify handling of intricate API responses.

### Error Handling:
- Implemented detailed error states for connectivity and parsing issues.

### Performance:
- Optimized list rendering for large datasets with pagination and lazy loading.
