const std = @import("std");
const print = std.debug.print;
const DefaultPrng = std.rand.DefaultPrng;
const time = std.time;

fn getRandomBool() bool {
    var rand = DefaultPrng.init(@intCast(u64, time.milliTimestamp()));
    return rand.random().boolean();
}

fn randomCell() void {}

pub fn main() void {
    const N = 10;
    const M = 10;
    const mat = [_]bool{false} ** (N * M);

    const x = getRandomBool();
    print("Hello, world!\n", .{});
    print("Hello, world!{}\n", .{mat[0]});
    print("Hello, random!{}\n", .{x});
    print("Hello, random!{}\n", .{time.nanoTimestamp()});
}
