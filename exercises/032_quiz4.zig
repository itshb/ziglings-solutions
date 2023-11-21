const std = @import("std");

const NumError = error{IllegalNumber};

pub fn main() !void { // add !void
    const stdout = std.io.getStdOut().writer();

    const my_num: u32 = getNumber() catch 42; // add catch

    try stdout.print("my_num={}\n", .{my_num}); // quiz should output 42
}

// This function is obviously weird and non-functional. But you will not be changing it for this quiz.
fn getNumber() NumError!u32 {
    if (false) return NumError.IllegalNumber;
    return 42;
}
