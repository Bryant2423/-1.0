//
//  AreaTableViewController.swift
//  在路上
//
//  Created by Bryant on 2017/1/23.
//  Copyright © 2017年 Bryant. All rights reserved.
//

import UIKit

class AreaTableViewController: UITableViewController {
    
    var areas = [Area(name: "闵行区莘庄镇疏影路711弄东苑新天地21号405", image:"xinzhuang" , isVisted: false, part: "华东", province: "上海") ,
                 Area(name: "兰州七里河区彭家坪路36号兰州理工大学西校区计算机系", image:"qilihe" , isVisted: false, part: "西北", province: "甘肃") ,
                 Area(name: "三明市尤溪县东旭佳园83号楼", image:"youxi" , isVisted: false, part: "东南", province: "福建") ,
                 Area(name: "西宁城西区香格里拉路昆仑阳光城5号楼，近新华巷", image:"chengxi" , isVisted: false, part: "西北", province: "青海") ,
                 Area(name: "广州白云区黄石东路江夏东二街200号（地铁2号线江夏站C出口往右约200米）欧陆公馆", image:"baiyun" , isVisted: false, part: "华南", province: "广东") ,
                 Area(name: "闽侯县上街镇工贸路惠好路福禄坊", image:"shangjie" , isVisted: false, part: "东南", province: "福建") ,
                 Area(name: "哈尔滨市南岗区嵩山路125号中植方洲苑1102", image:"nangang" , isVisted: false, part: "东北", province: "黑龙江") ,
                 Area(name: "临汾市尧都区解放东路与尧贤路交汇处恒安新东城逸景40栋3001", image:"yaodu" , isVisted: false, part: "华北", province: "山西") ,
                 Area(name: "成都武侯区丽都路2号置信丽都花园15号1004", image:"wuhou" , isVisted: false, part: "西南", province: "四川") ,
                 Area(name: "汕头市金平区汕樟路16号（中山路与汕樟路转角）凯悦华庭3号楼805", image:"jinping" , isVisted: false, part: "华南", province: "广东") ,
                 Area(name: "长沙市芙蓉区解放东路219号铁银大厦", image:"furong" , isVisted: false, part: "华中", province: "湖南")]
    
    /*
    var areas = ["闵行区莘庄镇","兰州七里河区","三明市尤溪县","西宁城西区","广州白云区","闽侯县上街镇","哈尔滨市南岗区","临汾市尧都区","成都武侯区","汕头市金平区","长沙市芙蓉区"]
    
    var areaImages =
        [
            "xinzhuang", "qilihe", "youxi", "chengxi", "baiyun", "shangjie", "nangang", "yaodu", "wuhou", "jinping", "furong"]
    
    var provinces = ["上海", "甘肃", "福建", "青海", "广东", "福建", "黑龙江", "山西", "四川", "广东", "湖南"]
    
    var parts = ["华东", "西北", "东南", "西北", "华南", "东南", "东北", "华北", "西南", "华南", "华中"]
    
    var visted = [Bool](repeatElement(false, count: 11))
    */



    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        ///设置返回按钮样式
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    ///表格区块数
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    ///列表的从行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return areas.count
    }

    ///设置每个单元格显示的内容
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.nameLable.text = areas[indexPath.row].name
        
        cell.thumbImageView.image = UIImage(named: areas[indexPath.row].image)
        
        //cell.thumbImageView.layer.cornerRadius = cell.thumbImageView.frame.size.width / 2
        
        cell.partLabel.text = areas[indexPath.row].part
        
        cell.provinceLabel.text = areas[indexPath.row].province
        
        cell.thumbImageView.layer.cornerRadius = 5
        
        cell.thumbImageView.clipsToBounds = true
        
        cell.like.image = #imageLiteral(resourceName: "heart")
        
        cell.like.isHidden = areas[indexPath.row].isVisted ? false : true
        
        //cell.textLabel?.text = areas[indexPath.row]
        
        
        //cell.imageView?.image = UIImage(named: areaImages[indexPath.row])
        
        

        // Configure the cell...

        return cell
    }
    
    override var prefersStatusBarHidden: Bool{
        return false
    }

    
    // MARK: - Table view delegate
    
    /*
    ///单元格的选中处理
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ac = UIAlertController(title: "你选了我", message: nil, preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        //let like = UIAlertAction(title: "收藏", style: .default, handler: nil)
        
        let come = UIAlertAction(title: "收藏", style: .default){
            (_) in
            let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
            
            cell.like.isHidden = false
            
            self.visted[indexPath.row] = true
        }
        
        let disLike = UIAlertAction(title: "取消收藏", style: .destructive){
            (_) in
            let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
            
            cell.like.isHidden = true
            
            self.visted[indexPath.row] = false

        }
        
        
        ac.addAction(visted[indexPath.row] ? disLike : come)
        
        
        ac.addAction(cancel)
        
        self.present(ac, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
   */
    ///右滑菜单的自定义
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let ac = UITableViewRowAction(style: .normal, title: "分享"){
            (_, indexPath) in
            let actionSheet = UIAlertController(title: "分享到", message: nil, preferredStyle: .actionSheet)
            
            let btn = UIAlertAction(title: "微信", style: .default){
                (_) in
                ///这个右滑菜单 其实就是 打开编辑状态, 只要把 编辑状态关闭就行了
                tableView.setEditing(false, animated: true)
            }
            
            let btn2 = UIAlertAction(title: "QQ", style: .default){
                (_) in
                tableView.setEditing(false, animated: true)
            }
            
            let btn3 = UIAlertAction(title: "微博", style: .default){
                (_) in
                tableView.setEditing(false, animated: true)
            }
            
            let cancel = UIAlertAction(title: "取消", style: .cancel){
                (_) in
                tableView.setEditing(false, animated: true)
            }
            
            actionSheet.addAction(btn)
            actionSheet.addAction(btn2)
            actionSheet.addAction(btn3)
            actionSheet.addAction(cancel)
            self.present(actionSheet, animated: true, completion: nil)
        }
        
        let delete = UITableViewRowAction(style: .destructive, title: "删除"){
            (_, indexPath) in
            
            self.areas.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        //ac.backgroundColor = UIColor.orange
        
        
        return [delete,ac]
        
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
            
            areas.remove(at: indexPath.row)
            provinces.remove(at: indexPath.row)
            parts.remove(at: indexPath.row)
            areaImages.remove(at: indexPath.row)
            visted.remove(at: indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            //tableView.reloadData()重新刷新列表
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showAreaDetail"{
            
        let dest = segue.destination as! DetailTableViewController
            
            dest.area = areas[tableView.indexPathForSelectedRow!.row]
    }
  }
    
    @IBAction func close(segue:UIStoryboardSegue) {
        
    }

}
