//
//  MistakeList.swift
//  PinBI
//
//  Created by Syuhada Rantisi on 05/08/24.
//

import Foundation
import SwiftData

@Model
class MistakeList: ObservableObject, Identifiable {
    var capital: Int
    var dot: Int
    var coma: Int
    var standardWord: Int
    var document: Document
    
    init(capital: Int, dot: Int, coma: Int, standardWord: Int, document: Document) {
        self.capital = capital
        self.dot = dot
        self.coma = coma
        self.standardWord = standardWord
        self.document = document
    }
    
}
