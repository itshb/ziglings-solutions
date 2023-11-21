const std = @import("std");

pub fn main() !void {
    const num1: u8 = 5; // Fixed the exercise to the const correct..!
    const num1_pointer: *const u8 = &num1; // Same C/C++ syntax! (*ptr, &address)

    var num2: u8 = undefined; // Does initialize to 0xAA! (thoughts from previous exercise)
    num2 = num1_pointer.*; // Interesting that we dereference afterwards, but okay

    std.debug.print("num1: {}, num2: {}\n", .{ num1, num2 });
}
