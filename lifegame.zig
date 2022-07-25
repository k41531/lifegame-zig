const print = @import("std").debug.print;

pub fn main() void {
    const N = 10;
    const M = 10;
    const row = [_]bool{false} ** N * M;
    print("Hello, world!\n", .{});
    print("Hello, world!{}\n", .{row[0]});
}
