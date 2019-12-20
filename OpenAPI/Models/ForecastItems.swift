//
// Model200.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ForecastItem: Codable, Identifiable {
    
    /** Time of data calculation, unix, UTC */
    public var dt: Int?
    public var main: Main?
    public var weather: [Weather]?
    /** Visibility, meter */
    public var visibility: Int?
    public var wind: Wind?
    public var clouds: Clouds?
    
    public init(main: Main?, weather: [Weather]?, visibility: Int?, wind: Wind?, clouds: Clouds?, dt: Int?) {
        self.weather = weather
        self.main = main
        self.visibility = visibility
        self.wind = wind
        self.clouds = clouds
        self.dt = dt
    }
}

public struct ForecastItems: Codable {

    public var cod: String?
    public var list: [ForecastItem]?
    

    public init(cod: String?, list: [ForecastItem]?) {
        self.cod = cod
        self.list = list
    }
}

extension ForecastItem {
    
    public var id: Int {
        return dt ?? 0
    }
    
    public var temp: String {
        return String(
                    Int(
                        lroundf(
                            kelvinToCelsius(Float(main?.temp ?? 0.0))
                        )
                    )
                ) + "°"
    }
    
    public var description: String {
        guard let weather = self.weather, self.weather!.count > 0 else { return "" }
        return weather[0].description ?? ""
    }
    
    public var date: String {
        guard let dt = self.dt else { return "" }
        return unixTimeToString(dt)
    }
    
    public var iconURL: String {
        guard let weather = self.weather, self.weather!.count > 0, let iconUrl = weather[0].icon else { return "" }
        return "http://openweathermap.org/img/wn/\(iconUrl).png"
    }
}
