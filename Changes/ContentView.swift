//
//  ContentView.swift
//  Changes
//
//  Created by Federico on 28/02/2022.
//

import SwiftUI

struct ContentView: View {
   @State private var text: String = ""
   @State private var color: Color = Color.black
   @State private var count: Int = 0
   
   var body: some View {
      ZStack {
         HStack {
            TextField("Enter some text", text: $text)
               .onChange(of: text) { text in
                  let letters = text.trimmingCharacters(in: .whitespaces).count
                  self.count = letters
                  
                  switch letters {
                  case 1..<10:
                     self.color = .red
                  case 10..<20:
                     self.color = .orange
                  case 20...:
                     self.color = .green
                  default:
                     self.color = .black
                  } 
               }
               .foregroundColor(color)
            
            
            Text("\(count)")
               .bold()
               .foregroundColor(.gray)
         }
         .padding()
         .overlay(
            RoundedRectangle(cornerRadius: 30)
            .stroke(color, lineWidth: 5)
         )
         .padding()
      }
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
