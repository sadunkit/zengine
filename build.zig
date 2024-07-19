const std = @import("std");
const os = std.os;
// const target = b.standardTargetOptions(.{});

pub fn build(b: *std.Build) !void {
    const version = b.option([]const u8, "version", "application version string") orelse "0.0.1";
    const app = b.option([]const u8, "app", "application name") orelse "zrrp";
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});

    const options = b.addOptions();
    options.addOption([]const u8, "version", version);

    const subpath = try std.fmt.allocPrint(b.allocator, "{s}.zig", .{app});

    const exe = b.addExecutable(.{
        .name = app,
        .root_source_file = b.path(subpath),
        .target = target,
        .optimize = optimize,
    });

    b.installArtifact(exe);
}
