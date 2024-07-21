const std = @import("std");
const engine = @import("engine/engine.zig");

var gEngine: engine = undefined;
pub fn main() !void {
    gEngine = try engine.new();

    try gEngine.init();
    defer gEngine.deinit();
    // module manager

    // game loop

    while (true) {}
}
