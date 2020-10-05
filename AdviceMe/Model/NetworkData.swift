//
//  NetworkData.swift
//  AdviceMe
//
//  Created by ODM on 7/19/20.
//  Copyright © 2020 ODM. All rights reserved.
//

import Foundation

class NetworkData: ObservableObject {

    @Published var feedback = ""

    func fetchData() {
        if let url = URL(string: "https://api.adviceslip.com/advice") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){(data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let adviceresults = try decoder.decode(AdviceResult.self, from: safeData)
                            DispatchQueue.main.async {
                                //print(adviceresults.slip.advice)
                                let word = adviceresults.slip.advice
                                self.feedback = word
                                //print(self.feedback)
                            }
                        } catch {
                            print("this is an error \(error)")
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
