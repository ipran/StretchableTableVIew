//
//  ViewController.swift
//  StretchableTableVIew
//
//  Created by Pranil on 12/4/17.
//  Copyright © 2017 pranil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    @IBOutlet weak var tableView: UITableView!
    var quoteArray: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteArray = ["","How much can you know about yourself if you've never been in a fight?", "", "You get depressed because you know that you're not what you should be","","It's only after we've lost everything that we're free to do anything","", "The act of discovering who we are will force us to accept that we can go further than we think", "","Storm don't last forever"]
        
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        imageView.image = UIImage.init(named: "dating")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        
        // Set the tableview’s contentInset property
        tableView.contentInset = UIEdgeInsetsMake(300, 0, 0, 0)
        tableView.backgroundColor = UIColor.darkGray
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    // PRAGMA MARK :- TableView Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCell()
        cell.textLabel?.textColor = UIColor.white
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor.darkGray
            cell.textLabel?.text = "Quote of the day"
        }
        else{
            cell.backgroundColor = UIColor.black
            cell.textLabel?.numberOfLines = 2
            cell.textLabel?.text = quoteArray[indexPath.row]
        }
        
        return cell
    }
    
    // PRAGMA MARK :- TableView Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0{
            return 60
        }
        else
        {
            return 95
        }
        //        return UITableViewAutomaticDimension
    }
    
    // PRAGMA MARK :- ScrollView Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 300 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 60), 400)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
    
}

