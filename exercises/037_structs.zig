const std = @import("std");

const Role = enum { wizard, thief, bard, warrior };

const Character = struct {
    role: Role,
    gold: u32,
    experience: u32,
    health: u8 = 100,
};

pub fn main() !void {
    var glorp_the_wise = Character{ // NOTE: Exercise wanted to initialize `health` here, but wanted to test if you could default initialize.
        .role = Role.wizard,
        .gold = 20,
        .experience = 10,
    };

    glorp_the_wise.gold += 5;

    glorp_the_wise.health -= 10;

    std.debug.print("Your wizard had {} health and {} gold.\n", .{
        glorp_the_wise.health,
        glorp_the_wise.gold,
    });
}
