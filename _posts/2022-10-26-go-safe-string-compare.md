Three-way string comparison is widely used in programming. But up to now (Go 1.19), the strings.Compare function in the standard library is (intentionally) implemented with a non-opitimized way:

func Compare(a, b string) int {
	// NOTE(rsc): This function does NOT call the runtime cmpstring function,
	// because we do not want to provide any performance justification for
	// using strings.Compare. Basically no one should use strings.Compare.
	// As the comment above says, it is here only for symmetry with package bytes.
	// If performance is important, the compiler should be changed to recognize
	// the pattern so that all code doing three-way comparisons, not just code
	// using strings.Compare, can benefit.
	if a == b {
		return 0
	}
	if a < b {
		return -1
	}
	return +1
}
When comparing two unequal strings, the implementation will perform two comparison operations. Whereas a perfect implementation only needs one, just like the implementation of bytes.Compare shown below, in which bytealg.Compare is impplemented using assembly code on most architectures.

func Compare(a, b []byte) int {
	return bytealg.Compare(a, b)
}
The strings.Compare implementation is comparatively inefficent for the cases in which the two operand strings are unequal and they share a common non-blank prefix. Such cases are not rare.

Benchmark code constantly shows strings.Compare uses 2x CPU time of bytes.Compare for any two unequal byte sequences which share a common prefix.

The internal comment for the current strings.Compare implementation is some interesting. The comment suggests that we should not use strings.Compare in Go at all, but no alternative efficient ways are available now yet. It mentions that the compiler should make sppecial optimizations to automatically convert the code using comparision operators into internal three-way comparisons if possible. However, such compiler optimizations have never been made, and are not even planned to make yet. Personally, I doubt such optimizations are feasible to make for any use case. So I think the strings.Compare should be implemented efficiently, to avoid breaking user expectations.

