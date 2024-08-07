//
//  SwiftDataManager.swift
//  PinBI
//
//  Created by Syuhada Rantisi on 06/08/24.
//

import Foundation
import SwiftData
//import SwiftUI

class SwiftDataManager: DocumentServiceProtocol {
    
//    @Query private var documents: [Document]
//    @Environment(\.modelContext) private var context
    var documents:[Document]
    
    init(){
        self.documents = [Document]()
    }
    
    func getAllDocuments() -> [Document] {
        return self.documents
    }
    
    func getDocumentByID(id: UUID) -> Document {
        return self.documents[0]
    }
    
    func saveDocument(document: Document) {
        
    }
    
    func updateDocument(id: UUID, document: Document) {
        
    }
    
    func deleteDocument(id: UUID) {

    }
}
