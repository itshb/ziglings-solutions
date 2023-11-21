const std = @import("std");

pub fn main() !void {
    const zig = [_]u8{ // Solution: increment each value by 1.. (Nvim to the rescue: ctrl+k, jj, ctrl+a)
        0o132,
        0b1101001,
        0x67,
    };

    std.debug.print("{s} is cool.\n", .{zig});
}
