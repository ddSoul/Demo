//
//  ViewController.m
//  XLAudioUnit
//
//  Created by ddSoul on 2018/3/25.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "ViewController.h"
#import <AudioUnit/AudioUnit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //构建AVAudioSession
    NSError *error;
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];
    
    
    //构建AudioUnit描述体
    AudioComponentDescription ioUnitDescription;
    ioUnitDescription.componentType = kAudioUnitType_Output;
    ioUnitDescription.componentSubType = kAudioUnitSubType_RemoteIO;
    
    //根据描述构造AudioUnit两种方式
    //1.裸创建方式
    AudioComponent ioUnitRef = AudioComponentFindNext(NULL, &ioUnitDescription);
    AudioUnit ioUnitInstance;
    AudioComponentInstanceNew(ioUnitRef, &ioUnitInstance);
    
    //2.AUGraph
    AUGraph processingGraph;
    NewAUGraph(&processingGraph);
    AUNode ioNode;
    AUGraphAddNode(processingGraph, &ioUnitDescription, &ioNode);
    
    AUGraphOpen(processingGraph);
    
    AudioUnit ioUnit;
    AUGraphNodeInfo(processingGraph, ioNode, NULL, &ioUnit);
    
//   kAudioUnitSubType_RemoteIO
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
