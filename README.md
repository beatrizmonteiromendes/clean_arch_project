# Concerts Project

A Flutter project to track weather in a fashion manner for a rock'n'roll band staff.

The band staff needs to track the current weather and the forecast for the 5 next days of the main cities where shows of the tour are taking place:

Silverstone, UK
São Paulo, Brazil
Melbourne, Australia
Monte Carlo, Monaco

## Clean Archicture

<img width="866" alt="image" src="https://github.com/beatrizmonteiromendes/clean_arch_project/assets/78861681/8ccf67a2-c2f9-47d0-9222-5d0313b824f9">

## Features
This application has the following features

A list of cities for upcoming concerts
Search functionality (Find by city name)
Offline support using Hive (works with airplane mode)
Cross-platform (tested on Pixel 6a, iPhone 15 Pro and iPad Pro)
Support for multiple resolutions and sizes (tested on Pixel 4 and Pixel C Tab)
Shows current weather info for each city
Shows the next 5 days forecast for each city

## Configuring Environment Variables
This project utilizes environment variables to manage configuration settings. I use Envied to handle environment variable management.

To set up the required environment variables for this project, please refer to the Envied documentation:

Visit the Envied package documentation on pub.dev. Follow the instructions provided in the documentation to install and configure Envied for your development environment. Envied simplifies the management of environment variables and ensures consistent and secure handling of sensitive information. Make sure to set the required environment variables as specified in the project's configuration files.

For more information on how to work with environment variables in this project, please consult the documentation provided by Envied.

NOTE: You need to set up Envied before running the project else you'll get errors.

## Getting Started
1. Clone the Repository: Open your terminal and clone 

2. Navigate to the Project Folder: Change your working directory to the project folder

3. Install the Dependencies: Install the project's dependencies using pub (Dart Package Manager):

$ flutter pub get

4. Run the Application: 

$ flutter run

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
