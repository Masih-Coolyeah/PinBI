//
//  Editor.swift
//  PinBI
//
//  Created by Syuhada Rantisi on 05/08/24.
//

import Foundation
import SwiftData

@Model
class Document: ObservableObject, Identifiable {
    var id: UUID
    var title: String
    var date: Date
    var mistakeList: [MistakeList]
    var correctText: String
    var listText: [String]
    
    @Relationship(deleteRule: .cascade, inverse: \MistakeList.document)
    init(id: UUID = UUID(), title: String, date: Date, mistakeList: [MistakeList], correctText: String, listText: [String]) {
        self.id = id
        self.title = title
        self.date = date
        self.mistakeList = mistakeList
        self.correctText = correctText
        self.listText = listText
    }
}

