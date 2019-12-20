//
//  WeatherModel.swift
//  Weather
//
//  Created by admin on 17.12.2019.
//  Copyright © 2019 AndreyChar. All rights reserved.
//

import Foundation
import Combine

final class WeatherModel: ObservableObject {
    
    private let appKey = "be268f54f65d62723914517f5d4203af"
    private let pageLimit = 20
    
    @Published var currentLocation: Location {
        didSet {
            self.items.removeAll()
            loadPage()
        }
    }
    
    @Published var items: [ForecastItem] = [ForecastItem]()
       
    @Published var pageIndex: Int = 1
    
    @Published var isNewPageLoading = false
    
    init() {
        currentLocation = LocationsModel.defaultLocation
    }
     
    func loadPage() {
        
        guard isNewPageLoading == false else {
            return
        }
        
        let countOfItems = self.pageIndex * pageLimit
        
        isNewPageLoading = true
        self.pageIndex += 1
        
        ForecastDataAPI.forecastData(q: currentLocation.name, lang: .ru, appKey: appKey, count: countOfItems) { [weak self] (info, error) in
            if let info = info {
                self?.items.removeAll()
                self?.items.append(contentsOf: info.list!)
                self?.isNewPageLoading = false
            }
        }
    }
    
}
