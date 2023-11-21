const std = @import("std");

pub fn main() !void {
    const a: u8 = 12;
    const b: *const u8 = &a; // Sorry, already figured this out in the previous exercise where I fixed it for const-correctness..

    std.debug.print("a: {}, b: {}\n", .{ a, b.* });
}
