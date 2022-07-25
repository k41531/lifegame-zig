const print = @import("std").debug.print;

pub fn main() void {
    const row = [_]bool{false} ** 10;
    const mat = [4][4]bool{ [_]bool{false} ** 4, [_]bool{false} ** 4, [_]bool{false} ** 4, [_]bool{false} ** 4 };
    print("Hello, world!\n", .{});
    print("Hello, world!{}\n", .{row[0]});
    print("Hello, world!{}\n", .{mat[1][1]});
}
