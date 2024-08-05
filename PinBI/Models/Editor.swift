//
//  Editor.swift
//  PinBI
//
//  Created by Syuhada Rantisi on 05/08/24.
//

import Foundation
import SwiftData

class Editor {
    var title: String
    var date: Date
    var mistakeList: [MistakeList]
    var correctText: String
    var listText: [String]
    
    init(title: String, date: Date, mistakeList: [MistakeList], correctText: String, listText: [String]) {
        self.title = title
        self.date = date
        self.mistakeList = mistakeList
        self.correctText = correctText
        self.listText = listText
    }
}

