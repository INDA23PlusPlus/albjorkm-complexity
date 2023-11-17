const std = @import("std");

var fun_had: usize = 0;

fn expIterative(x: f64, n: i32) f64 {
    var res: f64 = 1.0;

    for (0..@intCast(n)) |_| {
        //fun_had += 1;
        res *= x;
    }

    return res;
}

fn expRecursive(x: f64, n: i32) f64 {
    fun_had += 1;

    if (n <= 4) {
        fun_had += 1;
        return expIterative(x, n);
    }

    return expRecursive(x, @divFloor(n, 2)) *
           expRecursive(x, @divFloor(n + 1, 2));
}

pub fn main() void {
    //var r = expRecursive(2, 600);
    var r = expRecursive(1, 3000000);
    std.debug.print("expRecursive: {d}\nfun_had: {d}", .{r, fun_had});
}
