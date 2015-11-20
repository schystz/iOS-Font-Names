//
//  ViewController.swift
//  Fonts
//
//  Created by James Russell Orola on 20/11/2015.
//  Copyright © 2015 schystz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var fonts = [String: [UIFont]]()
    var fontFamilyNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for familyName in UIFont.familyNames() {
            var fontList = [UIFont]()
            for name in UIFont.fontNamesForFamilyName(familyName) {
                fontList.append(UIFont(name: name, size: 20)!)
            }
            fontFamilyNames.append(familyName)
            fonts[familyName] = fontList
        }
        
        fontFamilyNames.sortInPlace()
        
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fontFamilyNames.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let familyName = fontFamilyNames[section]
        if let fontList = fonts[familyName] {
            return fontList.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return fontFamilyNames[section]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let familyName = fontFamilyNames[indexPath.section]
        if let fontList = fonts[familyName] {
            let font = fontList[indexPath.row]
            cell.textLabel?.text = font.fontName
            cell.textLabel?.font = font
        }
        
        return cell
    }

}

