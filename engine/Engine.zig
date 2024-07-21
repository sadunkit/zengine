const TEngine = @This();

pub fn init(_: TEngine) !void {}
pub fn deinit(_: TEngine) !void {}

pub fn new() !TEngine {
    return .{};
}
