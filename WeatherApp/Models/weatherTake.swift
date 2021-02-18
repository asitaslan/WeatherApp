//
//  weatherTake.swift
//  WeatherApp
//
//  Created by Asit Aslan on 18.02.2021.
//  Copyright © 2021 Asit Aslan. All rights reserved.
//



import Foundation

// MARK: - Welcome
struct WeatherTake: Codable {
    let latitude, longitude: Double
    let timezone: String
    let currently: Currently
    let minutely: Minutely
    let hourly: Hourly
    let daily: Daily
    let flags: Flags
    let offset: Int
}

// MARK: - Currently
struct Currently: Codable {
    let time: Int
    let summary: Summary
    let icon: Icon
    let nearestStormDistance: Int?
    let precipIntensity: Double
    let precipIntensityError: Double?
    let precipProbability: Double
    let precipType: Icon?
    let temperature, apparentTemperature, dewPoint, humidity: Double
    let pressure, windSpeed, windGust: Double
    let windBearing: Int
    let cloudCover: Double
    let uvIndex, visibility: Int
    let ozone: Double
}

enum Icon: String, Codable {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case cloudy = "cloudy"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
    case rain = "rain"
}

enum Summary: String, Codable {
    case clear = "Clear"
    case mostlyCloudy = "Mostly Cloudy"
    case overcast = "Overcast"
    case partlyCloudy = "Partly Cloudy"
    case possibleDrizzle = "Possible Drizzle"
    case possibleLightRain = "Possible Light Rain"
}

// MARK: - Daily
struct Daily: Codable {
    let summary: String
    let icon: Icon
    let data: [DailyDatum]
}

// MARK: - DailyDatum
struct DailyDatum: Codable {
    let time: Int
    let summary: String
    let icon: Icon
    let sunriseTime, sunsetTime: Int
    let moonPhase, precipIntensity, precipIntensityMax: Double
    let precipIntensityMaxTime: Int
    let precipProbability: Double
    let precipType: Icon?
    let temperatureHigh: Double
    let temperatureHighTime: Int
    let temperatureLow: Double
    let temperatureLowTime: Int
    let apparentTemperatureHigh: Double
    let apparentTemperatureHighTime: Int
    let apparentTemperatureLow: Double
    let apparentTemperatureLowTime: Int
    let dewPoint, humidity, pressure, windSpeed: Double
    let windGust: Double
    let windGustTime, windBearing: Int
    let cloudCover: Double
    let uvIndex, uvIndexTime, visibility: Int
    let ozone, temperatureMin: Double
    let temperatureMinTime: Int
    let temperatureMax: Double
    let temperatureMaxTime: Int
    let apparentTemperatureMin: Double
    let apparentTemperatureMinTime: Int
    let apparentTemperatureMax: Double
    let apparentTemperatureMaxTime: Int
}

// MARK: - Flags
struct Flags: Codable {
    let sources: [String]
    let nearestStation: Double
    let units: String

    enum CodingKeys: String, CodingKey {
        case sources
        case nearestStation = "nearest-station"
        case units
    }
}

// MARK: - Hourly
struct Hourly: Codable {
    let summary: String
    let icon: Icon
    let data: [Currently]
}

// MARK: - Minutely
struct Minutely: Codable {
    let summary: String
    let icon: Icon
    let data: [MinutelyDatum]
}

// MARK: - MinutelyDatum
struct MinutelyDatum: Codable {
    let time: Int
    let precipIntensity: Double
    let precipIntensityError: Double?
    let precipProbability: Double
    let precipType: Icon?
}

