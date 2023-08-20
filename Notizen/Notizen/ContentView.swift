//
//  ContentView.swift
//  Notizen
//
//  Created by Elias Breitenbach on 09.08.23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.inhalt, order: .reverse)
    ]) var meineNotizen: FetchedResults<MyNotiz>
    @State var notiz = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(meineNotizen) { notiz in
                        Text(notiz.inhalt ?? "Eroor")
                    }
                    .onDelete(perform: { indexSet in
                       
                    })
                }
                .navigationTitle("Notizen")
                HStack {
                    TextField("Neue Notiz", text: $notiz)
                    Button("Hinzufügen") {
                        let neueNotiz = MyNotiz(context: moc)
                        neueNotiz.id = UUID()
                        neueNotiz.inhalt = notiz
                        
                        try? moc.save()
                        
                        notiz = ""
                    }
                } .padding(.horizontal)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, ControlData(name: "Model").container.viewContext)
    }
}

