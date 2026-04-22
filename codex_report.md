# Dependency check failure

Repository: `jade-ui`

Command sequence:

1. `moon check`
2. `moon add rami3l/js-ffi`
3. `moon check`

The failure is still inside dependency `rami3l/js-ffi` after attempting to update/add that dependency.

`moon check` fails while checking package `rami3l/js-ffi/js` under `.mooncakes/rami3l/js-ffi`.

Errors:

- `.mooncakes/rami3l/js-ffi/src/js/object.mbt:14:8`: Type `Object` has no method `inner`.
- `.mooncakes/rami3l/js-ffi/src/js/object.mbt:55:8`: Type `Object` has no method `inner`.
- `.mooncakes/rami3l/js-ffi/src/js/object.mbt:60:8`: Type `Object` has no method `inner`.
- `.mooncakes/rami3l/js-ffi/src/js/value.mbt:147:13`: Type `Object` has no method `inner`.
- `.mooncakes/rami3l/js-ffi/src/js/value.mbt:149:11`: Type `Object` has no method `inner`.

Summary: dependency `rami3l/js-ffi` version `0.4.0` is incompatible with the current MoonBit toolchain or its own package sources. The repository check cannot proceed until that dependency is fixed or replaced.
