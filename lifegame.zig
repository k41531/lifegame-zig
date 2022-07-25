const std = @import("std");
const print = std.debug.print;
const DefaultPrng = std.rand.DefaultPrng;
const time = std.time;

fn getRandomBool() bool {
    var rand = DefaultPrng.init(@intCast(u64, time.milliTimestamp()));
    return rand.random().boolean();
}

fn randomCell() void {}

fn showMatrix(matrix: []const bool, N: u32) void {
    for (matrix) |_, i| {
        print("🟩", .{});
        if ((i + 1) % N == 0) {
            print("\n", .{});
        }
    }
}

pub fn main() void {
    const N = 10;
    const M = 10;
    var mat = [_]bool{false} ** (N * M);

    const x = getRandomBool();
    print("Hello, world!\n", .{});
    print("Hello, world!{}\n", .{mat[0]});
    print("Hello, random!{}\n", .{x});
    print("Hello, random!{}\n", .{time.nanoTimestamp()});
    showMatrix(&mat, N);
}
