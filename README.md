### Summary: 
Recipe App for Fetch Take Home Project
iOS Apprentice role

Simple list view of alphabetical cuisines types
<img width="229" alt="Screenshot 2025-04-30 at 3 35 44 PM" src="https://github.com/user-attachments/assets/2198602d-cdb0-4fd1-9c1b-d39868fff9a8" />
<img width="219" alt="Screenshot 2025-04-30 at 3 35 51 PM" src="https://github.com/user-attachments/assets/6f860938-82f7-489f-9b19-9bf017babec7" />
Image caching on device to minimize the amount of network calls needed, avoided the use of AsyncImage as it does not come with caching out of the box
<img width="773" alt="Screenshot 2025-04-30 at 3 35 18 PM" src="https://github.com/user-attachments/assets/12b38b75-b0ac-4267-b026-ef7f8bae8c9a" />
<img width="762" alt="Screenshot 2025-04-30 at 3 35 25 PM" src="https://github.com/user-attachments/assets/93c5573a-b1d1-479d-b209-a6806b5c7f3e" />

Sample testing using both Swift Testing and the more mature XCTesting library
<img width="843" alt="Screenshot 2025-04-30 at 3 51 20 PM" src="https://github.com/user-attachments/assets/0a6355ca-a06f-499a-9ff1-bf99383068b8" />



### Focus Areas:
Performance, caching images, and abstracting / using generic architecture. 
Even for a simple app like this I felt it was important to use the best architecture choices that I've learned thus far.

### Time Spent: Approximately how long did you spend working on this project
Around 2.5 - 3 hours total

### Trade-offs and Decisions: 
MVVM
I wanted to make sure the underlying architecture was as solid as possible, that way if I needed to expand on the project I wouldn't face any scaling issues or blocks in the future.

### Weakest Part of the Project:
The general UI, I could have added a grid view for the scroll or opened up Figma and made a nice splash screen and ui mockup but I kept it simple using what SwiftUI provides. I could have definitely spent more time polishing the overrall look and feel if time allowed but I don't feel it too necessary for this showcase.
### Additional Information: 
Slide down / Scroll up for API refresh, graceful error messages if empty data / unknown issue occurs 
