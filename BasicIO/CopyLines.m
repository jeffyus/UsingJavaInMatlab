fileName = 'xanadu.txt';
inputStream = java.io.BufferedReader(java.io.FileReader(fileName));
outputStream = java.io.PrintWriter(java.io.FileWriter("characteroutput.txt"));

while true
    l = inputStream.readLine;
    if isempty(l)
        break;
    else
        outputStream.println(l);
    end
end

inputStream.close;
outputStream.close;

% https://docs.oracle.com/javase/tutorial/essential/io/charstreams.html
% 
% /*
%  * Copyright (c) 1995, 2008, Oracle and/or its affiliates. All rights reserved.
%  *
%  * Redistribution and use in source and binary forms, with or without
%  * modification, are permitted provided that the following conditions
%  * are met:
%  *
%  *   - Redistributions of source code must retain the above copyright
%  *     notice, this list of conditions and the following disclaimer.
%  *
%  *   - Redistributions in binary form must reproduce the above copyright
%  *     notice, this list of conditions and the following disclaimer in the
%  *     documentation and/or other materials provided with the distribution.
%  *
%  *   - Neither the name of Oracle or the names of its
%  *     contributors may be used to endorse or promote products derived
%  *     from this software without specific prior written permission.
%  *
%  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
%  * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
%  * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
%  * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
%  * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
%  * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
%  * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
%  * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
%  * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
%  * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
%  * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%  */ 
% import java.io.FileReader;
% import java.io.FileWriter;
% import java.io.BufferedReader;
% import java.io.PrintWriter;
% import java.io.IOException;
% 
% public class CopyLines {
%     public static void main(String[] args) throws IOException {
% 
%         BufferedReader inputStream = null;
%         PrintWriter outputStream = null;
% 
%         try {
%             inputStream = new BufferedReader(new FileReader("xanadu.txt"));
%             outputStream = new PrintWriter(new FileWriter("characteroutput.txt"));
% 
%             String l;
%             while ((l = inputStream.readLine()) != null) {
%                 outputStream.println(l);
%             }
%         } finally {
%             if (inputStream != null) {
%                 inputStream.close();
%             }
%             if (outputStream != null) {
%                 outputStream.close();
%             }
%         }
%     }
% }