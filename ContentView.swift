//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Ty Tran on 11/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var names : [String] = ["Elisha", "Andre", "Jasmine", "Po-Chun"]
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    
    var body: some View {
        
        VStack {
            
            Text(pickedName.isEmpty ? "" : pickedName)
            
            List{
                ForEach(names, id: \.description) { name in
                    Text(name)
                }
            }
            
            TextField("Add Name", text: $nameToAdd) // '$' symbol represents a binding to a variable
                .autocorrectionDisabled()
                .onSubmit{
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    
                    }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
