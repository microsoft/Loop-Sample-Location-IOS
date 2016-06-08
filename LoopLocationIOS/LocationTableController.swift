//
//  LocationTableController.swift
//  Loop-Sample-Trip-IOS
//
//  Created by Xuwen Cao on 5/30/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import UIKit
import LoopSDK

class LocationTableController: UITableViewController {
	var tableData:[(text: String, shouldShowMap: Bool, data:LoopLocation?)] = [];
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		LoopSDK.syncManager.getProfileLocations {
			(loopLocations:[LoopLocation]) in
			
			self.tableData.removeAll();
			//self.tableData.append((text: "Get locations", shouldShowMap:false, data:nil))
			
			if loopLocations.isEmpty {
				self.tableData.append((text: "No location!", shouldShowMap:false, data: nil));
			} else {
				loopLocations.forEach { loc in
					var text = loc.labels.reduce("") { "\($0) (\($1.name):\(String(format: "%.2f", $1.score)))"}
					text = text == "" ? "No label": text;
					self.tableData.append((text: "\(text)", shouldShowMap:true, data:loc));
				}
			}
			
			self.tableView.reloadData();
		}
	}
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableData.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("LocationCell", forIndexPath: indexPath)
		
		let row = indexPath.row
		cell.textLabel?.text = tableData[row].text;
				
		return cell
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {		
		let row = indexPath.row

		if tableData[row].shouldShowMap {
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let vc = storyboard.instantiateViewControllerWithIdentifier("MapViewController") as! MapViewController
			vc.locationData = tableData[row].data;
			(self.parentViewController as! UINavigationController).pushViewController(vc, animated: true)
		} else {
			self.tableView.deselectRowAtIndexPath(indexPath, animated:true);
			
			if (tableData[row].text == "Get locations") {
				if !getLoopInitialized() {
					self.tableData.removeAll();
					self.tableData.append((text: "SDK credential error!", shouldShowMap:false, data:nil))
					self.tableView.reloadData();
					return;
				}
			}
		}
	}
	
	func getLoopInitialized() -> Bool {
		let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		return appDelegate.loopInitialized
	}
}