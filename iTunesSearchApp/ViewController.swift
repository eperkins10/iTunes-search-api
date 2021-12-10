//
//  ViewController.swift
//  iTunesSearchApp
//
//  Created by Ethan Perkins on 11/30/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        guard let term = searchTextField.text else { return }
        
        SearchResultsController.searchResultsForSearchTerm(searchTerm: term) { [weak self] (results) in
            if let searchResults = results,
               let firstResult = searchResults.first {
                DispatchQueue.main.async {
                    self?.resultsLabel.text = "\(firstResult.trackName) - \(firstResult.artistName)"
                }
            }
        }
    }
    
    


}

