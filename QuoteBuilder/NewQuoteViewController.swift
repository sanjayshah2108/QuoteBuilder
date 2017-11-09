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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func newImageButton(_ sender: UIButton) {
        
       // self.imageView = downlaoded image
        
        
    }
    
    
    @IBAction func newQuoteButton(_ sender: UIButton) {
        
        DownloadManager.downloadJsonAtURL(urlString: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
        
        DispatchQueue.main.async() {

        self.quoteLabel.text = DownloadManager.newQuote.quoteQuote
        
        self.authorLabel.text = DownloadManager.newQuote.quoteAuthor
            
       
        }
    }
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        NewQuoteViewController.quotesArray.append(DownloadManager.newQuote)
    }
    
    
    
    
    

}
