//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Ty Tran on 11/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var names : [String] = []
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        
        VStack {
            
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title)
                .bold()
                .foregroundStyle(.tint)
            
            List{
                ForEach(names, id: \.description) { name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            
            TextField("Add Name", text: $nameToAdd) // '$' symbol represents a binding to a variable
                .autocorrectionDisabled()
                .onSubmit{
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            //Toggles are similar to text fields; both require a single binding. Because a toggle controls an on/off state, its binding is a Bool.
            
            
            Button {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        names.removeAll {
                            name in return (name == pickedName)
                        }
                    }
                } else {
                    pickedName = ""
                }
            } label: {
                Text("Pick Random name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
            //This initializer for Button has two closures — one for the action and one for the label. The action closure contains imperative code, and the label closure contains declarative view code.
        }
        .padding()
     
    }
}

#Preview {
    ContentView()
}
