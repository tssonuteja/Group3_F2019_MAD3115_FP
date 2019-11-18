//
//  Date.swift
//  Group3_F2019_MAD3115_FP
//
//  Created by Sai Teja on 2019-11-17.
//  Copyright © 2019 Sai Teja. All rights reserved.
//

import Foundation
extension Date
{
    
    func dateformatter() -> String {
        let dateFormatterPrint=DateFormatter()
        dateFormatterPrint.dateFormat="dd MMM yyyy"
        let formattedDate = dateFormatterPrint.string(from: self)
        return formattedDate
        
    }
    

}
