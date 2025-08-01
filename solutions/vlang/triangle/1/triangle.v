module main

fn is_triangle(a f64, b f64, c f64) bool {
	return a > 0 && b > 0 && c > 0 && 
			a + b > c && b + c > a && c + a > b
}

fn two_equal(a f64, b f64, c f64) bool {
	return a == b || b == c || c == a
}

fn is_isosceles(a f64, b f64, c f64) bool {
	return is_triangle(a, b, c) && two_equal(a, b, c)
}

fn is_equilateral(a f64, b f64, c f64) bool {
	return is_triangle(a, b, c) && a == b && b == c
}

fn is_scalene(a f64, b f64, c f64) bool {
	return is_triangle(a, b, c) && !two_equal(a, b, c)
}