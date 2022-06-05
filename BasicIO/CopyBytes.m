% https://docs.oracle.com/javase/tutorial/essential/io/bytestreams.html

fileName = 'xanadu.txt';
in = java.io.FileInputStream(fileName);
out = java.io.FileOutputStream('outagain.txt');

while true
    c = in.read;
    if c ~= -1
        out.write(c);
    else
        break;
    end
end

in.close;
out.close;

% ORIGINAL CODE:
%
% import java.io.FileInputStream;
% import java.io.FileOutputStream;
% import java.io.IOException;
% 
% public class CopyBytes {
%     public static void main(String[] args) throws IOException {
% 
%         FileInputStream in = null;
%         FileOutputStream out = null;
% 
%         try {
%             in = new FileInputStream("xanadu.txt");
%             out = new FileOutputStream("outagain.txt");
%             int c;
% 
%             while ((c = in.read()) != -1) {
%                 out.write(c);
%             }
%         } finally {
%             if (in != null) {
%                 in.close();
%             }
%             if (out != null) {
%                 out.close();
%             }
%         }
%     }
% }