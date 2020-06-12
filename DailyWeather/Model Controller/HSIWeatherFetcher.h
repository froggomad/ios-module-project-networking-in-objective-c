//
//  HSIWeatherFetcher.h
//  DailyWeather
//
//  Created by Kenny on 6/11/20.
//  Copyright © 2020 Hazy Studios Incorporated. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class HSIWeatherForecast;

@interface HSIWeatherFetcher : NSObject

- (void)fetchWeatherAtLocation:(CLLocationCoordinate2D)location completion:(void(^)(HSIWeatherForecast *))completion;

@end
