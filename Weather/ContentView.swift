//
//  ContentView.swift
//  Weather
//
//  Created by admin on 17.12.2019.
//  Copyright © 2019 AndreyChar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var locationsModel: LocationsModel    
    @ObservedObject var forecastModel: WeatherModel = WeatherModel()
    
    init() {
        forecastModel.loadPage()
    }
    
    var body: some View {
        Group {
            if forecastModel.items.count > 0 {
                List {
                    ForEach(forecastModel.items) { dayForecast in
                        VStack {
                            HStack {
                                Text(dayForecast.date).frame(maxWidth: .infinity, alignment: .leading)
                                VStack {
                                    HStack {
                                        AsyncImageView(url: dayForecast.iconURL)
                                        Text(dayForecast.temp).frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    Text(dayForecast.description).frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            if self.forecastModel.isNewPageLoading && self.forecastModel.items.isLastItem(dayForecast) {
                                Divider()
                                Text("Loading...")
                            }
                        }.padding(4).onAppear {
                            self.onItemShowed(dayForecast)
                        }
                    }
                }
            } else {
                Text("Loading forecast...")
            }
            Spacer()
            Divider()
            if locationsModel.locations.count > 0 {
                ScrollLocationsView(locations: $locationsModel.locations, currentLocation: $forecastModel.currentLocation)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80, maxHeight: 80, alignment: .bottom)
            } else {
                Text("Loading locations...")
            }
        }.padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
    }
}

extension ContentView {
    private func onItemShowed<T:Identifiable>(_ item: T) {
        // Load
        if self.forecastModel.items.isLastItem(item) {
            self.forecastModel.loadPage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
