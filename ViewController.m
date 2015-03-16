//
//  ViewController.m
//  BrightcoveDemo
//
//  Created by Vaibhavi on 20/11/14.
//  Copyright (c) 2014 TCS. All rights reserved.
//

#import "ViewController.h"
#import "BCOVPlayerSDK.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self searchVideo];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)searchVideo{
    NSString *token = @"QlQTjjSbZaxiap_EZVsqde1E9OGuuSMfo-on79brCTzSOp96obJpUA..";      // (Brightcove Media API token with URL access)
    NSString *playlistID = @"2693590770001"; // (ID of the playlist you wish to use)
    
    //2693590769001 // canada
    //2693590770001 // canada french
    
    BCOVPlayerSDKManager *manager = [BCOVPlayerSDKManager sharedManager];
    id<BCOVPlaybackController> controller = [manager createPlaybackControllerWithViewStrategy:nil];
    [self.view addSubview:controller.view];
    controller.view.frame = self.view.bounds;
    controller.view.autoresizingMask = self.view.autoresizingMask;
    
    
//    NSDictionary * lastModifiedDate = @{
//                                        @"video_fields":@"lastModifiedDate"
//                                        };

    //,name,shortDescription,videoStillURL,id,playsTotal
    
    BCOVCatalogService *catalog = [[BCOVCatalogService alloc] initWithToken:token];
    [catalog findPlaylistWithPlaylistID:playlistID
                             parameters:nil
                             completion:^(BCOVPlaylist *playlist,
                                          NSDictionary *jsonResponse,
                                          NSError      *error) {
                                 
                                 [controller setVideos:playlist];
                                 self.videoPlaylist = playlist;
                                 [controller play];
//
//                                 NSLog(@"Video Fields: %@", catalog.requestFactory.defaultVideoFields);
//                                 
//                                 NSLog(@"Videos :%@", self.videoPlaylist.videos);
//                                 
//                                 NSLog(@"Videos Properties :%@", self.videoPlaylist.properties);
//                                 
//                                 for (BCOVVideo  *tempVideo in self.videoPlaylist.videos) {
//                                     
//                                     NSDictionary *dictVideoProperties = tempVideo.properties;
//                                     NSLog(@"Dictionary of Video Properties : %@", dictVideoProperties);
//                                     
//                                 }
//
                                 
                             }];
    
    
    
//    self.mediaRequestFactory = [[BCOVMediaRequestFactory alloc] initWithToken:@"QlQTjjSbZaxiap_EZVsqde1E9OGuuSMfo-on79brCTzSOp96obJpUA.." baseURLString:@"http://api.brightcove.com/services/library"];
//    self.catalog = [[BCOVCatalogService alloc] initWithMediaRequestFactory:self.mediaRequestFactory];
//    
//    self.controller = [[BCOVPlayerSDKManager sharedManager] createPlaybackControllerWithViewStrategy:[self viewStrategy]];
//    self.controller.view.frame = self.view.bounds;
//    [self.view addSubview:self.controller.view];
//    
//    
//    // To ask for additional information - you can pass information to parameters
//    NSArray *fields = [self.catalog.requestFactory.defaultVideoFields arrayByAddingObject:@"tags"];
//    
//    NSDictionary *videoFields = @{@"video_fields": [fields componentsJoinedByString:@","]};
//    
//    [self.catalog
//     findPlaylistWithPlaylistID:@"2693590768001" parameters:videoFields
//     completion:^(BCOVPlaylist *playlist, NSDictionary *jsonResponse, NSError *error) {
//         
//         if(playlist){
//             self.controller.autoAdvance = YES;
//             self.controller.autoPlay = YES;
//             [self.controller setVideos:playlist];
//             
//             [self.controller play];
//         }
//     }];
//    
//    NSLog(@"%@", self.catalog.requestFactory.defaultVideoFields);
//    
//     //To ask for additional information - you can pass information to parameters
//    //NSArray *fields = [self.catalog.requestFactory.defaultVideoFields arrayByAddingObject:@"tags"];
//    
//    //NSDictionary *videoFields = @{@"video_fields": [fields componentsJoinedByString:@","]};
//    
//   // [self.catalog findvideowith]
//    
//    [self.catalog findVideoWithReferenceID:@"referenceID" parameters:videoFields completion:^(BCOVVideo *video, NSDictionary *jsonResponse, NSError *error) {
//        if(video){
//            
//            //Getting properties from the video, these keys can be found in BCOVCatalogConstants.h
//            NSLog(@"Name: %@", video.properties[kBCOVCatalogJSONKeyName]);
//            NSLog(@"Description: %@", video.properties[kBCOVCatalogJSONKeyShortDescription]);
//            
//            //Custom field:
//            NSLog(@"Tags: %@", video.properties[@"tags"]);
//            
//            //Sources from the video can be accessed by the following:
//            [video.sources enumerateObjectsUsingBlock:^(BCOVSource *source, NSUInteger idx, BOOL *stop) {
//                NSLog(@"Source %i, Delivery Method: %@ URL: %@", idx, source.deliveryMethod, source.url);
//                
//                //There are other values of importance that are stored in source properties
//                NSLog(@"Source %i, Properties %@", idx, source.properties);
//            }];
//        }
//    }];
//

}

- (id)viewStrategy
{
    // Most apps can create a playback controller with a `nil` view strategy,
    // but for the purposes of this demo we use the stock controls.
    return [[BCOVPlayerSDKManager sharedManager] defaultControlsViewStrategy];
}
@end
