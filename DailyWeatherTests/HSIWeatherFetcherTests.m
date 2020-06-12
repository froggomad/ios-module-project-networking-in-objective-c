//
//  HSIWeatherFetcherTests.m
//  DailyWeatherTests
//
//  Created by Kenny on 6/11/20.
//  Copyright © 2020 Hazy Studios Incorporated. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HSIWeatherFetcher.h"

@interface HSIWeatherFetcherTests : XCTestCase

@end

@implementation HSIWeatherFetcherTests

- (void)testURL_TEMP {
    NSString *apiKey = @"18990986362b5b52af4a81dd7775c5af";
    NSString *baseURLString = [@"https://api.darksky.net/forecast/" stringByAppendingString:apiKey];
    //test converting from CLLocationCoordinate2D (i.e. CLLocation.coordinate) to double to text to URL
    CLLocation *location = [[CLLocation alloc] initWithLatitude:20.0 longitude:25.0];

    double latitude = location.coordinate.latitude;
    double longitude = location.coordinate.longitude;

    NSString *latitudeString = [[NSString alloc] initWithFormat:@"/%.2f,", latitude];
    NSString *longitudeString = [[NSString alloc] initWithFormat:@"%.2f", longitude];

    NSString *locationString = [latitudeString stringByAppendingString:longitudeString];
    NSString *locationURLString = [baseURLString stringByAppendingString:locationString];
    NSURL *baseURL = [NSURL URLWithString:locationURLString];
    XCTAssertNotNil(baseURL);
    NSLog(@"%@", baseURL.absoluteString);
}

@end
