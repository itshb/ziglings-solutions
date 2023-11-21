const std = @import("std");

pub fn main() !void {
    var letter: u8 = 'A';
    const my_letter: ?*[1]u8 = &letter;

    std.debug.print("Letter: {u}\n", .{my_letter.?.*[0]});
}
