fileName = fullfile(pwd, 'test.zip');
filePath = java.nio.file.Paths.get(fileName, javaArray('java.lang.String', 0));
url = java.net.URI(fileName);

url = java.net.URI.create("jar:file:C:/Users/jy7/OneDrive - Ricardo Plc/Main/UsingJavaInMatlab/nio/zipfstest.zip");
env = java.util.HashMap;
env.put("create", "true");
javaT.nio.file.FileSystems(filePath,env);