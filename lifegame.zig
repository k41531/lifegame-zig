const std = @import("std");
const print = std.debug.print;
const DefaultPrng = std.rand.DefaultPrng;
const time = std.time;

const N = 10;
const M = 10;

fn randomCell() void {}

fn showMatrix(matrix: []const bool) void {
    for (matrix) |c, i| {
        if (c) {
            print("🟩", .{});
        } else {
            print("  ", .{});
        }
        if ((i + 1) % N == 0) {
            print("\n", .{});
        }
    }
}

fn getIndex(row: u32, col: u32) usize {
    return (row * N + col);
}

fn createUniverse(matrix: []bool) void {
    var rand = DefaultPrng.init(@intCast(u64, time.milliTimestamp()));
    for (matrix) |_, i| {
        matrix[i] = rand.random().boolean();
        print("{}\n", .{matrix[i]});
    }
}

pub fn main() void {
    var mat = [_]bool{false} ** (N * M);
    createUniverse(&mat);

    print("Hello, world!\n", .{});
    print("Hello, world!{}\n", .{mat[0]});
    print("Hello, random!{}\n", .{time.nanoTimestamp()});
    showMatrix(&mat);
}
