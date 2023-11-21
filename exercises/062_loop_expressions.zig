const print = @import("std").debug.print;

pub fn main() !void {
    // NOTE: Has to be a way for below to work without creating a third variable.. (making `sum` be an inlined for loop expression)
    // const arr = [_]u16{5, 5, 5, 5, 5};
    // const sum: u16 = inline for(0..) |n| sum += n else 0;

    const langs: [6][]const u8 = .{ "Erlang", "Algol", "C", "OCaml", "Zig", "Prolog" };

    const current_lang: ?[]const u8 = for (langs) |lang| {
        if (lang.len == 3) break lang;
    } else null;

    if (current_lang) |cl| {
        print("Current language: {s}\n", .{cl});
    } else {
        print("Did not find a three-letter language name. :-(\n", .{});
    }
}
