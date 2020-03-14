# Sweater Weather

## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Installation](#installation)
* [Usage](#usage)

## About the Project

Sweater Weather is a backend-only application developed in Ruby on Rails over the course of 5 days. It is a solo project completed in the final week of Module 3 at Turing School of Software & Design. The application provides weather forecast and travel information for a specified 'road trip' between a starting point and an ending point. Sweater Weather utilizes data retrieved from several APIs (Google, Darksky, Unsplash) and synthesizes the data to be returned to an imaginary frontend. All endpoints exposed by Sweater Weather meet the JSON 1.1 Specification.

### Built With

* Rails
* Ruby
* PostgreSQL

### Utilizes

* FastJsonAPI
* Google Geocoding API
* Google Directions API
* Darsky Forecasts API
* Unsplash API

## Getting Started

Visit the [heroku application](https://sweater-weather-connolly.herokuapp.com) to view the endpoints in production.

To get a local copy up and running follow these simple steps.

### Installation

1. Clone the repo
```sh
git clone git@github.com:dylanconnolly/drinkee-frontend.git
```

2. Install gems
```sh
bundle install
```

3. Create and migrate database
```sh
rake db:{create,migrate}
```

## Usage

There are two endpoints which will expose data to a supposed frontend application and three endpoints which return API keys after a successful POST request is made to the backend application. Two view the JSON data at each endpoint, navigate to the following routes using Postman:

1. Retrieve weather for a given city:
```
GET /api/v1/forecast?location=[city,state]
```
for example, `GET /api/v1/forecast?location=denver,co` will return the forecast for Denver, CO.

2. Retrieve a background image url for a city:
```
GET /api/v1/backgrounds?location=[city,state]
```

3. Create a new user on the backend:
```
POST /api/v1/users
```

POST request body must contain:
```
{
  email: [new_user_email],
  password: [new_user_password],
  password_confirmation: [new_user_password_confirmation]
}
```
for example, if a POST request is made with a body containing
```
{
  email: user@example.com
  password: example1,
  password_confirmation: example1
}
```
the system will verify that the email is not taken and that the password match. If successful, an API key will be sent back for that user, if unsuccessful a `403` status will be returned containing the error message.

4. Authenticate user on backend:
```
POST /api/v1/sessions
```

POST request must contain:
```
{
  email: [user_email],
  password: [user_password]
}
```
the system will then verify if there is a user in the database whose email and password match those credentials. If successful, that user's API key will be returned, if unsuccessful a `401` status will be returned with an error message stating the credentials are bad.

5. Create a new road trip
```
POST /api/v1/road_trip
```
POST request must contain:
```
{
  origin: [city,state]
  destination: [city,state],
  api_key: [user_api_key]
}
```
If the API key is valid, a response will be returned with the forecast at the destination upon arrival as well as the travel time. If the API key is invalid a `401` status will be returned stating the credentials are bad.
