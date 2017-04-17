///导入地图框架，以下代码用于把具体地址转换为一个坐标
import MapKit

//:MapKit中的Geocoder类用于这种转换，实现地址坐标间的互转数据保存在“地标(Placemark)”对象中

//:实例化一个CLGeocoder，调用geocodeAddressString方法即可。
let coder = CLGeocoder()
//:做一个具体地点的类型来获取地点坐标
var placeMark:CLPlacemark?

//:使用CLGeocoder类中.geocodeAddressString把地点名转换为坐标;实际地址没有固定的格式，此方法会联网查询后返回一个地标对象数组。地址越准确，返回的地标越接近。如果地址不太准确，可能返回多个地标。

coder.geocodeAddressString("地点名") { (placeMarks, error) in
    
    if error != nil{
        print(error ?? "错误")
    }
    
    if let ps = placeMarks{
        placeMark = ps.first
    }
}
//:通过解析完毕返回的地标对象（CLPlacemark类），就可获得地址的坐标。
placeMark?.location?.coordinate


