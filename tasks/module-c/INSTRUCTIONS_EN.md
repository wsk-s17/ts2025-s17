# Module C - REST API

For the promotion of cycling in the city, the company **VelOrda** has launched a project to create a safe and scalable online platform for managing bicycle rentals. Your development team has been tasked with building this service taking into account modern security and usability standards.

The goal of Module C is to create a REST API for renting bicycles nearby.

## Competitor Information

It must be developed strictly according to the OpenAPI specification.

Various security aspects will be tested.

## Database

You are already provided with a database dump. The structure must not be changed.

## External Services

All documentation is located in the media-files/external-services folder. You can find detailed information on how to use the services there.

### Weather

Returns the current weather of the city.

Example response:

```ts
{
	"weather": "clear | fog | rain | snow",
	"temperature": 25
}
```

### City

Returns the traffic status for a specific location.

There are 4 color scales:
- Green: free flow
- Yellow: light traffic
- Red: heavy congestion
- Black: road closed

There is also a numerical congestion index (from 1 to 100) used for fine-tuning the dynamic pricing.

The color affects the status separately:

| Color  | Multiplier |
| ------ | ---------- |
| Green  | 0.9        |
| Yellow | 1          |
| Red    | 1.2        |
| Black  | 1.5        |

Formula for calculating the dynamic price:

```js
dynamic_price = base_price * (1 + traffic_number_index / 100) * color_multiplier;
dynamic_price = clamp(dynamic_price, min_price, max_price);
```

Example response:

```ts
{
	"color_scale_of_corks": "green | yellow | red | black",
	"number_scale": 54
}
```


### OAuth

An authorization service is provided.
The service is available at: https://oauth.ts2025.com

You need to create an application and obtain the secret keys (client_id, client_secret).
Then, form a link with the appropriate query parameters and wait for the user to authorize through our service and be redirected back to your website with a code used to obtain the secret token.

After these steps, you can retrieve the user’s information.

## REST API Requirements

### Auth

Users can log in either with their **email** and **password** or through OAuth.

### Rating

New ratings should have a stronger impact on the overall score than older ones.
For example, if a user’s current rating is 5 and they receive a new rating of 3, the updated rating should become 4.7.

Calculate the rating using the formula: (5 * alpha + sum(items)) / (alpha + items.length).

Round the rating to one decimal place.

### Rent

A user can rent a bicycle only if the weather and/or their rating meet the rental conditions.

Once a bicycle is rented, it cannot be rented again until the current rental period ends.

A user cannot have more than one lease.

To start a rental, the user must pay 1000 KZT as a deposit. This amount is refunded after the rental if the user successfully pays the total rental cost.

After completing each rental, the user can leave a review (1–5) and must upload at least two photos of the bicycle.
The wear percentage is calculated and updated in the database.

If the wear is 50% or higher, the bicycle cannot be rented again.

Additionally, the moderator must evaluate the user by reviewing the submitted photos.
The moderator earns 5% of the total rental cost for each reviewed rental.

### Repair a Bicycle

After each rental, the bicycle’s wear percentage increases.

Only the administrator can perform repairs.
Formula:
```js
wear = Math.floor(((ms / 1000) / 60) * 0.1)
```

75–100%: severe condition (washing + repair + parts replacement).
50–74%: medium wear (washing + repair).
25–49%: scheduled maintenance (wash only).
<25%: excellent condition, can be rented without repair.

When the wear percentage exceeds 50, the bicycle must be serviced.

Service price list:

| Service      | Price(KZT) | Percentage |
| ------------ | ---------- | ---------- |
| Washing      | 2000       | 10         |
| Repair       | 10000      | 25         |
| Tire change  | 6500       | 35         |
| Chain change | 15000      | 30         |

After repair, the wear percentage is restored according to the table.

### Histories

Save all balance-related actions in the transaction history.

- Moderator reward: `MODERATION_REWARD`
- Replenishment: `REPLENISHMENT`
- Withdrawal: `WITHDRAWAL`
- Expense (rental): `RENT`

The balance history must be filterable by date, with the most recent transactions displayed at the top.

## Specifications

The main server specification is located in the folder `media-files/swagger/open-api.yml`.

The **Insomnia** collection can be found in the folder: `media-files/collections/ts2025-module-c.json`.