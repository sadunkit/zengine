const std = @import("std");
const MyError = error{ TestErrorZrrp, IterationCompleted };

const MyErrorE = error{TestErrorZrrpE};

const MergedError = MyError || MyErrorE;

/// ---
fn canError() MergedError![]u8 {
    return error.TestErrorZrrpE;
}

var x: u32 = 0;
const itLimit = 10;
/// ---
fn errorIt() MergedError!u32 {
    if (x > 10) {
        return error.IterationCompleted;
    }
    x += 1;
    return x;
}

test "error-tests" {
    const result = canError();
    const expected = error.TestErrorZrrpE;
    std.testing.expectError(expected, result) catch |err| {
        std.debug.print("Error: {}\n", .{err});
    };

    var sum: u32 = 0;
    while (errorIt()) |v| {
        sum += v;
    } else |_| {} // Just discard this error

    try std.testing.expectEqual(66, sum);
}
