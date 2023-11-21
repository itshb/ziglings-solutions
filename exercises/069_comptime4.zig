const print = @import("std").debug.print;

pub fn main() !void {
    const s1 = makeSequence(u8, 3);
    const s2 = makeSequence(u32, 5);
    const s3 = makeSequence(i64, 7);

    print("s1={any}, s2={any}, s3={any}\n", .{ s1, s2, s3 });
}

fn makeSequence(comptime T: type, comptime size: usize) [size]T {
    var sequence: [size]T = undefined;
    var i: usize = 0;

    while (i < size) : (i += 1) {
        sequence[i] = @as(T, @intCast(i)) + 1;
    }

    return sequence;
}
