//
//  LocationsTableViewController.swift
//  SwiftLocationTriviaDelegates
//
//  Created by Matt Amerige on 7/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController {
    
    var locations = [Location]()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)
        cell.textLabel?.text = locations[indexPath.row].name
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showAddVC" {
            let destinationNavVC = segue.destinationViewController as! UINavigationController
            let destinationVC = destinationNavVC.viewControllers[0] as! AddLocationViewController
            destinationVC.delegate = self
        }
    }
    
}

extension LocationsTableViewController: AddLocationViewControllerDelegate {
    func addLocationViewControllerDidCancel(viewController: AddLocationViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addLocationViewController(viewController: AddLocationViewController, didAddLocationNamed name: String) {
        dismissViewControllerAnimated(true, completion: nil)
        let newLocation = Location(name: name)
        locations.append(newLocation)
        tableView.reloadData()
    }
    
    func addLocationViewController(viewController: AddLocationViewController, shouldAllowLocationNamed name: String) -> Bool {
        let filteredLocations = locations.filter { (location) -> Bool in
            location.name == name
        }
        return filteredLocations.count == 0
    }
}
