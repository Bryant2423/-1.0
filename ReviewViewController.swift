//
//  ReviewViewController.swift
//  在路上
//
//  Created by Bryant on 2017/3/24.
//  Copyright © 2017年 Bryant. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    var imageName = ""
    var rating: String?
    
    @IBAction func ratingTap(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            rating = "dislike"
        case 1:
            rating = "good"
        case 2:
            rating = "great"
        default:
            break
        }
        ///代码进行反向转场
        performSegue(withIdentifier: "unwindToDetailView", sender: self)
    }
    @IBOutlet weak var ratingStackView: UIStackView!
    @IBOutlet weak var bgImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImageView.image = UIImage(named: imageName)
        
        ///实现背景虚化
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .light)) //创建一个特效试图，指定特效类型（有亮，超亮，黑暗）
        effectView.frame = view.frame //设置视图大小
        bgImageView.addSubview(effectView) //把特效视图叠加到原视图中（原视图的子视图）
        
        ///动画效果，使用transform属性. 先用CGAffineTransform设置初始大小(scale)
        let startScale = CGAffineTransform(scaleX: 0, y: 0)
        ///再用CGAffineTransform设置初始位置(translation)
        let startPos = CGAffineTransform(translationX: 0, y: 500)
        ///组合动画 concatenating：连接
        ratingStackView.transform = startScale.concatenating(startPos)
        

        // Do any additional setup after loading the view.
    }
    
    ///视图每次显示完毕后要做的事情
    override func viewDidAppear(_ animated: Bool) {
        ///设置动画，withDuration：动画时长时长 CGAffineTransform.identity变化成原始大小
        /*
        UIView.animate(withDuration: 0.2) {
            self.ratingStackView.transform = CGAffineTransform.identity
        }
        */
        //动画效果增强，掌握上面那个即可
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.2, options: [], animations: {
            let endPos = CGAffineTransform(translationX: 0, y: 0)
            //回到原始大小
            let endScale = CGAffineTransform.identity
            self.ratingStackView.transform = endScale.concatenating(endPos)
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
