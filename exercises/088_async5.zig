const print = @import("std").debug.print;

pub fn main() void {
    var myframe = async getPageTitle("http://example.com");

    var value = await myframe;

    print("{s}\n", .{value});
}

fn getPageTitle(url: []const u8) []const u8 {
    // Please PRETEND this is actually making a network request.
    _ = url;
    return "Example Title.";
}
