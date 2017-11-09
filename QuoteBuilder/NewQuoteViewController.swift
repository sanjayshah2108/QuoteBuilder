//
//  NewQuoteViewController.swift
//  QuoteBuilder
//
//  Created by Sanjay Shah on 2017-11-08.
//  Copyright © 2017 Sanjay Shah. All rights reserved.
//

import UIKit

class NewQuoteViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    static var quotesArray = Array<Quote>()
    
    var currQuote: Quote!
    
    var quoteView: QuoteView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
            // set up view in view hierarchy
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func newImageButton(_ sender: UIButton) {
        
         DownloadManager.downloadImageAtURL(urlString: "https://lorempixel.com/250/500/nature/")
        
        DispatchQueue.main.async() {
            
            self.imageView.image = DownloadManager.theDowloadManager.lastPhoto
   
        }
    }
    
    
    @IBAction func newQuoteButton(_ sender: UIButton) {
        
        DownloadManager.downloadJsonAtURL(urlString: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")

        DispatchQueue.main.async() {
            self.currQuote =  DownloadManager.theDowloadManager.lastQuote
            
          
            self.quoteLabel.text = self.currQuote.quoteQuote
            self.authorLabel.text = self.currQuote.quoteAuthor
            
        }
    }
    
    
    @IBAction func saveButton(_ sender: UIButton) {
       
        self.currQuote?.quotePhoto = self.imageView.image
        NewQuoteViewController.quotesArray.append((self.currQuote))
        
    }
    
    
    
    
    

}
