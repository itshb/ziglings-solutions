const print = @import("std").debug.print;

const Duck = struct {
    eggs: u8,
    loudness: u8,
    location_x: i32 = 0,
    location_y: i32 = 0,

    fn waddle(self: *Duck, x: i16, y: i16) void {
        self.location_x += x;
        self.location_y += y;
    }

    fn quack(self: Duck) void {
        if (self.loudness < 4) {
            print("\"Quack.\" ", .{});
        } else {
            print("\"QUACK!\" ", .{});
        }
    }
};

const RubberDuck = struct {
    in_bath: bool = false,
    location_x: i32 = 0,
    location_y: i32 = 0,

    fn waddle(self: *RubberDuck, x: i16, y: i16) void {
        self.location_x += x;
        self.location_y += y;
    }

    fn quack(self: RubberDuck) void {
        _ = self;
        print("\"Squeek!\" ", .{});
    }

    fn listen(self: RubberDuck, dev_talk: []const u8) void {
        _ = dev_talk;
        self.quack();
    }
};

const Duct = struct {
    diameter: u32,
    length: u32,
    galvanized: bool,
    connection: ?*Duct = null,

    fn connect(self: *Duct, other: *Duct) !void {
        if (self.diameter == other.diameter) {
            self.connection = other;
        } else {
            return DuctError.UnmatchedDiameters;
        }
    }
};

const DuctError = error{UnmatchedDiameters};

pub fn main() void {
    var ducky1 = Duck{
        .eggs = 0,
        .loudness = 3,
    };

    var ducky2 = RubberDuck{
        .in_bath = false,
    };

    var ducky3 = Duct{
        .diameter = 17,
        .length = 165,
        .galvanized = true,
    };

    print("ducky1: {}, ", .{isADuck(ducky1)});
    print("ducky2: {}, ", .{isADuck(ducky2)});
    print("ducky3: {}\n", .{isADuck(ducky3)});
}

fn isADuck(possible_duck: anytype) bool {
    // We'll use @hasDecl() to determine if the type has
    // everything needed to be a "duck".
    //
    // In this example, 'has_increment' will be true if type Foo
    // has an increment() method:
    //
    //     const has_increment = @hasDecl(Foo, "increment");
    //
    // Please make sure MyType has both waddle() and quack()
    // methods:
    const MyType = @TypeOf(possible_duck);
    const walks_like_duck = @hasDecl(MyType, "waddle"); // C++ didn't get concepts until C++20.....
    const quacks_like_duck = @hasDecl(MyType, "quack"); // C++ didn't get concepts until C++20.....

    const is_duck = walks_like_duck and quacks_like_duck;

    if (is_duck) {
        possible_duck.quack();
    }

    return is_duck;
}
