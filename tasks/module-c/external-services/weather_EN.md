# Weather API

An API for retrieving current weather.

Available by address: `https://api.ts2025.com`

## Endpoint

/external-services/weather - Returns the current weather conditions, updated every 5 seconds.

Example answer:

```json
{
	"data": {
		"weather": "rain",
		"temperature": 18
	}
}
```

All possible values ​​of **weather**:

- clear
- fog
- rain
- snow

Other:

- Weather and temperature values ​​change every 5 seconds.
- Weather change chance: 30%.
- Temperature can change by ±2 degrees with each update.