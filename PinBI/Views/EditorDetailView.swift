//
//  EditorDetailView.swift
//  PinBI
//
//  Created by Syuhada Rantisi on 05/08/24.
//

import SwiftUI

struct EditorDetailView: View {
    @Environment(\.modelContext) private var context
    @Binding var content: String
    @ObservedObject var document: Document
    @FocusState private var contentEditorInFocus: Bool

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                                
                TextField("Title", text: $document.title, axis: .vertical)
                    .font(.title.bold())
                    .submitLabel(.next)
                    .onChange(of: document.title) {
                        try? context.save()
                    }
                    
                TextEditor(text: $content)
                    .scrollDisabled(true)
                    .font(.title3)
                    .focused($contentEditorInFocus)
                    

            }
            .padding(10)
        }
        
    }
}

#Preview {
    ContentView()
}
