const std = @import("std");

pub fn main() void {
    const zen12: *const [21]u8 = "Memory is a resource.";

    const zen_manyptr: [*]const u8 = zen12; // [*] == unknown size of pointers -- So is this equivalent to a vector, or does the compiler specify it's length? -- comptime (I think, kept getting pointless discard errors during testing..)

    const zen12_string: []const u8 = zen_manyptr[0..21];

    std.debug.print("{s}\n", .{zen12_string});
}
