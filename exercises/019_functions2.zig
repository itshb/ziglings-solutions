const std = @import("std");

pub fn main() void {
    std.debug.print("Powers of to: {} {} {} {}\n", .{
        twoToThe(1),
        twoToThe(2),
        twoToThe(3),
        twoToThe(4),
    });
}

fn twoToThe(n: u32) u32 {
    return std.math.pow(u32, 2, n);
}
