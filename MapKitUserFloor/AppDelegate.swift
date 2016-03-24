//
//  AppDelegate.swift
//  MapKitUserFloor
//
//  Created by Nam (Nick) N. HUYNH on 3/24/16.
//  Copyright (c) 2016 Enclave. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
    
    var window: UIWindow?
    var isExecutingInBackground = false
    var locationManager: CLLocationManager! = nil
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        
        isExecutingInBackground = true
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        
        isExecutingInBackground = false
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        if locations.count > 0 {
            
            let location = (locations as [CLLocation])[0]
            println("Location found = \(location)")
            if let theFloor = location.floor {
                
                println("The floor information is = \(theFloor)")
                
            } else {
                
                println("No floor information is available")
                
            }
            
        }
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
                
                if isExecutingInBackground {
            
            // Background
            
        } else {
            
            // Foreground, do whatever you want
            
                }
                
    }
    
}