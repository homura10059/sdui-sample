//
//  ContentView.swift
//  SduiSwift
//
//  Created by 大村勇人 on 2024/05/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    private var client = APIClient(endpointURL: "http://localhost:4000/")
    @State private var sections: [Section] = []

    var body: some View {
        List(sections, id: \.self) { section in
            SectionView(section: section)
        }
            .onAppear(perform: {
            Task {
                sections = try await client.allSections()
            }
        })
    }

}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
