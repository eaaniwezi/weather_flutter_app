# weather_flutter_app

Эммануэль Анинвэзи

Мобильное тестовое задание (Флаттер)

Описание
Создано мобильное приложение "Погода", используемое для проверки текущей информации о погоде в любом городе, а также показывает почасовой прогноз, а также ежедневный прогноз на 7 дней.
Используемый стек; 
    Flutter (фреймворк),
    Bloc (для управления состоянием),
    HTTP (связь с API REST),
    Flutter Secure Storage (для хранения данных)
    Get library (для навигации)

Подготовительное действие; Вам нужно будет подключить приложение с помощью КЛЮЧА API;
                    Посещение "https://home.openweathermap.org/api_keys " для создания/генерации ключа api.
                    После чего перейдите в класс WeatherRepository: lib>repository>weather_repository.dart и вставьте сгенерированный КЛЮЧ API в переменной apiKey
                    например) static const apiKey = "xxxxxxxxxxxxxxxxxxxxxxxx";
                    После чего нажмите, чтобы сохранить, а затем введите "flutter pub get", на терминале чтобы получить пакеты.

Как запустить приложение; Если вы новичок в flutter,
                    посетите "https://docs.flutter.dev/get-started/install/windows " для правильного руководства по настройке и запуску приложения flutter.

Emmanuel Aninwezi

Mobile test task (Flutter)

Description
Built a weather mobile app, Used in checking the current weather details of any city and also, it shows an hourly forecast as well as a daily forecast for the 7days.
Stack Used; 
    Flutter(Framework),
    Bloc(to manage state),
    HTTP(commnuicate with REST API),
    Flutter Secure Storage(to store data)
    Get library(for navigation)

Prepartory action; You will need to connect the app with an APIKEY;
                    Visit "https://home.openweathermap.org/api_keys" to create/generate an apiKey.
                    Afterwhich, go the WeatherRepository class: lib>repository>weather_repository.dart and put in the generated APIKEY in the vairable apiKey, 
                    eg) static const apiKey = "xxxxxxxxxxxxxxxxxxxxxxxx";
                    After which, click to save and then type "flutter pub get" on the terminal to get packages.

How to launch the app; If you're new to flutter, 
                        visit "https://docs.flutter.dev/get-started/install/windows" for proper guide on how to setUp and launch a flutter app.
