//
//  Annotation.h
//  TP_lab8_2
//
//  Created by Admin on 27.05.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * subtitle;

@end
