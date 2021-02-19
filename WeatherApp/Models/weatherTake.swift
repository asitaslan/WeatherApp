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
    let latitude, longitude: Double?
    let timezone: String?
    let currently: Currently?
    let minutely: Minutely?
    let hourly: Hourly?
    let daily: Daily?
    let flags: Flags?
    let offset: Int?
}

// MARK: - Currently
struct Currently: Codable {
    let time: Int?
    let summary: String?
    let icon: String?
    let nearestStormDistance, nearestStormBearing: Int?
    let precipIntensity, precipProbability, temperature, apparentTemperature: Double?
    let dewPoint, humidity, pressure, windSpeed: Double?
    let windGust: Double?
    let windBearing: Int?
    let cloudCover: Double?
    let uvIndex, visibility: Int?
    let ozone: Double?
    let precipType: String?
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
    case possibleLightRain = "Possible Light Rain"
}

// MARK: - Daily
struct Daily: Codable {
    let summary: String?
    let icon: String?
    let data: [DailyDatum]?
}

// MARK: - DailyDatum
struct DailyDatum: Codable {
    let time: Int?
    let summary, String: String?
    let sunriseTime, sunsetTime: Int?
    let moonPhase, precipIntensity, precipIntensityMax: Double?
    let precipIntensityMaxTime: Int?
    let precipProbability: Double?
    let precipType: String?
    let temperatureHigh: Double?
    let temperatureHighTime: Int?
    let temperatureLow: Double?
    let temperatureLowTime: Int?
    let apparentTemperatureHigh: Double?
    let apparentTemperatureHighTime: Int?
    let apparentTemperatureLow: Double?
    let apparentTemperatureLowTime: Int?
    let dewPoint, humidity, pressure, windSpeed: Double?
    let windGust: Double?
    let windGustTime, windBearing: Int?
    let cloudCover: Double?
    let uvIndex, uvIndexTime: Int?
    let visibility, ozone, temperatureMin: Double?
    let temperatureMinTime: Int?
    let temperatureMax: Double?
    let temperatureMaxTime: Int?
    let apparentTemperatureMin: Double?
    let apparentTemperatureMinTime: Int?
    let apparentTemperatureMax: Double?
    let apparentTemperatureMaxTime: Int?
}

// MARK: - Flags
struct Flags: Codable {
    let sources: [String]?
    let nearestStation: Double?
    let units: String?

    enum CodingKeys: String, CodingKey {
        case sources
        case nearestStation = "nearest-station"
        case units
    }
}

// MARK: - Hourly
struct Hourly: Codable {
    let summary: String?
    let icon: String?
    let data: [Currently]?
}

// MARK: - Minutely
struct Minutely: Codable {
    let summary: String?
    let icon: Icon?
    let data: [MinutelyDatum]?
}

// MARK: - MinutelyDatum
struct MinutelyDatum: Codable {
    let time, precipIntensity, precipProbability: Int?
}
