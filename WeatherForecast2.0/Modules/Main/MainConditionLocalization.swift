//
//  MainConditionLocalization.swift
//  WeatherForecast2.0
//
//  Created by Роман Мироненко on 05.02.2021.
//

import Foundation

extension MainViewController {
    enum ConditionLocalization: String {
        case clear = "clear"
        case partlyCloudy = "partly-cloudy"
        case cloudy = "cloudy"
        case overcast = "overcast"
        case drizzle = "drizzle"
        case lightRain = "light-rain"
        case rain = "rain"
        case moderateRain = "moderate-rain"
        case heavyRain = "heavy-rain"
        case continuousHeavyRain = "continuous-heavy-rain"
        case showers = "showers"
        case wetSnow = "wet-snow"
        case lightSnow = "light-snow"
        case snow = "snow"
        case snowShowers = "snow-showers"
        case hail = "hail"
        case thunderstorm = "thunderstorm"
        case thunderstormWithRain = "thunderstorm-with-rain"
        case thunderstormWithHail = "thunderstorm-with-hail"
        case overcastAndLightSnow = "overcast-and-light-snow"
        
        var localization: String {
            switch self {
            case .clear:
                return "ясно"
            case .partlyCloudy:
                return "малооблачно"
            case .cloudy:
                return "облачно с прояснениями"
            case .overcast:
                return "пасмурно"
            case .drizzle:
                return "морось"
            case .lightRain:
                return "небольшой дождь"
            case .rain:
                return "дождь"
            case .moderateRain:
                return "умеренно сильный дождь"
            case .heavyRain:
                return "сильный дождь"
            case .continuousHeavyRain:
                return "длительный сильный дождь"
            case .showers:
                return "ливень"
            case .wetSnow:
                return "дождь со снегом"
            case .lightSnow:
                return "небольшой снег"
            case .snow:
                return "снег"
            case .snowShowers:
                return "снегопад"
            case .hail:
                return "град"
            case .thunderstorm:
                return "гроза"
            case .thunderstormWithRain:
                return "дождь с грозой"
            case .thunderstormWithHail:
                return "гроза с градом"
            case .overcastAndLightSnow:
                return "пасмурно и легкий снег"
            }
        }
    }
}
