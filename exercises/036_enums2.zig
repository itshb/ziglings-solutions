const std = @import("std");

const Color = enum(u32) { red = 0xFF0000, green = 0x00FF00, blue = 0x0000FF };

pub fn main() !void {
    std.debug.print(
        \\<p>
        \\  <span style="color: #{x:0>6}">Red</span>
        \\  <span style="color: #{x:0>6}">Green</span>
        \\  <span style="color: #{x:0>6}">Blue</span>
        \\</p>
        \\
    , .{
        @intFromEnum(Color.red),
        @intFromEnum(Color.green),
        @intFromEnum(Color.blue),
    });
}
