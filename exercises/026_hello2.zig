const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    try stdout.print("Hello world!\n", .{}); // std out writer can fail -- must prefix with `try`
    stdout.print("Hello world!\n", .{}) catch std.debug.print("stdout failed\n", .{}); // or catch it..
    stdout.print("Hello world!\n", .{}) catch return;
}
