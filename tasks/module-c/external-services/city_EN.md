# City API

An API for obtaining city traffic status.

Available by address: `https://api.ts2025.com`

## Endpoint

/external-services/city - Returns the current congestion level and color scale.

Response example:

```json
{
	"data": {
		"color_scale_of_corks": "yellow",
		"number_scale": 57
	}
}
```

All possible values ​​of **color_scale_of_corks**:

- green
- yellow
- red
- black

Other:

- Indicators are updated every 5 seconds.
- Traffic condition change probability: 30%.