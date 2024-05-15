function N02_ReplaceZipEntry(zipFileName, entryName)
% Quickly replace existing entry Using java.nio.file.FileSystems

entryFilePath = java.nio.file.Paths.get(entryName, javaArray('java.lang.String', 0));
zipFilePath = java.nio.file.Paths.get(zipFileName, javaArray('java.lang.String', 0));

zipFileSystem = javaMethod('newFileSystem', 'java.nio.file.FileSystems', zipFilePath, []);
zipEntryPath = zipFileSystem.getPath(['/' entryName], javaArray('java.lang.String', 0));

copyOption = javaArray('java.nio.file.StandardCopyOption',1);
copyOption(1) = java.nio.file.StandardCopyOption.REPLACE_EXISTING;
javaMethod('copy', 'java.nio.file.Files', entryFilePath, zipEntryPath, copyOption)
zipFileSystem.close

end