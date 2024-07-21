const std = @import("std");
const builtin = @import("builtin");

test "zrrp testing" {
    try std.testing.expect(1 + 1 == 2);
}

test "this will be skipped" {
    return error.SkipZigTest;
}

fn IsATest() bool {
    return builtin.is_test;
}
