//
//  LocationsModel.swift
//  Weather
//
//  Created by admin on 17.12.2019.
//  Copyright © 2019 AndreyChar. All rights reserved.
//

import Foundation
import Combine

final class LocationsModel: ObservableObject {
    
    @Published var locations = [Location(name: "Moscow"),
                                Location(name: "London"),
                                Location(name: "Berlin"),
                                Location(name: "Paris"),
                                Location(name: "Barcelona"),
                                Location(name: "Tokio")]
    
    func load() {
        // TODO
    }
    
    static var defaultLocation: Location {
        Location(name: "Moscow")
    }
    
}

