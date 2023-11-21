const std = @import("std");

pub fn main() !void {
    const shuttle_weight: f32 = 0.453592 * 448e4;

    std.debug.print("Shuttle liftoff weight: {d:.3}kg\n", .{shuttle_weight});
}
