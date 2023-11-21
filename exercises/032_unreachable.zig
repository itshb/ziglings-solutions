const std = @import("std");

pub fn main() !void {
    const operations = [_]u8{ 1, 1, 1, 3, 2, 2 };

    var current_value: u32 = 0;

    for (operations) |op| {
        switch (op) {
            1 => {
                current_value += 1;
            },
            2 => {
                current_value -= 1;
            },
            3 => {
                current_value *= current_value;
            },
            else => unreachable,
        }

        std.debug.print("{} ", .{current_value});
    }

    std.debug.print("\n", .{});

    Test(0);
    Test(1);
}

fn Test(n: u16) void { // Doesn't return an error
    switch (n) {
        0 => std.debug.print("danger\n", .{}),
        else => unreachable, // throws an error -- results in: `panic: reached unreachable code` & it includes the line! Zig error messages <3 C++ truly need to learn from this..
    }
}
