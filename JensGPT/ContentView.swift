//
//  ContentView.swift
//  JensGPT
//
//  Created by Jens Vanderhaeghe on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var input: String = "";
    var body: some View {
        VStack {
            Spacer()
            TextField("foo",text: $input)
            Text(input)
            Button(action: {
                self.input = "";
            }, label: {
                Text("Ask")
            }).keyboardShortcut(.defaultAction)
            
        }
        .padding()
        .background(
            .thinMaterial
        )
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
