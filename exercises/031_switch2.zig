const std = @import("std");

pub fn main() void {
    const lang_chars = [_]u8{ 26, 9, 7, 42 };

    for (lang_chars) |c| {
        const real_char: u8 = switch (c) {
            1 => 'A',
            2 => 'B',
            3 => 'C',
            4 => 'D',
            5 => 'E',
            6 => 'F',
            7 => 'G',
            8 => 'H',
            9 => 'I',
            10 => 'J',
            25 => 'Y',
            26 => 'Z',
            // As in the last exercise, please add the 'else' clause
            // and this time, have it return an exclamation mark '!'.
            else => '!',
        };

        std.debug.print("{c}", .{real_char});
    }

    std.debug.print("\n", .{});
}
