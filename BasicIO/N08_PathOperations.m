%% Creating a Path
% JAVA code
% Path p1 = Paths.get("/tmp/foo");
% Path p2 = Paths.get(args[0]);
% Path p3 = Paths.get(URI.create("file:///Users/joe/FileTest.java"));
% Path p4 = FileSystems.getDefault().getPath("/users/sally");
% Path p5 = Paths.get(System.getProperty("user.home"),"logs", "foo.log");

p1 = java.nio.file.Paths.get('/tmp/foo', javaArray('java.lang.String', 0));
p4 = java.nio.file.FileSystems.getDefault.getPath('/user/sally', javaArray('java.lang.String', 0));
p5_java = java.nio.file.Paths.get(java.lang.System.getProperty('user.home'), 'logs\foo.log');
p5_matlab = java.nio.file.Paths.get(getenv('USERPROFILE'), 'logs\foo.log'); % Only for Windows, else getenv('HOME');


%% Retrieving Information about a Path
% Path path = Paths.get("C:\\home\\joe\\foo");
% System.out.format("toString: %s%n", path.toString());
% System.out.format("getFileName: %s%n", path.getFileName());
% System.out.format("getName(0): %s%n", path.getName(0));
% System.out.format("getNameCount: %d%n", path.getNameCount());
% System.out.format("subpath(0,2): %s%n", path.subpath(0,2));
% System.out.format("getParent: %s%n", path.getParent());
% System.out.format("getRoot: %s%n", path.getRoot());

path = java.nio.file.Paths.get(getenv('USERPROFILE'), javaArray('java.lang.String', 0));
disp(['toString: ' char(path.toString)]);
disp(['getFileName: ' char(path.getFileName)]);
disp(['getName: ' char(path.getName(0))]);
disp(['getNameCount: ' num2str(path.getNameCount)]);
disp(['subpath(0,2): ' char(path.subpath(0,2))]);
disp(['getParent: ' char(path.getParent)]);
disp(['getRoot: ' char(path.getRoot)]);
disp(['toUri: ' char(path.toUri )]);
disp(['toAbsolutePath: ' char(path.toAbsolutePath)]);
% disp(['toRealPath: ' char(path.toRealPath)]); doesn't work