//
//  FormTCell.m
//  XLListViewDemo
//
//  Created by ddSoul on 2018/5/9.
//  Copyright © 2018年 dxl. All rights reserved.
//

#import "FormTCell.h"

NSString * const XLFormRowDescriptorTypeSelectorFDActionSheet = @"XLFormRowDescriptorTypeSelectorFDActionSheet";

@interface FormTCell()

@property (nonatomic, strong) NSString *ss;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
- (IBAction)Btn:(id)sender;

@end

@implementation FormTCell


+ (void)load {
    
    [XLFormViewController.cellClassesForRowDescriptorTypes setObject:NSStringFromClass([FormTCell class]) forKey:XLFormRowDescriptorTypeSelectorFDActionSheet];
}
-(NSString *)valueDisplayText {
    NSLog(@"____dis");
        return [self.rowDescriptor.value displayText];
};

- (void)update {
    [super update];
    [self valueDisplayText];
    NSLog(@"____update");
}
- (void)configure {
    [super configure];
    NSLog(@"____cofige");
}

+ (CGFloat)formDescriptorCellHeightForRowDescriptor:(XLFormRowDescriptor *)rowDescriptor
{
    return 44;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)Btn:(id)sender {
    if (self.rowDescriptor.action.formBlock){
        self.rowDescriptor.action.formBlock(self.rowDescriptor);
    }
//    self.rowDescriptor.action.formBlock(self.rowDescriptor);
//    self.rowDescriptor.onChangeBlock(nil, nil, self.rowDescriptor);
}
@end
