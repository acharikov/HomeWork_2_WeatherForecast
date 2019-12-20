//
//  ScrollLocationsView.swift
//  Weather
//
//  Created by admin on 18.12.2019.
//  Copyright © 2019 AndreyChar. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct ScrollLocationsView: UIViewRepresentable {
    
    @Binding var locations: [Location]
    @Binding var currentLocation: Location
    
    let locationViewWidth: Int = {
        Int(UIScreen.main.bounds.width)
    } ()
    
    func makeCoordinator() -> () {}
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<ScrollLocationsView>) {}
    
    func makeUIView(context: Context) -> UIView {

        let container = UIView()
        
        let scrollView = ScrollLocationsViewUIKit()
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: self.locationViewWidth * locations.count, height: 40)
        scrollView.delegate = scrollView
        
        addLocationsSubviewsTo(scrollView: scrollView)
        
        scrollView.onPageChange = { newPageIndex in
            self.currentLocation = self.locations[newPageIndex]
        }
        
        container.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: container.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: container.rightAnchor)
        ])
        
        return container
    }
    
    private func addLocationsSubviewsTo(scrollView: UIScrollView) {
       
        locations.enumerated().forEach { (idx, location) in
            let label = UILabel()
            label.frame = CGRect(x: idx * self.locationViewWidth, y: 0, width: self.locationViewWidth, height: 40)
            label.font = .systemFont(ofSize: 22)
            label.text = location.name
            label.textAlignment = .center
            scrollView.addSubview(label)
            label.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        }
        
    }
}

class ScrollLocationsViewUIKit: UIScrollView, UIScrollViewDelegate {
    
    var onPageChange: ((Int) -> ())?

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        onPageChange?(scrollView.currentPageIndex)
    }
}
