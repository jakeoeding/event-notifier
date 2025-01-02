# event-notifier

## Motivation
Living near an event center has some perks, such as being able to walk to concerts and sporting events and not having to pay for parking. It also has some drawbacks, mainly, excessive extra traffic on days of events.

Enter `event-notifier`. This project aims to send a daily notification with the local events and their starting times each morning. This allows one to plan ahead and mitigate the effects of the extra traffic.

## Overview
This project works by requesting the event data from the event center's website. It uses a service called [Pushover](https://pushover.net/) to send push notifications with the daily event schedule. The daily job is scheduled via Github Actions.

## Dependencies
This project has the following dependencies to run locally:
- Docker
- docker compose
- A Pushover account

## Setup
Copy the override example file.
```bash
cp docker-compose.override.yml.example docker-compose.override.yml
```
Update the `PUSHOVER_USER_KEY` and `PUSHOVER_API_TOKEN` environment variables accordingly.

Build the project
```bash
docker compose build
```

## Usage
Executing the program locally is as simple as:
```bash
docker compose run --rm app
```
