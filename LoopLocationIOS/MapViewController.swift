//
//  MapViewController.swift
//  Loop-Sample-Trip-IOS
//
//  Created by Xuwen Cao on 5/30/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import UIKit
import MapKit
import LoopSDK

class LoopPointAnnotation: MKPointAnnotation {
}

class MapViewController: UIViewController {

	@IBOutlet weak var distLabel: UILabel!
	
	@IBOutlet weak var mapView: MKMapView!
	
	var locationData:LoopLocation? = nil;
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if locationData != nil {
			let text = locationData!.labels.reduce("") { "\($0) (\($1.name):\(String(format: "%.2f", $1.score)))"};
			distLabel.text = text == "" ? "No label": text;
			mapView.showAnnotations([createAnnotationFromLocation(locationData!)], animated: false)
		}
	}
	
	func createAnnotationFromLocation(location: LoopLocation) -> MKPointAnnotation {
		// Add another annotation to the map.
		let annotation = LoopPointAnnotation()
		let dateFormatter = NSDateFormatter();
		dateFormatter.dateFormat = "MM-dd HH:mm";
		
		annotation.coordinate = CLLocationCoordinate2D.init(latitude: location.latitude, longitude: location.longitude)
		annotation.title = "Last Visit"
		
		if let lastVisit = location.visits.last {
			annotation.subtitle =
				"\(dateFormatter.stringFromDate(lastVisit.startTime))~\(dateFormatter.stringFromDate(lastVisit.endTime))";
		}

		return annotation;
	}
}
