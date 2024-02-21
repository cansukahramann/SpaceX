//
//  date+Ext.swift
//  SapceX_Cansu
//
//  Created by Cansu Kahraman on 6.02.2024.
//

import Foundation

extension Date {
    func dayMonthYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    func getComponentValue(_ component: Calendar.Component) -> String {
        String(Calendar.current.component(component, from: self))
    }
}
