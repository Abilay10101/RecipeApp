//
//  NetworkRequests.swift
//  RecipeApp
//
//  Created by Arip Khozhbanov on 25.01.2023.
//

import Foundation
import Alamofire

class NetworkRequests {
    
    static func sendRequest(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        /*request(url).responseJSON { (response) in
            print(response)
        }*/
        
        request(url).responseJSON { (response) in
            print(response)
        }
        
    }
    
}
