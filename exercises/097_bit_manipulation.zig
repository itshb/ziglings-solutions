const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    var x: u8 = 1;
    var y: u8 = 0;

    x ^= y;
    y ^= x;
    x ^= y;

    print("x = {d}; y = {d}\n", .{ x, y });

    // Below is just a demonstration..
    var hello = [_:0]u8{ 'w', 'o', 'r', 'l', 'd' };
    var world = [_:0]u8{ 'h', 'e', 'l', 'l', 'o' };

    comptime var i = 0;
    inline while (i < @sizeOf(@TypeOf(hello))) : (i += 1) {
        hello[i] ^= world[i];
        world[i] ^= hello[i];
        hello[i] ^= world[i];
    }

    print("{s}, {s}!\n", .{ hello, world });
}
