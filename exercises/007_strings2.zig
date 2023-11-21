const std = @import("std");
const print = std.debug.print; // can alias functions :O

pub fn main() void {
    const lyrics =
        \\Ziggy played guitar
        \\Jamming good with Andrew Kelley
        \\And the Spiders from Mars"
    ;

    print("{s}\n", .{lyrics});
}
