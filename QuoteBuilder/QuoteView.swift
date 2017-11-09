//
//  QuoteView.swift
//  QuoteBuilder
//
//  Created by Sanjay Shah on 2017-11-08.
//  Copyright © 2017 Sanjay Shah. All rights reserved.
//

import UIKit

class QuoteView: UIView {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    
    @IBOutlet weak var authorLabel: UILabel!
    
    var quote:Quote!
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    func setupWithQuote (quote: Quote) {
        
        self.imageView.image = quote.quotePhoto
        self.quoteLabel.text = quote.quoteQuote
        self.authorLabel.text = quote.quoteAuthor
        
    }
    
    
 
    
    
    
    
}
