//
//  ImageView.swift
//  Weather
//
//  Created by admin on 20.12.2019.
//  Copyright © 2019 AndreyChar. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

final class Loader: ObservableObject {
    
    var task: URLSessionDataTask!
    @Published var data: Data? = nil
    
    init(_ url: URL) {
        task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            DispatchQueue.main.async {
                self.data = data
            }
        })
        task.resume()
    }
    deinit {
        task.cancel()
    }
}

let placeholder = UIImage(named: "placeholder.png")!

struct AsyncImageView: View {
    init(url: String) {
        if let imageUrl = URL(string: url) {
            self.imageLoader = Loader(imageUrl)
        } else {
            self.imageLoader = Loader(URL(string: "http://openweathermap.org/img/wn/50n.png")!)
        }
    }
    
    @ObservedObject private var imageLoader: Loader
    
    var image: UIImage? {
        imageLoader.data.flatMap(UIImage.init)
    }
    
    
    var body: some View {
        Image(uiImage: image ?? placeholder)
    }
}
