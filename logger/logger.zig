const std = @import("std");

const GREEN = "\x1b[32m";
const CYAN = "\x1b[36m";
const WHITE = "\x1b[37";
const YELLOW = "\x1b[33m";
const RED = "\x1b[31m";
const BOLD = "\x1b[1m";
const DIM = "\x1b[2m";
const RESET = "\x1b[0m";

// .black => "\x1b[30m",
// .red => "\x1b[31m",
// .green => "\x1b[32m",
// .yellow => "\x1b[33m",
// .blue => "\x1b[34m",
// .magenta => "\x1b[35m",
// .cyan => "\x1b[36m",
// .white => "\x1b[37m",
// .bright_black => "\x1b[90m",
// .bright_red => "\x1b[91m",
// .bright_green => "\x1b[92m",
// .bright_yellow => "\x1b[93m",
// .bright_blue => "\x1b[94m",
// .bright_magenta => "\x1b[95m",
// .bright_cyan => "\x1b[96m",
// .bright_white => "\x1b[97m",
// .bold => "\x1b[1m",
// .dim => "\x1b[2m",
// .reset => "\x1b[0m"

pub fn logError(comptime fmt: []const u8, args: anytype) void {
    var buf: [1024]u8 = undefined;
    if (std.fmt.bufPrint(&buf, fmt, args)) |s| {
        std.debug.print("{s}{s}Logg::Error:{s} {s}", .{ RED, BOLD, RESET, s });
    } else |_| {}
}

pub fn logWarning(comptime fmt: []const u8, args: anytype) void {
    var buf: [1024]u8 = undefined;
    if (std.fmt.bufPrint(&buf, fmt, args)) |s| {
        std.debug.print("{s}{s}Logg::Warning:{s} {s}", .{ YELLOW, BOLD, RESET, s });
    } else |_| {}
}

pub fn logInfo(comptime fmt: []const u8, args: anytype) void {
    var buf: [1024]u8 = undefined;
    if (std.fmt.bufPrint(&buf, fmt, args)) |s| {
        std.debug.print("{s}{s}Logg::Info:{s} {s}", .{ CYAN, BOLD, RESET, s });
    } else |_| {}
}

pub fn logSuccess(comptime fmt: []const u8, args: anytype) void {
    var buf: [1024]u8 = undefined;
    if (std.fmt.bufPrint(&buf, fmt, args)) |s| {
        std.debug.print("{s}{s}Logg::Success:{s} {s}", .{ GREEN, BOLD, RESET, s });
    } else |_| {}
}

test "logger tests" {
    logError("This is an error message: {s}\n", .{"Error"});
    logWarning("This is a warning message: {s}\n", .{"Warning"});
    logInfo("This is a debug message: {s}\n", .{"Debug"});
    logSuccess("This is a success message: {s}\n", .{"Success"});

    try std.testing.expect(true);
}
