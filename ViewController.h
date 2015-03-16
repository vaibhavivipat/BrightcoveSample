//
//  ViewController.h
//  BrightcoveDemo
//
//  Created by Vaibhavi on 20/11/14.
//  Copyright (c) 2014 TCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BCOVPlaybackController;
@class BCOVCatalogService;
@class BCOVMediaRequestFactory;

#import "BCOVPlaylist.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) id<BCOVPlaybackController> controller;
@property (strong, nonatomic) BCOVCatalogService *catalog;
@property (strong, nonatomic) BCOVMediaRequestFactory *mediaRequestFactory;
@property (strong, nonatomic) BCOVPlaylist *videoPlaylist;

@end

