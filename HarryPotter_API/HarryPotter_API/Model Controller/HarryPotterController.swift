//
//  HarryPotterController.swift
//  HarryPotter_API
//
//  Created by julia rodriguez on 6/26/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import Foundation

class HarryPotterController {
    
    static let sharedInstance = HarryPotterController()
    
    func fetchCharacters(searchTerm: String, completion: @escaping (TopLevelDict?) -> Void) {
        
        // Build URL
        let baseURL = URL(string: "https://www.potterapi.com/v1")
        
        guard let finalURL = baseURL?.appendingPathComponent("characters") else { completion(nil); return }
        
        var components = URLComponents(url: finalURL, resolvingAgainstBaseURL: true)
        
        let apiKeyQuery = URLQueryItem(name: "key", value: "$2a$10$RQN.savznIuQvIFWtKNL..oEmYMmqRtpsVEfS78oRr.qhBf0H1GXC")
        
        let nameQuery = URLQueryItem(name: "name", value: searchTerm)
        
        components?.queryItems = [apiKeyQuery, nameQuery]
        
        guard let url = components?.url else { return }
        print(url)
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            // Handle the Error
            if let error = error {
                print("There was an error \(error.localizedDescription)")
            }
            // Check if there's data
            if let data = data {
                // decode the data
                do {
                    // Handle the data
                    let character = try JSONDecoder().decode([TopLevelDict].self, from: data)
                    completion(character.first)
                } catch {
                    print("Error Fetching Character!")
                    completion(nil);return
                }
            }
        }.resume()
    }
    
}
