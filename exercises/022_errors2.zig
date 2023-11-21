const std = @import("std");

const MyNumberError = error{TooSmall};

pub fn main() void {
    var my_number: MyNumberError!u16 = 5; // order matters: error!type

    my_number = MyNumberError.TooSmall;

    std.debug.print("I compiled!\n", .{});
}
