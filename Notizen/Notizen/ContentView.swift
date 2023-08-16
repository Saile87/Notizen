//
//  ContentView.swift
//  Notizen
//
//  Created by Elias Breitenbach on 09.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var notizen: [String] = ["Staub Saugen", "Einkaufen", "Aufräumen"]
    @State private var notiz = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(notizen, id: \.self) { notiz in
                        Text(notiz)
                    }
                    .onDelete(perform: { indexSet in
                        notizen.remove(atOffsets: indexSet)
                    })
                }
                .navigationTitle("Notizen")
                HStack {
                    TextField("Neue Notiz", text: $notiz)
                    Button("Hinzufügen") {
                        notizen.append(notiz)
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
    }
}
