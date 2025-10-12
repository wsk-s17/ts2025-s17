# Module D - Interactive Frontend using an API

For the promotion of cycling in the city, the company **VelOrda** has launched a project to create a safe and scalable online platform for managing bicycle rentals. Your development team has been tasked with building this service taking into account modern security and usability standards.

The goal of this module is to create a SPA based on the ready-made REST API that was developed in the previous module.

## Competitor Information

Module D will be tested in the latest version of the Google Chrome browser.

Implement the pages according to the layouts for mobile devices. Pay close attention to UI/UX. If desired, you may improve the layouts or add missing elements.

## SPA Requirements

### PWA

Please configure the manifest.json file and the necessary meta tags for Android mobile web systems.
Also configure the viewport for convenient display on mobile devices.

Configure the manifest to allow installing the application on the home screen.

### Navigation bar

There are 3 buttons in the navigation bar:
1. Work
2. Home
3. Profile

The navigation bar is always fixed at the bottom of the screen.

### Auth

Access to the application pages is available only after authorization.

Implement the login and registration pages. There must be an option to log out of the account.

Login should be possible using email and password or through the provided OAuth service.

Apply basic data validation before sending it to the server.

After authorization, save the token so that the same data does not need to be entered repeatedly.

### Home Page

After authorization, the user is redirected to this page.

Display all bicycles on the map (5000×5000 px), using the appropriate icon.

If the user is currently renting a bicycle, a block with basic rental information is displayed at the top (bicycle name, elapsed time, button). When the button is clicked, it should navigate to the rental management page.

The color of the bicycle depends on its status:
- Black: unavailable
- Red: occupied
- Green: available

Implement the ability to zoom and pan the map using touch gestures.

When a bicycle is tapped, a modal window (as in the wireframes) should appear with additional information about the bicycle:
- Image
- Rating
- Name
- Description
- Bicycle condition

There must also be the ability to:
- Select a tariff. When a dynamic tariff is selected, the rental price should update every 15 seconds based on weather and congestion (use the provided API).
- Agree to the rental terms (checkbox)
- Enter a promo code (input field)
- Rent the bicycle (rent button)
- Download the rental terms and contract (files are located in media-files)

Display the weather and congestion index above the map. Show the correct icons according to the API response.

Update the data every minute or as needed.

### Current Rent

On this page the user manages their current rental.

The following information is displayed:
- Bicycle name
- Price per minute
- Elapsed time
- Total cost at the current moment

Data must be updated in real time. To synchronize, poll the server every 30 seconds.

The bicycle must be laid out according to the mockup and the wheels animated. The animation should be smooth.

The user can end the trip at any time. To finish the rental, the user must photograph the bicycle from multiple sides (minimum 2 images) and send them to the server along with an optional rating.

### Profile Page

The profile displays the following data:
- Avatar (placeholder)
- Name
- Email
- Phone number
- Balance
- Average rating
- Doughnut chart based on payment history (account operations over the entire period)
- Payment history (Account operation, Date, Amount)
- Buttons to top up and withdraw funds

The user can top up the balance or withdraw funds by specifying the required amount. These operations are sent to the server and result in an update of the balance and payment history.

There are four types of account operations:
- Replenishment (#59AC77)
- Withdrawal (#6E8CFB)
- Rental (#9c3f42)
- Moderation reward (#FEB21A)

The chart must be implemented using the provided `chart.js` script.

### Work Page

The page is intended to display the bicycles the user has access to.

The owner sees a list of their bicycles, with the ability to repair them and evaluate past rentals.

A moderator can evaluate past rentals and receive 5% of the total rental cost.

If the user is not yet a moderator, a placeholder page is displayed with a button to navigate to the page containing moderation offers for bicycles.

Moderation is limited to bicycles belonging to a single owner.
After submitting a moderation request, the user must wait for the owner’s approval.
While the request is under review, a placeholder page with the appropriate message is displayed.
If the request is rejected by the owner, the user can submit a new moderation request.
Once approved, a list of the owner’s bicycles accessible to the user is displayed.

For each bicycle, a list of past rentals must be shown.

On the page with past rentals, the following data must be displayed:
- Wear percentage after rental
- Photos in the form of a slider

Additionally, a star rating must be displayed for evaluating the user who rented the bicycle, along with buttons for submitting the evaluation.
After submitting the evaluation, the past rental entry disappears from the list.

### Other

Use number formatting. For example, 7000 → 7 000; 1234567 → 1 234 567.