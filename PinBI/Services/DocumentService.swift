//
//  DocumentService.swift
//  PinBI
//
//  Created by Syuhada Rantisi on 06/08/24.
//

import Foundation

protocol DocumentServiceProtocol {
    func getAllDocuments() -> [Document]
//    func getDocumentByID(id: UUID) -> Document
    func saveDocument(document: Document)
    func updateDocument(id: UUID, document: Document)
    func deleteDocument(id: UUID)
}
