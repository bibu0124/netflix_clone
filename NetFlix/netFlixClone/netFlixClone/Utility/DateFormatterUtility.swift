//
//  DateFormatterUtility.swift
//  netFlixClone
//
//  Created by duynt0124 on 09/09/2023.
//

import Foundation
class DateFormatterUtility {
    static func formatDateString(inputDateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        
        
        // Attempt to parse the date with day as a single digit
        if let date = dateFormatter.date(from: inputDateString) {
            dateFormatter.dateFormat = "yyyy, d MMMM"
            return dateFormatter.string(from: date)
        } else {
            dateFormatter.dateFormat = "dd MMMM yyyy"
            if let date = dateFormatter.date(from: inputDateString) {
                dateFormatter.dateFormat = "yyyy, dd MMMM"
                return dateFormatter.string(from: date)
            }else{
                return "Invalid Date"
            }
                
            
            
            
        }
        
        // If parsing with a single digit day fails, try parsing with two digits (e.g., "31" as well)
        
        
    }
}
