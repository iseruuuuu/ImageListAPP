//
//  ViewController.swift
//  ImageListAPP
//
//  Created by 井関竜太郎 on 2021/02/02.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    //文字列
    var textArray = [String]()
    
    var imageArrya = ["1","2","3","4","5"]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        let label = cell.contentView.viewWithTag(2) as! UILabel
        
        label.text = textArray[indexPath.row]
        imageView.image = UIImage(named: imageArrya[indexPath.row])
        
        return cell
    }
    
    @IBAction func tap(_ sender: Any) {
        
        if textArray.count > 5 || textField.text?.isEmpty == true {
            return
        }
        
        textArray.append(textField.text!)
        textField.text = ""
        if textArray.count <= 5 {
        tableView.reloadData()
        }
    }
    
}

