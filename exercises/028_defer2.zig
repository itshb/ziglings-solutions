const std = @import("std");

pub fn main() !void { // Note: !void signifies the function can fail
    const animals = [_]u8{ 'g', 'c', 'd', 'd', 'g', 'z' };
    for (animals) |animal| printAnimal(animal);

    std.debug.print("done.\n", .{});
}

fn printAnimal(animal: u8) void {
    std.debug.print("(", .{});
    defer std.debug.print(") ", .{});

    const print = std.debug.print;
    if (animal == 'g') {
        print("Goat", .{});
        return;
    }
    if (animal == 'c') {
        print("Cat", .{});
        return;
    }
    if (animal == 'd') {
        print("Dog", .{});
        return;
    }

    print("Unknown", .{});
}
