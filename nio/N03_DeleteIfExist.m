function result = N03_DeleteIfExist(fileName)

% Delete function in MATLAB often fails, this function is worth trying.

filePath = java.nio.file.Paths.get(fileName, javaArray('java.lang.String', 0));
try
    result = javaMethod('deleteIfExists', 'java.nio.file.Files',filePath);
    result = double(result);
catch
    result = 3;
end

end