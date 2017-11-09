//
//  SharingViewController.swift
//  QuoteBuilder
//
//  Created by Sanjay Shah on 2017-11-08.
//  Copyright © 2017 Sanjay Shah. All rights reserved.
//

import UIKit

class SharingViewController: UIViewController {
    
    var quoteView: QuoteView!
    var quote: Quote!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
         quoteView = Bundle.main.loadNibNamed("QuoteView", owner: nil, options: nil)?.first! as? QuoteView
        
        quoteView.setupWithQuote(quote: quote)
        
        quoteView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(quoteView)
        quoteView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        quoteView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        quoteView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        quoteView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    
        self.view.addSubview(quoteView)
        
        self.navigationController?.isToolbarHidden = false;
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func share(_ sender: UIBarButtonItem) {
        
        // grab an item we want to share
        
        
        // build an activity view controller
        
        let controller = UIActivityViewController(activityItems: [quote], applicationActivities: nil)
        
        present(controller, animated: true, completion: nil)
    
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
