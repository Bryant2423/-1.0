//
//  MapViewController.swift
//  在路上
//
//  Created by Bryant on 2017/4/1.
//  Copyright © 2017年 Bryant. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    var area:Area!

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(area.name) { (ps, error) in
            
            guard let ps = ps else{
                let alert = UIAlertController(title: "提示", message: "地址不可用", preferredStyle: .alert)
                let ac = UIAlertAction(title: "好", style: .default, handler: nil)
                alert.addAction(ac)
                self.present(alert, animated: true, completion: nil)
                print(error ?? "未知错误")
                return
            }
            
            let place = ps.first
            let annotation = MKPointAnnotation()
            annotation.title = self.area.name
            annotation.subtitle = self.area.province
            
            if let loc = place?.location{
                annotation.coordinate = loc.coordinate
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
            }
        }
        self.title = "地点"

        // Do any additional setup after loading the view.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil
        }
        
        let id = "myId"
        var av = mapView.dequeueReusableAnnotationView(withIdentifier: id) as? MKPinAnnotationView
        if av == nil {
            av = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            av?.canShowCallout = true
        }
        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
        leftIconView.image = UIImage(named: area.image)
        av?.leftCalloutAccessoryView = leftIconView
        av?.pinTintColor = UIColor.green
        return av
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
