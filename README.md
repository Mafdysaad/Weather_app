# 🌤 Weather App

A simple weather forecast app built with Flutter, using Cubit for state management and consuming weather data from weatherapi.com via the http package

## 📱 Features
🔍 Search for any city and get current weather

🌡 Shows temperature, humidity, wind speed, and more

🎨 Beautiful and clean UI

🌙 Light/Dark Mode support (if added)

📦 State management using flutter_bloc (Cubit)

## 🏗 Tech Stack
Flutter

Cubit (flutter_bloc)

HTTP package

REST API from weatherapi.com 

## 📁 Folder Structure
bash
نسخ
تحريرlib/
├── Widget/                # Custom reusable widgets
├── cubits/weather_cubit/ # State management logic
├── models/               # Weather data models
├── pages/                # App UI screens
├── provider/             # Logic using Provider (if used)
├── services/             # API services (weather API)
└── main.dart              # App entry point

## 🚀 Getting Started
1- git clone https://github.com/Mafdysaad/Weather_app.git
cd Weather_app

2- Install dependencies
flutter pub get

3- Run the app
flutter run

## 🔑 API Key

This app uses weatherapi.com.
To get it working:

1- Create a free account on weatherapi.com.

2- Get your API key.

3- Replace the placeholder in your code:
 final String apiKey = "YOUR_API_KEY_HERE";
 
## 👤 About Me

Hi, I’m Mafdy Saad, a Computer Science graduate from Egyptian E-Learning University.
I specialize in mobile development with Flutter and enjoy building clean, responsive UIs with solid architecture.

