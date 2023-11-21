const std = @import("std");

const InsectStat = enum { flowers_visited, still_alive };

const Insect = union(InsectStat) { // Tagged union (only supports enums as tag) -- Seems like unions(& tagged) are twice the size of the largest type.. (u32 == @sizeOf(u128) in testing)
    flowers_visited: u16,
    still_alive: bool,
};

pub fn main() !void {
    var ant = Insect{ .still_alive = true };
    var bee = Insect{ .flowers_visited = 16 };

    std.debug.print("Insect report! ", .{});

    printInsect(ant);
    printInsect(bee);

    std.debug.print("\n", .{});
}

fn printInsect(insect: Insect) void {
    switch (insect) { // checking the tag
        .still_alive => |a| std.debug.print("Ant alive is: {}. ", .{a}),
        .flowers_visited => |f| std.debug.print("Bee visited {} flowers. ", .{f}),
    }
}
