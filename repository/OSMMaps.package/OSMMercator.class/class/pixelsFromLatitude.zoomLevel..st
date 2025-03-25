converting
pixelsFromLatitude: aLatitude zoomLevel: zoomLevel
	| lat sinLat log maxPixel yPixel |
	"See LatToY from OsmMercator.java"
	
	"MercatorWeb works in the -85° to 85° range"
	lat := aLatitude < self minLatitude
		ifTrue: [ self minLatitude ]
		ifFalse: [ aLatitude ].
		
	aLatitude > self maxLatitude
		ifTrue: [ lat := self maxLatitude ].
	
	sinLat := aLatitude degreesToRadians sin.
	log := ((1 + sinLat) / (1 - sinLat)) ln.
	maxPixel := self maxPixelForZoomLevel: zoomLevel.
	yPixel := maxPixel * (0.5 - (log / (4.0 *  Float pi))).

	 ^ yPixel min: (maxPixel - 1).
