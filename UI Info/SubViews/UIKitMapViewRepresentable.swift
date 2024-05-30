import SwiftUI
import MapKit
import UIKit

struct MapView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    @Binding var selectedPlace: Place?
    var categories: [CampusCategory]?
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "AnnotationView"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
            
            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                
            } else {
                annotationView?.annotation = annotation
            }
            
            // Customize the glyph
            if let pointAnnotation = annotation as? CustomPointAnnotation {
                annotationView?.glyphImage = pointAnnotation.glyphImage
                annotationView?.markerTintColor = pointAnnotation.markerTintColor
            }
            
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            if let annotation = view.annotation as? CustomPointAnnotation {
                parent.selectedPlace = annotation.place
            }
        }
    }
    
    class CustomPointAnnotation: MKPointAnnotation {
        var glyphImage: UIImage?
        var markerTintColor: UIColor?
        var place: Place?
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        mapView.pointOfInterestFilter = .excludingAll
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(region, animated: true)
        uiView.removeAnnotations(uiView.annotations)
    
        guard let categories = categories else { return }
        var annotations = [CustomPointAnnotation]()
        
        for category in categories {
            for place in category.places {
                let annotation = CustomPointAnnotation()
                annotation.title = place.name
                annotation.coordinate = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
                annotation.place = place
                let annotationCustomizations = determineIcon(categoryName: category.category)
                annotation.glyphImage = UIImage(systemName: annotationCustomizations.0)
                annotation.markerTintColor = UIColor(annotationCustomizations.1)
                annotations.append(annotation)
            }
        }
        
        uiView.addAnnotations(annotations)
        
        if let selectedPlace = selectedPlace {
            if let annotation = annotations.first(where: {$0.place?.name == selectedPlace.name}) {
                uiView.selectAnnotation(annotation, animated: true)
            }
        }
    }
}
