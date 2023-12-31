#!/usr/bin/env perl

mkdir "build" unless -d "build";

my $status = system "javac -verbose -d build -classpath ./lib/ave.jar:./lib/toniclf.jar:./lib/substance.jar:./lib/dynamic_typed_wsl.jar:./lib/simple_typed_wsl.jar:./lib/weak_unsafe_typed_wsl.jar:./lib/strong_unsafe_typed_wsl.jar:./lib/xercesImpl.jar:./lib/xmlParserAPIs.jar:./lib/stringsearch.jar:./lib/sve.jar:./lib/zvtm.jar fme/*.java fme/components/*.java fme/config/*.java fme/gui/*.java fme/logging/*.java fme/components/abstraction/*.java fme/components/actionsystemcallgraph/*.java fme/components/catalogue/*.java fme/components/console/*.java fme/components/editor/*.java fme/components/functionprocedurecallgraph/*.java fme/components/historygraph/*.java fme/components/tree/*.java fme/components/editor/dialogs/*.java fme/wsl/ast/*.java fme/wsl/lexer/*.java fme/wsl/tables/*.java";

if ($status) {
 die "problem with the build";
 }
 
system "jar cvfm lib/fme.jar res/manifest/MANIFEST.MF -C build/ .";

print $status;





