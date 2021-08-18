import UIKit
import MapKit

struct LocationPoint: Codable {
  var lat: Double?
  var long: Double?
  var speed: Double?
  var accuracy: Double?
  var timeStamp: Date?
  
  
  enum CodingKeys: String, CodingKey {
    case long, speed, accuracy ,timeStamp, lat
  }
  
    
}



class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, CLLocationManagerDelegate , MKMapViewDelegate{
  let locationManager = CLLocationManager()
  var locationsP = [LocationPoint]()
  var previousLoc :CLLocationCoordinate2D?
    @IBOutlet weak var mapView: MKMapView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return locationsP.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableCell") as! LocationTableViewCell
    if let lat = locationsP[indexPath.row].lat {
      cell.lat.text = "\(lat)"
    }
    if let long = locationsP[indexPath.row].long {
      cell.long.text = "\(long)"
    }
    if let speed = locationsP[indexPath.row].speed {
      cell.speed.text = "\(speed)"
    }
    if let accuracy = locationsP[indexPath.row].accuracy {
      cell.gpsAccuracy.text = "\(accuracy) meter"
    }
    
    return cell
  }
  
  
  func drawLine(location1:CLLocationCoordinate2D,location2:CLLocationCoordinate2D){
    let blueLocation1 = location1

    let blueLocation2 = location2

    let routeLine = MKPolyline(coordinates:[blueLocation1,blueLocation2], count:2)
    
    self.mapView.addOverlay(routeLine)
  }
  
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
      let polylineRenderer = MKPolylineRenderer(overlay: overlay)
      polylineRenderer.strokeColor = UIColor.blue
      polylineRenderer.lineWidth = 5
      return polylineRenderer
   
  }
  
  func zoomToFitMapAnnotations(aMapView:MKMapView)
  {
      if(aMapView.annotations.count == 0)
      {
          return
      }


      var topLeftCoord = CLLocationCoordinate2D.init(latitude: -90, longitude: 180)


      var bottomRightCoord = CLLocationCoordinate2D.init(latitude: 90, longitude: -180)


      for i in 0..<aMapView.annotations.count
      {
          let annotation = aMapView.annotations[i]

          topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
          topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);

          bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
          bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
      }


      let resd = CLLocationCoordinate2D.init(latitude: topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5, longitude: topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5)

      let span = MKCoordinateSpan.init(latitudeDelta: fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 1.3, longitudeDelta: fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.3)

      var region = MKCoordinateRegion.init(center: resd, span: span);



      region = aMapView.regionThatFits(region)

      aMapView.setRegion(region, animated: true)


  }
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var mapVIew: MKMapView!
    var data = "default"
    override func viewDidLoad() {
        super.viewDidLoad()
       self.locationManager.requestAlwaysAuthorization()
//      if CLLocationManager.locationServicesEnabled() {
          locationManager.delegate = self
          locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
          locationManager.startUpdatingLocation()
//      }
      
        textView.text = data
        // Do any additional setup after loading the view.
    }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
    guard let gpsData = manager.location  else {
      return
    }
    zoomToFitMapAnnotations(aMapView: mapView)
     let point =  LocationPoint(lat: locValue.latitude, long: locValue.longitude, speed: gpsData.speed, accuracy: gpsData.horizontalAccuracy, timeStamp: gpsData.timestamp)
    
      locationsP.append(point)
      DispatchQueue.main.async {
         self.tableView.reloadData()
      }
    if previousLoc != nil {
      drawLine(location1: previousLoc!, location2: locValue)
      
    }
    self.previousLoc = locValue
      print("locations = \(locValue.latitude) \(locValue.longitude)")
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
