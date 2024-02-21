//
//  Double+ext.swift
//  SapceX_Cansu
//
//  Created by Cansu Kahraman on 6.02.2024.
//

import Foundation

extension Double {
    func unixToDate() -> Date {
        Date(timeIntervalSince1970: self)
    }
}
