# es4x-mandel

Quick experiment on running [es4x](https://github.com/reactiverse/es4x) with [mandrel](https://github.com/graalvm/mandrel).

Mandrel is a custom build of [graalvm](https://github.com/oracle/graal). This prototype shows that the the `jvmci` bits are already available in `mandrel` so we can avoid pulling them from `maven central`.

Mandrel however does not include any of the `polyglot` languages, so in order to run `js` we still depend on a few artifacts that are available on `maven central`:

* [org.graalvm.js:js:20.3.0](https://search.maven.org/artifact/org.graalvm.js/js/20.3.0/jar)
* [org.graalvm.regex:regex:20.3.0](https://search.maven.org/artifact/org.graalvm.regex/regex/20.3.0/jar)
* [com.ibm.icu:icu4j:67.1](https://search.maven.org/artifact/com.ibm.icu/icu4j/67.1/jar)

And optionally if profiling and debugging are to be used:

* [org.graalvm.tools:chromeinspector:20.3.0](https://search.maven.org/artifact/org.graalvm.tools/chromeinspector/20.3.0/jar)
* [org.graalvm.tools:profiler:20.3.0](https://search.maven.org/artifact/org.graalvm.tools/profiler/20.3.0/jar)

## Lanching es4x

To launch `es4x` on `mandrel` and reuse the provided `jvmci` the following command should be used:

```sh
#!/usr/bin/env bash
MANDREL_HOME=/home/paulo/.jabba/jdk/mandrel@20.3.0

$MANDREL_HOME/bin/java \
  -XX:+UnlockExperimentalVMOptions \
  -XX:+EnableJVMCI \
  --upgrade-module-path=$MANDREL_HOME/lib/truffle:$MANDREL_HOME/lib/jvmci \
  -jar \
  ./node_modules/.bin/es4x-launcher.jar
```

## TODO

The `pm` tools should be able to identify when the target VM is mandrel and avoid pulling the `jvmci` bits from maven, instead just use what is offered like the script above.
