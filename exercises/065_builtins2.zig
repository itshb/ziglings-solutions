const print = @import("std").debug.print;

const Narcissus = struct {
    me: *Narcissus = undefined,
    myself: *Narcissus = undefined,
    echo: void = undefined,

    fn fetchTheMostBeautifulType() type {
        return @This();
    }
};

pub fn main() !void {
    var narcissus: Narcissus = Narcissus{};
    narcissus.me = &narcissus;
    narcissus.myself = narcissus.me;

    const Type1 = @TypeOf(narcissus, narcissus.me.*, narcissus.myself.*);
    const Type2 = Narcissus.fetchTheMostBeautifulType();
    print("A {s} loves all {s}es. ", .{ maximumNarcissism(Type1), maximumNarcissism(Type2) });

    print("He has room in his heart for:", .{});

    const fields = @typeInfo(Narcissus).Struct.fields;

    if (fields[0].type != void) {
        print(" {s}", .{@typeInfo(Narcissus).Struct.fields[0].name});
    }
    if (fields[1].type != void) {
        print(" {s}", .{@typeInfo(Narcissus).Struct.fields[1].name});
    }
    if (fields[2].type != void) {
        print(" {s}", .{@typeInfo(Narcissus).Struct.fields[2].name});
    }

    print(".\n", .{});
}

fn maximumNarcissism(myType: anytype) []const u8 {
    return @typeName(myType)[14..];
}
