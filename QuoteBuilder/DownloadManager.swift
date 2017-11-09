//
//  DownloadManager.swift
//  QuoteBuilder
//
//  Created by Sanjay Shah on 2017-11-08.
//  Copyright © 2017 Sanjay Shah. All rights reserved.
//

import Foundation
import UIKit

class DownloadManager {

    static let theDowloadManager = DownloadManager()
    static let newQuote = Quote()
    
    
    class func downloadJsonAtURL (urlString : String){
        
        theDowloadManager.dowloadJsonAtURL(url: urlString)
        
    }
    
    
    func dowloadJsonAtURL(url:String) {
        
      
        let theURL = URL(string: url)
        
        
        let session =  URLSession(configuration: URLSessionConfiguration.default)
        
        let dataTask = session.dataTask(with: theURL!, completionHandler: {(data: Data?, response: URLResponse?, error:Error?) -> Void in
            
            guard let data = data else{
                 print("No data, \(String(describing: error?.localizedDescription))")
                return
            }
            
            var jsonObject: Dictionary<String,String>?
            
            do{
                jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? Dictionary <String, String>
                
                
            }
            catch{
                print(error.localizedDescription)
            }
            
            guard let json = jsonObject else{
                print("Error with JSON Object")
                return
                
            }
            
         //   OperationQueue.main.addOperation {
                
                DownloadManager.newQuote.quoteAuthor = json["quoteAuthor"]!
                DownloadManager.newQuote.quoteQuote = json["quoteText"]!
                
          //  }

            
        })
        
        dataTask.resume()
      
    }


}





