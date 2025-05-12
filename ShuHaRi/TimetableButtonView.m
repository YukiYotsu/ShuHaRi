//
//  TimetableButtonView.m
//  ShuHaRi
//
//  Created by Yuki on 2025/05/13.
//

#import "TimetableButtonView.h"

@implementation TimetableButtonView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:@"📅 Timetable" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        button.translatesAutoresizingMaskIntoConstraints = NO;
        [button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:button];

        [NSLayoutConstraint activateConstraints:@[
            [button.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
            [button.centerYAnchor constraintEqualToAnchor:self.centerYAnchor]
        ]];
    }
    return self;
}

- (void)buttonTapped {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ShowTimetableImage" object:nil];
}

@end
