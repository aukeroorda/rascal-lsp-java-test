# rascal-lsp-java-test

Trying to figure out why Rascal cannot find Java bindings. In the Eclipse environment, this was handled by adding to the classpath:
```xml
	<classpathentry kind="lib" path="lib/frink.jar"/>
	<classpathentry kind="lib" path="lib/fuzzywuzzy-1.3.0.jar"/>
```

## RASCAL.MF
- Not sure what the `Courses: courses` line is for
- The `Source: src` points to a directory that _does not_ include the Java libraries used; those are in the `lib` directory. The Java bindings themselves however are in `src/rascalJava/FuzzyWuzzyBinding.java`

## Reproduction steps
1. `code .` to open this repository in vscode
2. Open the file `src/FuzzyWuzzy.rsc` and click `Import in new Rascal terminal`
3. Rascal terminal output reads:
```java
INFO: detected |lib://rascal-lsp| at |jar+file:///Users/auke/.vscode/extensions/usethesource.rascalmpl-0.2.0/assets/jars/rascal-lsp.jar!/|
INFO: detected |lib://rascal| at |jar+file:///Users/auke/.vscode/extensions/usethesource.rascalmpl-0.2.0/assets/jars/rascal.jar!/|
WARNING: could not resolve dependency on: |lib://rascal-core/| because it does not seem to exist as a project or a library.
Rascal Version: 0.22.1
INFO: resolved |lib://rascal-lsp| at |jar+file:///Users/auke/.vscode/extensions/usethesource.rascalmpl-0.2.0/assets/jars/rascal-lsp.jar!/|
Rascal-lsp Version: 2.0.1-SNAPSHOT
pathConfig(
  javaCompilerPath=[
    |file:///Users/auke/.vscode/extensions/usethesource.rascalmpl-0.2.0/assets/jars/rascal-lsp.jar|,
    |file:///Users/auke/.vscode/extensions/usethesource.rascalmpl-0.2.0/assets/jars/rascal.jar|
  ],
  bin=|target://corel|,
  classloaders=[
    |target://corel|,
    |system:///|
  ],
  libs=[|lib://rascal|],
  srcs=[|file:///Users/auke/rascal-lsp-java-test/src|],
  courses=[])INFO: resolved |lib://rascal| at |jar+file:///Users/auke/.vscode/extensions/usethesource.rascalmpl-0.2.0/assets/jars/rascal.jar!/|
rascal>import FuzzyWuzzy;
org.rascalmpl.exceptions.JavaMethodLink: Cannot link method rascalJava.FuzzyWuzzyBinding because: class not found
        at org.rascalmpl.interpreter.utils.JavaBridge.getJavaClassInstance(JavaBridge.java:432)
        at org.rascalmpl.interpreter.result.JavaMethod.<init>(JavaMethod.java:95)
        at org.rascalmpl.interpreter.result.JavaMethod.<init>(JavaMethod.java:52)
        at org.rascalmpl.semantics.dynamic.FunctionDeclaration$Abstract.interpret(FunctionDeclaration.java:62)
        at org.rascalmpl.semantics.dynamic.Declaration$Function.interpret(Declaration.java:117)
        at org.rascalmpl.semantics.dynamic.Toplevel$GivenVisibility.interpret(Toplevel.java:35)
        at org.rascalmpl.semantics.dynamic.Module$Default.interpret(Module.java:79)
        at org.rascalmpl.semantics.dynamic.Import.loadModule(Import.java:319)
        at org.rascalmpl.semantics.dynamic.Import.importModule(Import.java:240)
        at org.rascalmpl.semantics.dynamic.Import$Default.interpret(Import.java:206)
        at org.rascalmpl.semantics.dynamic.Command$Import.interpret(Command.java:81)
        at org.rascalmpl.interpreter.Evaluator.eval(Evaluator.java:1106)
        at org.rascalmpl.interpreter.Evaluator.eval(Evaluator.java:976)
        at org.rascalmpl.interpreter.Evaluator.eval(Evaluator.java:931)
        at org.rascalmpl.repl.RascalInterpreterREPL.evalStatement(RascalInterpreterREPL.java:131)
        at org.rascalmpl.repl.BaseRascalREPL.handleInput(BaseRascalREPL.java:106)
        at org.rascalmpl.vscode.lsp.terminal.LSPTerminalREPL$1.handleInput(LSPTerminalREPL.java:192)
        at org.rascalmpl.repl.BaseREPL.handleInput(BaseREPL.java:180)
        at org.rascalmpl.repl.BaseREPL.handleCommandQueue(BaseREPL.java:420)
        at org.rascalmpl.repl.BaseREPL.run(BaseREPL.java:337)
        at org.rascalmpl.vscode.lsp.terminal.LSPTerminalREPL.main(LSPTerminalREPL.java:261)
|prompt:///|(0,18,<1,0>,<1,18>): Could not import module FuzzyWuzzy: Cannot link method rascalJava.FuzzyWuzzyBinding because: class not found
Advice: |http://tutor.rascal-mpl.org/Errors/Static/ModuleImport/ModuleImport.html|
ok
rascal>
```