# Flutter authentication using Google and Supabase

This is an example Flutter application that implements an authentication flow by using Google and Supabase packages.

![Alt text](<authentication flow.png>)

## Getting Started

To run the project, you need to complete the [overview](https://supabase.com/docs/guides/auth/social-login/auth-google?platform=flutter#overview) steps to configure your supabase project.
Then you will need to setup a new `.env` **folder** and a `dev.json` **file** inside this with the following values:

```json
{
    "SUPABASE_URL": "https://<supabase_project_id>.supabase.co",
    "SUPABASE_ANON": "<supabase_anon>",
    "GOOGLE_WEB_CLIENT_ID": "<web_client_id>.apps.googleusercontent.com"
}
```

## To run the project

Once you have the previous step, run the following command and then select the desired device

```bash
flutter run --dart-define-from-file=.env/dev.json --web-port=3000
```