//
//  Utils.swift
//  Weather
//
//  Created by admin on 19.12.2019.
//  Copyright © 2019 AndreyChar. All rights reserved.
//

import Foundation

func unixTimeToString(_ unixTime: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    return dateFormatter.string(from: date)
}

func fahrenheitToCelsius(_ value: Float) -> Float {
   return (5/9) * (value-32);
}

func kelvinToCelsius(_ value: Float) -> Float {
   return value - 273;
}
