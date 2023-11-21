const std = @import("std"); // NOTE: to future self, turn this into a god damn macro........ (incl. `pub fn main() void {}`)

const Role = enum {
    wizard,
    thief,
    bard,
    warrior,
};

const Character = struct {
    role: Role,
    gold: u32,
    health: u8,
    experience: u32,
};

pub fn main() !void {
    var chars: [2]Character = undefined; // undefined initializes(?) to `0xAA`

    // Glorp the Wise
    chars[0] = Character{
        .role = Role.wizard,
        .gold = 20,
        .health = 100,
        .experience = 10,
    };

    // Zump the Loud
    chars[1] = Character{
        .role = Role.bard,
        .gold = 10,
        .health = 100,
        .experience = 20,
    };

    for (chars, 0..) |c, num| {
        std.debug.print("Character: {} - G:{} H:{} XP:{}\n", .{
            num + 1, c.gold, c.health, c.experience,
        });
    }
}
