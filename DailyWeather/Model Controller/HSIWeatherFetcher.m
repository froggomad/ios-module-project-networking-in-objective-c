//
//  HSIWeatherFetcher.m
//  DailyWeather
//
//  Created by Kenny on 6/11/20.
//  Copyright © 2020 Hazy Studios Incorporated. All rights reserved.
//

#import "HSIWeatherFetcher.h"
#import "HSIWeatherForecast.h"


@implementation HSIWeatherFetcher

- (void)fetchWeatherAtLocation:(CLLocationCoordinate2D)location
                    completion:(void(^)(HSIWeatherForecast *))completion
{
    NSString *apiKey = @"18990986362b5b52af4a81dd7775c5af";
    NSString *baseURLString = [@"https://api.darksky.net/forecast/" stringByAppendingString:apiKey];

    double latitude = location.latitude;
    double longitude = location.longitude;
    NSString *latitudeString = [[NSString alloc] initWithFormat:@"/%.2f,", latitude];
    NSString *longitudeString = [[NSString alloc] initWithFormat:@"%.2f", longitude];

    NSString *locationString = [latitudeString stringByAppendingString:longitudeString];
    NSString *locationURLString = [baseURLString stringByAppendingString:locationString];
    NSURL *baseURL = [NSURL URLWithString:locationURLString];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:baseURL];

    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        if (error) {
            NSLog(@"Error fetching weather: %@", error);
            completion(nil);
            return;
        }

        if (!data) {
            NSLog(@"No data from fetching weather");
            completion(nil);
            return;
        }

        error = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (error) {
            NSLog(@"Error decoding JSON: %@", error);
            completion(nil);
            return;
        }
        // TODO: debug, remove
        NSLog(@"Dictionary: %@", dictionary);

        if (dictionary[@"current"] == [NSNull null]) {
            NSLog(@"Error: Current weather not available");
            completion(nil);
            return;
        }

        HSIWeatherForecast *forecast = [[HSIWeatherForecast alloc] initWithDictionary:dictionary];
        completion(forecast);

    }] resume];
}

@end
