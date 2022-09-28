//
//  ContentView.swift
//  TempConverterApp
//
//  Created by Angela Chen on 9/14/22.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewController = ViewController()
  @State var inputTemp: String = ""
  
    var body: some View {
      //  Text("Hello, world!")
        //    .padding()
      NavigationView {
      
        ZStack {
          Color.blue.edgesIgnoringSafeArea(.all).opacity(0.7)
          LinearGradient(
            gradient: Gradient(colors: [Color.white, Color.gray]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
          .edgesIgnoringSafeArea(.all)
          .opacity(0.45)
          VStack {
            Spacer()
            //HStack {
              //Text("Temp")
              //Text("ºF")
            //}
            if viewController.isConvertingCtoF {
              Text("\(viewController.convertedTempString) ºF")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            } else {
              Text("\(viewController.convertedTempString) ºC")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            }
            Spacer()
            Text("Enter Temperature:")
            HStack {
              TextField("Temp", text:$inputTemp).frame(width: 90.0).multilineTextAlignment(.center).border(Color.white)

              if viewController.isConvertingCtoF {
                Text("ºC")
              } else {
                Text("ºF")
              }
            }
            Spacer()
            HStack(alignment: .center) {
              Text("ºF -> ºC")
                .fontWeight(.thin)
              Toggle(isOn: $viewController.isConvertingCtoF) {
                Text("")
              }
              .labelsHidden()
              .frame(width: 50)
              .padding()
              Text("ºC -> ºF")
               .fontWeight(.thin)
            }
            .padding()
            Button(action: {
              viewController.setInputTempString(_temperature: self.inputTemp)
              //?update the values in our instance of ViewController() from the TextField
              viewController.convert()
              
            }) { //?step 4 part 4
              Text("Convert")
            }.padding(.all)
              .background(Color.white)
              .cornerRadius(15.0)
            Spacer()
            NavigationLink(destination: InfoView()) {
              Image(systemName: "info.circle")
                .foregroundColor(.white)
            }
            .padding(.bottom, 50)
          }
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
