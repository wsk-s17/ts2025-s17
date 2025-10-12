# OAuth Service

This server implements the basic OAuth 2.0 Authorization Code Flow and UserInfo (OpenID Connect) model.

Available by address: `https://oauth.ts2025.com`

## Endpoints

| Title     | URL               |
|-----------|-------------------|
| Auth      | GET - /authorize |
| Get token | POST - /token     |
| Get user  | GET - /userinfo   |

## Register Admin

Before creating an app, you need to register for the app at `/auth/register`. All fields are required.

You can then log in to your account at `/auth/login`.

## Create App

All applications are located on the main page.

There you can view your registered clients (name, client_id, client_secret, redirect_uri) and register a new application.

`redirect_uri` is the address to which the server will redirect after successful authorization with the `code` query parameter, which is used to obtain a token.

## Auth Users

Now your application can direct the user to authorization:

```bash
	https://oauth.ts2025.com/authorize?
		response_type=code&
		client_id=YOUR_CLIENT_ID&
		scope=openid
```

After this, the user will be redirected to the login page.

After logging in, they will see the agreement page.

After clicking **Allow**, the server will redirect the user to your redirect_uri, adding the following parameters: `?code=...`.

## Transfer code to token

After receiving the `code`, your application (server side) should make a POST request to `/token` with the body:

- client_id=YOUR_CLIENT_ID&
- client_secret=YOUR_CLIENT_SECRET&
- grant_type=authorization_code&
- code=CODE

Get this data later:

```json
{
	"access_token": "..."
}
```

## Get user data

Use the access token to request user data.

Pass the access token in the **Authorization** header with the **Bearer** prefix.