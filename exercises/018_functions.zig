const std = @import("std");

pub fn main() void {
    const answer: u8 = deepThought();

    std.debug.print("Anser to the Ultimate Question: {}\n", .{answer});
}

fn deepThought() u8 {
    return 42;
}
