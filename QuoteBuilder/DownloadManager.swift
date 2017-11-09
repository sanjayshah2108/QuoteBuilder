//
//  DownloadManager.swift
//  QuoteBuilder
//
//  Created by Sanjay Shah on 2017-11-08.
//  Copyright © 2017 Sanjay Shah. All rights reserved.
//

import Foundation
import UIKit

public class DownloadManager {

    static let theDowloadManager = DownloadManager()
    public var lastQuote = Quote()
    public var lastPhoto = UIImage()

    
    class func downloadJsonAtURL (urlString : String){
        theDowloadManager.dowloadJsonAtURL(url: urlString)
    }
    
    class func downloadImageAtURL (urlString: String){
        theDowloadManager.downloadImageAtURL(url: urlString)
    }
    
    
    func downloadImageAtURL(url: String) {
        
        let theURL = URL(string: url)
        let data: Data
        do {
            data = try Data.init(contentsOf: theURL!)
        }
        catch {
                print("error downloading image")
                return
        }
        
        let newPhoto = Photo()
        newPhoto.photo = UIImage(data:data)
        self.lastPhoto = newPhoto.photo!
        
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
            
            let newQuote = Quote()
                
                newQuote.quoteAuthor = json["quoteAuthor"]!
                newQuote.quoteQuote = json["quoteText"]!
            
            self.lastQuote = newQuote
                
          //  }
        })
        
        dataTask.resume()
    }
}





