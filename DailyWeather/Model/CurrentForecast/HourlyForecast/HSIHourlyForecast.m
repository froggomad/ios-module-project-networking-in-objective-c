//
//  HSIHourlyWeather.m
//  DailyWeather
//
//  Created by Kenny on 6/10/20.
//  Copyright © 2020 Hazy Studios Incorporated. All rights reserved.
//

#import "HSIHourlyForecast.h"

@implementation HSIHourlyForecast

- (instancetype) initWithTime:(NSDate *)time
                      summary:(NSString *)summary
                         icon:(NSString *)icon
            precipProbability:(double)precipProbability
              precipIntensity:(double)precipIntensity
                   precipType:(NSString *)precipType
               temperatureLow:(double)temperatureLow
              temperatureHigh:(double)temperatureHigh
          apparentTemperature:(double)apparentTemperature
                     humidity:(double)humidity
                     pressure:(double)pressure
                    windSpeed:(double)windSpeed
                  windBearing:(double)windBearing
                      uvIndex:(double)uvIndex
{
    self = [super init];
    if (self) {
        _time = time;
        _summary = [summary copy];
        _icon = [icon copy];
        _precipProbability = precipProbability;
        _precipIntensity = precipIntensity;
        _temperatureLow = temperatureLow;
        _temperatureHigh = temperatureHigh;
        _apparentTemperature = apparentTemperature;
        _humidity = humidity;
        _pressure = pressure;
        _windSpeed = windSpeed;
        _windBearing = windBearing;
        _uvIndex = uvIndex;
    }
    return self;
}

- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    NSNumber *timeValue = dictionary[@"time"];
    NSDate *time = [[NSDate alloc] initWithTimeIntervalSince1970:timeValue.longValue];

    NSString *summary = dictionary[@"summary"];
    NSString *icon = dictionary[@"icon"];

    NSNumber *precipProbability = dictionary[@"precipProbability"];
    NSNumber *precipIntensity = dictionary[@"precipIntensity"];

    NSString *precipType = dictionary[@"precipType"];

    NSNumber *temperatureLow = dictionary[@"temperatureLow"];
    NSNumber *temperatureHigh = dictionary[@"temperatureHigh"];

    NSNumber *apparentTemperature = dictionary[@"apparentTemperature"];
    NSNumber *humidity = dictionary[@"humidity"];
    NSNumber *pressure = dictionary[@"pressure"];
    NSNumber *windSpeed = dictionary[@"windSpeed"];
    NSNumber *windBearing = dictionary[@"windBearing"];
    NSNumber *uvIndex = dictionary[@"uvIndex"];

    if (time && summary && icon && precipProbability && humidity && pressure && windSpeed && uvIndex) {
        return [self initWithTime:time
                          summary:summary
                             icon:icon
                precipProbability:precipProbability.doubleValue
                  precipIntensity:precipIntensity.doubleValue
                       precipType:precipType
                   temperatureLow:temperatureLow.doubleValue
                  temperatureHigh:temperatureHigh.doubleValue
              apparentTemperature:apparentTemperature.doubleValue
                         humidity:humidity.doubleValue
                         pressure:pressure.doubleValue
                        windSpeed:windSpeed.doubleValue
                      windBearing:windBearing.intValue
                          uvIndex:uvIndex.intValue];
    }
    return nil;
}

@end