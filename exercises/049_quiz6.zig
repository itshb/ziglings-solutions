const std = @import("std");

const Elephant = struct {
    letter: u8,
    tail: ?*Elephant = null,
    trunk: ?*Elephant = null,
    visited: bool = false,

    pub fn getTail(self: *Elephant) *Elephant {
        return self.tail.?; // Still remebering it means `orelse unreachable`, sir's @ ziglings
    }

    pub fn hasTail(self: *Elephant) bool {
        return self.tail != null; // Are pointers boolean convertable? Answer is no.. Time to unlearn years of omitting `!= nullptr`
    }

    pub fn getTrunk(self: *Elephant) *Elephant {
        return self.trunk.?;
    }

    pub fn hasTrunk(self: *Elephant) bool {
        return self.trunk != null;
    }

    pub fn visit(self: *Elephant) void {
        self.visited = true;
    }

    pub fn print(self: *Elephant) void {
        const v: u8 = if (self.visited) 0x76 else 0x20; // Apparently `v` is for `visited`
        std.debug.print("{u}{u} ", .{ self.letter, v });
    }
};

pub fn main() !void {
    var elephantA = Elephant{ .letter = 'A' };
    var elephantB = Elephant{ .letter = 'B' };
    var elephantC = Elephant{ .letter = 'C' };

    elephantA.tail = &elephantB;
    elephantB.tail = &elephantC;

    elephantB.trunk = &elephantA;
    elephantC.trunk = &elephantB;

    visitElephants(&elephantA);

    std.debug.print("\n", .{});
}

fn visitElephants(first_elephant: *Elephant) void {
    var e = first_elephant;

    while (true) {
        e.print();
        e.visit();

        if (e.hasTail()) e = e.getTail() else break;
    }

    while (true) {
        e.print();

        if (e.hasTrunk()) e = e.getTrunk() else break;
    }
}
