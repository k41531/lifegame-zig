const std = @import("std");
const print = std.debug.print;
const DefaultPrng = std.rand.DefaultPrng;
const time = std.time;
const os = std.os;

const N: u32 = 40;
const M: u32 = 40;

var mat = [_]bool{false} ** (N * M);

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

fn update() void {
    const mem = std.mem;
    var tmp = [_]bool{false} ** (N * M);
    mem.copy(bool, &tmp, &mat);
    for (mat) |_, i| {
        const n: u32 = @intCast(u32, i);
        const row: u32 = n / N;
        const col: u32 = n % M;
        const count = liveNeighborCount(row, col, &tmp);
        if (count < 2 or 3 < count) {
            mat[i] = false;
        } else if (count == 3) {
            mat[i] = true;
        }
    }
}

fn createUniverse(matrix: []bool) void {
    var rand = DefaultPrng.init(@intCast(u64, time.milliTimestamp()));
    for (matrix) |_, i| {
        matrix[i] = rand.random().boolean();
    }
}

fn clear() void {
    print("\x1B[2J\x1B[H", .{});
}

fn liveNeighborCount(row: u32, col: u32, matrix: []bool) u8 {
    var count: u8 = 0;
    var j: isize = -1;
    while (j < 2) : (j += 1) {
        var i: isize = -1;
        while (i < 2) : (i += 1) {
            if (i == 0 and j == 0) {
                continue;
            }
            const r = @intCast(u32, @mod((row + i), N));
            const c = @intCast(u32, @mod((col + j), M));
            const idx = getIndex(r, c);
            if (matrix[idx]) {
                count += 1;
            }
        }
    }

    return count;
}

pub fn main() void {
    createUniverse(&mat);

    while (true) {
        showMatrix(&mat);
        update();
        time.sleep(100000000);
        clear();
    }
}
