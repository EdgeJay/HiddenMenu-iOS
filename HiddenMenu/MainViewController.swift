//
//  MainViewController.swift
//  HiddenMenu
//
//  Created by Wu Huijie on 4/11/15.
//  Copyright © 2015 EdgeJay. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController, MenuViewDelegate {
    
    @IBOutlet weak var btnEdit: UIBarButtonItem!
    
    let cellIdentifier = "ColorCell"
    var dataSource: [CellData] = []
    var menuView: MenuView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // setup data source
        dataSource.append(CellData(title: "Red", color: UIColor.redColor()))
        dataSource.append(CellData(title: "Green", color: UIColor.greenColor()))
        dataSource.append(CellData(title: "Blue", color: UIColor.blueColor()))
        
        menuView = MenuView(frame: CGRectMake(0, 0, view.bounds.width, 50))
        menuView?.delegate = self
        tableView.tableHeaderView = menuView
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.contentOffset = CGPointMake(0, (menuView?.bounds.height)!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let data = dataSource[indexPath.row]
        cell.textLabel?.text = data.title
        cell.textLabel?.textColor = data.color

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            dataSource.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - UI actions
    @IBAction func onEdit(sender: AnyObject) {
        if tableView.editing {
            btnEdit.title = "Edit"
            tableView.editing = false
        }
        else {
            btnEdit.title = "Done"
            tableView.editing = true
        }
    }
    
    func menuView(view: MenuView, itemSelected: MenuViewItem) {
        var cellData: CellData?
        
        switch itemSelected {
        case .Red:
            cellData = CellData(title: "Red", color: UIColor.redColor())
        case .Green:
            cellData = CellData(title: "Green", color: UIColor.greenColor())
        case .Blue:
            cellData = CellData(title: "Blue", color: UIColor.blueColor())
        case .Close:
            tableView.setContentOffset(CGPointMake(0, tableView.contentOffset.y + (menuView?.bounds.height)!), animated: true)
        }
        
        if let data = cellData {
            dataSource.append(data)
            tableView.reloadData()
        }
    }
}
