//
//  ContentView.swift
//  AdviceMe
//
//  Created by ODM on 7/19/20.
//  Copyright © 2020 ODM. All rights reserved.
//

import SwiftUI

struct ContentView: View {
        
    @ObservedObject var networkData = NetworkData()

    
    var body: some View {
        ZStack{
            Color.init(red: 171/255, green: 141/255, blue: 210/255)
                .edgesIgnoringSafeArea(.all)
            
            Text(networkData.feedback)
                .font(.largeTitle)
                .padding(.horizontal, 10)
        }
        .onTapGesture {
            self.getData()
        }
        .onAppear{
            self.getData()
        }
    }
    
    func getData(){
        self.networkData.fetchData()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

