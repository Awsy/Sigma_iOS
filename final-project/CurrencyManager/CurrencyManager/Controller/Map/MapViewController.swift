//
//  MapViewController.swift
//  CurrencyManager
//
//  Created by Aws Shkara on 18.06.2021.
//

import UIKit
import MapKit


class MapViewController: UIViewController {
	
	// MARK: - Properties
	
	private let destinationCoordinate: CLLocationCoordinate2D
	
	private let locationManager = CLLocationManager()
	
	// MARK: - Outlets
	
	private let mapView = MKMapView()
	
	init(destinationCoordinate: CLLocationCoordinate2D) {
		self.destinationCoordinate = destinationCoordinate
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
	}
}


// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
	
	public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
		guard let polyline = overlay as? MKPolyline else {
			print("\(#function) failed")
			return MKOverlayRenderer()
		}
		let renderer = MKPolylineRenderer(polyline: polyline)
		renderer.strokeColor = UIColor.systemBlue
		renderer.lineWidth = 5.0
		return renderer
	}
}


// MARK: - CLLocationManagerDelegate

extension MapViewController: CLLocationManagerDelegate {
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		
		manager.stopUpdatingLocation()
		
		guard let coordinate = locations.first?.coordinate else {
			return
		}
		
		showRoute(sourceCoordinate: coordinate)
	}
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("\(#function) error. \(error)")
	}
}

private extension MapViewController {
	
	func setupView() {
		
		view.addSubview(mapView)
		
		// mapView
		mapView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		mapView.showsUserLocation = true
		mapView.delegate = self
		
		showDestinationPoint()
		
		// update user location
		if CLLocationManager.locationServicesEnabled() {
			locationManager.delegate = self
			locationManager.desiredAccuracy = kCLLocationAccuracyBest
			locationManager.requestWhenInUseAuthorization()
			locationManager.startUpdatingLocation()
		}
	}
	
	// MARK: - Map
	
	func showDestinationPoint() {
		
		let span = MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)
		let region = MKCoordinateRegion(center: destinationCoordinate, span: span)
		mapView.setRegion(region, animated: true)
		
		let annotation = MKPointAnnotation()
		annotation.coordinate = destinationCoordinate
		mapView.addAnnotation(annotation)
	}
	
	func showRoute(sourceCoordinate: CLLocationCoordinate2D) {

		// configure source
		let sourcePlaceMark = MKPlacemark(coordinate: sourceCoordinate, addressDictionary: nil)
		let sourceMapItem = MKMapItem(placemark: sourcePlaceMark)

		// configure destination
		let destinationPlaceMark = MKPlacemark(coordinate: destinationCoordinate, addressDictionary: nil)
		let destinationMapItem = MKMapItem(placemark: destinationPlaceMark)

		// make direction and calculate it
		let directionRequest = MKDirections.Request()
		directionRequest.source = sourceMapItem
		directionRequest.destination = destinationMapItem
		directionRequest.transportType = .any

		let directions = MKDirections(request: directionRequest)

		directions.calculate { [weak self] (response, error) in
			guard let response = response, let route = response.routes.first else {
				if let error = error {
					print("\(#function) - Error. \(error)")
				}
				return
			}

			var region = MKCoordinateRegion(route.polyline.boundingMapRect)
			region.span = MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
			self?.mapView.addOverlay(route.polyline, level: .aboveRoads)
			self?.mapView.setRegion(region, animated: true)
		}
	}
}


/*
Lat: 48,610947
Lng: 22,292235
*/

/*
Lat: 48,597473
Lng: 22,284901
*/
