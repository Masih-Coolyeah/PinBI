//
//  EditorDetailView.swift
//  PinBI
//
//  Created by Syuhada Rantisi on 05/08/24.
//

import SwiftUI
import SwiftData

struct EditorDetailView: View {
    @Environment(\.modelContext) private var context
    @ObservedObject var document: Document
    @FocusState private var contentEditorInFocus: Bool
    

    var body: some View {
        VStack(alignment: .leading) {
//            TextField("Title", text: $document.title, axis: .vertical)
//                .font(.title.bold())
//                .submitLabel(.next)
//                .onChange(of: document.title) {
//                    try? context.save()
//                }

                
            TextEditor(text: $document.correctText)
                .scrollDisabled(true)
                .font(.title3)
                .focused($contentEditorInFocus)
                .onChange(of: document.correctText) {
                    try? context.save()
                }
        }
        
    }
}

#Preview {
//    ContentView()
    EditorDetailView(document: Document(title: "Contoh Doc", date: Date(), mistakeList: [], correctText: "Ini isi", listText: []))
}
