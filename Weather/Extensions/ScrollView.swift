//
//  ScrollView.swift
//  Weather
//
//  Created by admin on 20.12.2019.
//  Copyright © 2019 AndreyChar. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
   var currentPageIndex: Int {
      return Int((self.contentOffset.x + (0.5*self.frame.size.width))/self.frame.width)
   }
}
