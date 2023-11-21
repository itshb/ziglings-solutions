const std = @import("std");

pub fn main() !void {
    const lang_chars = [_]u8{ 26, 9, 7, 42 };
    for (lang_chars) |c| {
        switch (c) {
            1 => std.debug.print("A", .{}),
            2 => std.debug.print("B", .{}),
            3 => std.debug.print("C", .{}),
            4 => std.debug.print("D", .{}),
            5 => std.debug.print("E", .{}),
            6 => std.debug.print("F", .{}),
            7 => std.debug.print("G", .{}),
            8 => std.debug.print("H", .{}),
            9 => std.debug.print("I", .{}),
            10 => std.debug.print("J", .{}),
            25 => std.debug.print("Y", .{}),
            26 => std.debug.print("Z", .{}),
            else => std.debug.print("?", .{}), // `else` instead of `default`
        }
    }

    std.debug.print("\n", .{});

    // Not part of the zigligs exercise..
    var n: u16 = 1;
    while (n < 8) : (n += 1) {
        Fallthrough(n);
    }
}

fn Fallthrough(n: u16) void {
    switch (n) {
        1, 2, 3 => std.debug.print("1, 2, 3\n", .{}),
        4...6 => std.debug.print("4..5..6\n", .{}),
        else => std.debug.print("..else..\n", .{}),
    }
}
