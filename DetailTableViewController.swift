//
//  DetailTableViewController.swift
//  在路上
//
//  Created by Bryant on 2017/1/29.
//  Copyright © 2017年 Bryant. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    
    @IBOutlet weak var ratingBtn: UIButton!
    @IBOutlet weak var areaImageView: UIImageView!
    var area:Area!

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        self.title = area.name

        areaImageView.image = UIImage(named: area.image)
        tableView.backgroundColor = UIColor(white: 0.98, alpha: 1)
        ///删除页脚
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = UIColor(white: 0.9, alpha: 1)
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableViewAutomaticDimension
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as!DetailTableViewCell
        
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.row {
        case 0:
            cell.fieldLable.text = "地名"
            cell.valueLable.text = area.name
            
        case 1:
            cell.fieldLable.text = "省"
            cell.valueLable.text = area.province
            
        case 2:
            cell.fieldLable.text = "区域"
            cell.valueLable.text = area.part
        
        case 3:
            cell.fieldLable.text = "是否来过"
            cell.valueLable.text = area.isVisted ? "来过" : "没来过"
        default:
            break
        }

        // Configure the cell...

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showReview"{
            let dest = segue.destination as! ReviewViewController
            dest.imageName = area.image
        }
        
        if segue.identifier == "showMap"{
            let dest = segue.destination as! MapViewController
            dest.area = self.area
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    ///模态转场代码
    @IBAction func close(segue:UIStoryboardSegue) {
        //关闭页面时传值
        let ratingVC = segue.source as! ReviewViewController
        
        if let rating = ratingVC.rating{
            self.area.rate = rating
            ratingBtn.setImage(UIImage(named:rating), for: .normal)
        }
    }

}
