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
			distLabel.text = "Name: \(locationData!.labels[0].name)   Score: \(locationData!.labels[0].score)";
			mapView.showAnnotations([createAnnotationFromLocation(locationData!)], animated: false)
		}
	}
	
	func createAnnotationFromLocation(location: LoopLocation) -> MKPointAnnotation {
		// Add another annotation to the map.
		let annotation = LoopPointAnnotation()
		let dateFormatter = NSDateFormatter();
		dateFormatter.dateFormat = "MM-dd HH:mm";
		
		annotation.coordinate = location.coordinate
		annotation.title = "Visits"
		annotation.subtitle = location.visits.reduce("") { res,visit in
			return "\(dateFormatter.stringFromDate(visit.startTime))~\(dateFormatter.stringFromDate(visit.endTime))\n\(res)";
		}

		return annotation;
	}
}
