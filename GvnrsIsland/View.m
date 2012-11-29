//
//  View.m
//  GvnrsIsland
//
//  Created by Phillip Gulla on 11/18/12.
//  Copyright (c) 2012 Allug. All rights reserved.
//

#import <CoreLocation/CLLocation.h>	//for CLLocationCoordinate2D
#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame: frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void) drawRect: (CGRect) rect {
    
	// New drawing code for Governors Island added 11/3/12
	
	
	static CLLocationCoordinate2D a[] = {
		{40.686903,		-74.017017},    //Kimmel Rd at Division Rd
		{40.687326,		-74.016266},    //Kimmel Rd at Clayton Rd
		{40.687277,		-74.015579},    //Kimmel Rd just after Clayton Rd
		{40.687261,		-74.015},     	//Kimmel Rd near bend
		{40.68737,		-74.014745},    //Kimmel Rd parallel to Comfort Rd
		{40.687663,		-74.014195},    //Kimmel Rd near Evans Rd and Barry Rd
		{40.688741,		-74.012811},    //37 - 47 Kimmel Rd #1
		{40.689278,		-74.012361},    //37 - 47 Kimmel Rd #2
		{40.691035,		-74.012618},    //37 Kimmel Rd
		{40.691979,		-74.013476},    //130 - 144 Carder Rd
		{40.692744,		-74.015429},    //144 Carder Rd
		{40.693232,		-74.017017},    //W Ferry Line Rd
		{40.693102,		-74.019635},    //Craig Rd N
		{40.691971,		-74.020268},    //Craig Rd N
		{40.690726,		-74.021512},    //Craig Rd N
		{40.689311,		-74.023132},    //Craig Rd N
		{40.688269,		-74.024141},    //Craig Rd N
		{40.687244,		-74.025214},    //979 Craig Rd N
		{40.686382,		-74.026201},    //965 Craig Rd N
		{40.685812,		-74.02649},     //940 - 944 Craig Rd N
		{40.68521,		-74.026533},    //940 - 944 Craig Rd N
		{40.684576,		-74.026201},    //940 Craig Rd N
		{40.684202,		-74.025707},    //930 - 938 Craig Rd S
		{40.683901,		-74.024141},    //902 - 924 Craig Rd S
		{40.684071,		-74.023283},    //902 - 924 Craig Rd S
		{40.68425,		-74.022596},    //902 - 924 Craig Rd S
		{40.684877,		-74.021577},    //Craig Rd S
		{40.685251,		-74.020547},    //680 - 688 Craig Rd S
		{40.68578,		-74.019656},    //650 - 678 Craig Rd S
		{40.68617,		-74.018798},    //600 - 648 Craig Rd S
		{40.686594,		-74.017886},    //600 - 648 Craig Rd S
	};
	
	
	static const size_t n = sizeof a / sizeof a[0];
	
	CGContextRef c = UIGraphicsGetCurrentContext();
	
	CGSize s = self.bounds.size;
	CGContextTranslateCTM(c, s.width / 2, s.height / 2);
	
	//Longitude and latitude in degrees of the heart of Manhattan,
	//probably somewhere around the Angel of the Waters.
	
	//CGFloat xtranslate = 74.020557;
	//CGFloat ytranslate = -40.688156;
	
	CGFloat xtranslate = 74.02;
	CGFloat ytranslate = -40.69;
	
	CGFloat scale = 20000;	//pixels per degree of latitude
	
	CGContextScaleCTM(c, scale * cos(ytranslate * M_PI / 180), -scale);
	CGContextTranslateCTM(c, xtranslate, ytranslate);
	
	CGContextBeginPath(c);
	CGContextMoveToPoint(c, a[0].longitude, a[0].latitude);
	
	for (size_t i = 1; i < n; ++i) {
		CGContextAddLineToPoint(c, a[i].longitude, a[i].latitude);
	}
	
	CGContextClosePath(c);
	
	//Code to add Castle Williams on Governors Island - added 11/4/12
	
	CGContextMoveToPoint(c, -74.019039, 40.692532);		//First point Castle Williams
	CGContextAddLineToPoint(c, -74.019699, 40.692605);	//Second point Castle Williams
	CGContextAddLineToPoint(c, -74.019683, 40.693008);	//Third point Castle Williams
	CGContextAddLineToPoint(c, -74.018964, 40.692971);	//Fourth point Castle Williams
	CGContextClosePath(c);
	
	//End code to add Castle Williams on Governors Island - added 11/4/12
	
	CGContextSetRGBFillColor(c, 0.0, 0.4, 0.0, 1.0);	//green
	CGContextFillPath(c);
}

@end
